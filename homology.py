import matplotlib.pyplot as plt
import numpy as np
from numpy import sqrt, sign
from scipy.spatial import Voronoi
from sage.interfaces.magma_free import magma_free

import networkx as nx
from itertools import groupby


def lift_sqrt_along_path(f, xs, y0=None):
    ys = [None]*len(xs)
    val0 = np.polyval(f, xs[0])
    ys[0] = sqrt(val0) if y0 is None else y0
    for k in range(1, len(xs)):
        val = np.polyval(f, xs[k])
        r1 = sqrt(val)
        r2 = -r1
        ys[k] = r1 if abs(r1 - ys[k-1]) < abs(r2 - ys[k-1]) else r2
    return ys

# --- plotting ---
def plot_cycles(f, base_points, cycles):
    fig, ax = plt.subplots(figsize=(6,6))
    x_pts = [float(z.real) for z in base_points]
    y_pts = [float(z.imag) for z in base_points]
    ax.scatter(x_pts, y_pts, color='red', s=50, zorder=5, label='base points')
    # branch points
    branch_points = np.roots(f)
    ax.scatter([z.real for z in branch_points], [z.imag for z in branch_points], color="black", zorder=5)
    for i, z in enumerate(branch_points):
        ax.text(z.real, z.imag + 0.05, f"$e_{i + 1}$", ha="center")
    for i, z in enumerate(base_points):
        ax.text(float(z.real)+0.05, float(z.imag)+0.05, str(i), fontsize=10)
    for loop in cycles:
        loop_points = [base_points[i] for i in loop]
        xs = [float(z.real) for z in loop_points]
        ys = [float(z.imag) for z in loop_points]
        ax.plot(xs, ys, '-o', lw=2)
    ax.set_aspect('equal', adjustable='datalim')
    ax.grid(True)
    ax.legend()
    plt.show()

def cycle_signs(f, basepoints, cycle, npts = 200):
    yprev = None
    signs = [1]
    for k in range(len(cycle)-1):
        z1 = basepoints[cycle[k]]
        z2 = basepoints[cycle[k+1]]
        xs = [z1 + (z2-z1)*t/(npts-1) for t in range(npts)]
        ys = lift_sqrt_along_path(f, xs, yprev)
        xbranch = lambda t : z1 + (z2 - z1)*t
        def ybranch(t):
            yplus = sqrt(np.polyval(f, xbranch(t)))
            m = min(int(t*npts), npts - 1)
            if abs(ys[m] - yplus) < abs(ys[m] + yplus):
                return yplus
            else:
                return -yplus
        yprev = ybranch(1)
        s = sign(ybranch(1)/sqrt(np.polyval(f,xbranch(1))))
        if s.real > 0:
            signs.append(1)
        else:
            signs.append(-1)
    return signs

# return +1 if z1, z2, z3 are ccw around 0. -1 if cw around 0.
def localsign(z1,z2,z3):
    z1 = z1/abs(z1)
    z2 = z2/abs(z2)
    z3 = z3/abs(z3)
    return sign(z1.real*(z2.imag-z3.imag)+z2.real*(z3.imag - z1.imag) +z3.real * (z1.imag - z2.imag))

def cycles_intersection(f, basepoints, cycles):
    cs = [cycle_signs(f, basepoints, c) for c in cycles]
    k = len(cycles)
    intersection_matrix = [[0 for _ in range(k)] for _ in range(k)]
    for m in range(len(cycles)):
        for n in range(len(cycles)):
            c1 = cycles[m]
            c2 = cycles[n]
            s1 = cs[m]
            s2 = cs[n]
            pairing = float(0)
            l1 = len(c1) - 1
            l2 = len(c2) - 1
            for i in range(l1):
                for j in range(l2):
                    if c1[i] == c2[j] and s1[i] == s2[j]:
                        vprev = c1[(i-1) % l1]
                        v = c1[i]
                        vnext = c1[(i+1) % l1]
                        wprev = c2[(j-1) % l2]
                        wnext = c2[(j+1) % l2]
                        if vnext == vprev or wnext == wprev:
                            continue
                        if wprev != vprev and wprev != vnext:
                            pairing += 0.5*localsign(basepoints[vprev] - basepoints[v], basepoints[wprev] - basepoints[v], basepoints[vnext] - basepoints[v])
                        if wnext != vprev and wnext != vnext:
                            pairing += 0.5*localsign(basepoints[vprev] - basepoints[v], basepoints[vnext] - basepoints[v], basepoints[wnext] - basepoints[v])
            intersection_matrix[m][n] = int(np.rint(pairing))
    
    return intersection_matrix      

def homology_basis(f, avoid = [], realroots = False):
    roots = np.roots(f)
    roots.sort()
    siteslist = list(roots) + avoid
    
    if realroots:
        siteslist = siteslist + [z + 1j for z in siteslist] + [z - 1j for z in siteslist] + [1 + max(roots)]
    else:
        siteslist = siteslist + [2*z for z in siteslist]
    sites = np.array(list(map(lambda z : (z.real, z.imag), siteslist)), dtype=float)
    vor = Voronoi(sites)
    basepoints = [v[0] + v[1]*1j for v in vor.vertices]

    G = nx.Graph()

    # Add all finite vertices
    for i, v in enumerate(vor.vertices):
        G.add_node(i, coord=v)

    # Add finite edges
    for ridge in vor.ridge_vertices:
        if -1 in ridge:
            continue
        i, j = ridge
        length = np.linalg.norm(vor.vertices[i] - vor.vertices[j])
        G.add_edge(i, j, weight=length)

    start = int(np.argmax([min([np.abs(x[0] + x[1]*1j - a) for a in avoid]) for x in vor.vertices]))

    cycles = []
    if len(roots) % 2 == 0:
        d = 2
    else:
        d = 1
    for i in range(len(roots)-d):
        cycle = []
        i1 = vor.point_region[i]
        p = vor.points[i]
        verti = vor.regions[i1]
        verts = vor.vertices[verti]

        # Compute angles around p
        angles = np.arctan2(
            verts[:,1] - p[1],
            verts[:,0] - p[0]
        )

        orderedverts = [verti[j] for j in np.argsort(angles)]
        path1 = nx.shortest_path(G, start, orderedverts[-1], weight='weight')
        cycle = cycle + path1 + orderedverts
        path1.reverse()
        cycle = cycle + path1

        i2 = vor.point_region[i + 1]
        p = vor.points[i + 1]
        verti = vor.regions[i2]
        verts = vor.vertices[verti]

        # Compute angles around p
        angles = np.arctan2(
            verts[:,1] - p[1],
            verts[:,0] - p[0]
        )

        orderedverts = [verti[j] for j in np.argsort(angles)]
        path2 = nx.shortest_path(G, start, orderedverts[-1], weight='weight')
        cycle = cycle + path2 + orderedverts
        path2.reverse()
        cycle = cycle + path2
        cycles.append([key for key, _ in groupby(cycle)])
        
    return basepoints, cycles

def test3125():
    f = [4, 0, 0, 0, 0, -1]
    basepoints, cycles = homology_basis(f, [-1])
    intersection_matrix = cycles_intersection(f, basepoints, cycles)
    print("f: ", f)
    print("Basepoints: ")
    print(basepoints)
    print("Cycles: ")
    for c in cycles:
        print(c)
    print("Intersection matrix:")
    for row in intersection_matrix:
        print(row)
    plot_cycles(f, basepoints, cycles)

def testrealroots():
    f = [1, -10, 35, - 50, 24, 0]
    basepoints, cycles = homology_basis(f, [-1], True)
    intersection_matrix = cycles_intersection(f, basepoints, cycles)
    print("f: ", f)
    print("Basepoints: ")
    print(basepoints)
    print("Cycles: ")
    for c in cycles:
        print(c)
    print("Intersection matrix:")
    for row in intersection_matrix:
        print(row)
    plot_cycles(f, basepoints, cycles)
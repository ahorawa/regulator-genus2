from mpmath import mp, mpf, mpc, quad, sqrt, conj, log, pi, exp, sign, arg, inf
import numpy as np

from sage.interfaces.magma_free import magma_free
from sage.interfaces.gp import *
from sage.rings import real_mpfr

import homology

# set arbitrary precision
mp.dps = 20

# --- helpers ---
def mp_polyval(f, x):
    """Evaluate polynomial with coefficients f (descending) at x (mpf/mpc)."""
    y = mpf('0')
    for c in f:
        y = y*x + mpf(c)
    return y

def lift_sqrt_along_path(f, xs, y0=None):
    ys = [None]*len(xs)
    val0 = mp_polyval(f, xs[0])
    ys[0] = sqrt(val0) if y0 is None else y0
    for k in range(1, len(xs)):
        val = mp_polyval(f, xs[k])
        r1 = sqrt(val)
        r2 = -r1
        ys[k] = r1 if abs(r1 - ys[k-1]) < abs(r2 - ys[k-1]) else r2
    return ys

# --- cycle integrals with tanh-sinh ---
def cycle_integrals(f, omega, basepoints, cycles, npts=200):
    integrals = [mpc(0) for _ in cycles]
    for j, loop_indices in enumerate(cycles):
        yprev = None
        for k in range(len(loop_indices)-1):
            z1 = basepoints[loop_indices[k]]
            z2 = basepoints[loop_indices[k+1]]
            xs = [z1 + (z2-z1)*mpf(t)/(npts-1) for t in range(npts)]
            ys = lift_sqrt_along_path(f, xs, yprev)
            xbranch = lambda t : z1 + (z2 - z1)*t
            def ybranch(t):
                yplus = sqrt(mp_polyval(f, xbranch(t)))
                m = min(int(t*npts), npts - 1)
                if abs(ys[m] - yplus) < abs(ys[m] + yplus):
                    return yplus
                else:
                    return -yplus
            yprev = ybranch(1)
            integrand = lambda t: omega(xbranch(t), ybranch(t))*(z2 - z1)
            integrals[j] += quad(integrand, [0,1], method='tanh-sinh')
    return integrals

def bilinear_form(B, v, w):
    s = mpc(0)
    for i in range(len(v)):
        for j in range(len(w)):
            s += mpc(B[i,j])*v[i]*w[j]
    return s

def hermitian_form(B, v, w):
    s = mpc(0)
    for i in range(len(v)):
        for j in range(len(w)):
            s += mpc(B[i,j])*v[i]*conj(w[j])
    return s

def partial_period(f, a, omega):
    path = lambda t : a - t/(1 - t)
    dpath = lambda t : -1/(1 - t)**2
    npts = 200
    xs = [path((k + 1)/(npts + 1)) for k in range(npts)]
    ys = lift_sqrt_along_path(f, xs)
    def ybranch(t):
        yplus = sqrt(mp_polyval(f, path(t)))
        m = min(int(t*npts), npts - 1)
        if abs(ys[m] - yplus) < abs(ys[m] + yplus):
            return yplus
        else:
            return -yplus
    integrand = lambda t : omega(path(t),ybranch(t)) * dpath(t)
    return quad(integrand, [0, 1], method='tanh-sinh')

def poly_to_str(coeffs, var="x"):
    """
    Convert a list of coefficients [a_d, a_{d-1}, ..., a_0]
    to a human-readable polynomial string.
    """
    terms = []
    degree = len(coeffs) - 1
    
    for i, a in enumerate(coeffs):
        power = degree - i
        if a == 0:
            continue  # skip zero coefficients

        # Determine sign
        if a < 0:
            sign = " - " if terms else "-"
            a = -a
        else:
            sign = " + " if terms else ""

        # Determine coefficient string
        if a == 1 and power != 0:
            coeff_str = ""
        else:
            coeff_str = str(a)

        # Determine power string
        if power == 0:
            power_str = ""
        elif power == 1:
            power_str = var
        else:
            power_str = f"{var}^{power}"

        term = f"{sign}{coeff_str}{power_str}"
        terms.append(term)

    return "".join(terms) if terms else "0"

class HyperEllCurve:
    
    def __init__(self, f, realroots = False):
        self.f = f
        self.genus = (len(f) - 2)//2
        self.basepoints, self.cycles = homology.homology_basis(self.f, [], realroots = realroots)
        self.intersection_matrix = homology.cycles_intersection(self.f, self.basepoints, self.cycles)
        self.basepoints = [mpc(x) for x in self.basepoints]
        self._periods = None
        self._periods2 = None
        
    def _str_homology(self):
        str = "Homology basepoints:"
        str += f"\n {self.basepoints}"
        str += "\nHomology cycles:"
        for c in self.cycles:
            str += f"\n {c}"
        str += "\nIntersection matrix:"
        for row in self.intersection_matrix:
            str += f"\n{row}"
        return str
    
    def __str__(self):
        str = f"Genus {self.genus} curve: y^2 = " + poly_to_str(self.f)
        str += "\n" + self._str_homology()
        if not (self._periods is None):
            str += "\nPeriod matrix:"
            for p in self._periods:
                str += f"\n {p}"
        return str

    def plot_cycles(self):
        homology.plot_cycles(self.f, self.basepoints, self.cycles)

    def periods(self):
        if self._periods is None:
            self._periods = [cycle_integrals(self.f, lambda x,y: x**i/y, self.basepoints, self.cycles) for i in range(self.genus)]
        return self._periods    
    
    def periods2(self):
        if self._periods2 is None:
            self._periods2 = [cycle_integrals(self.f, lambda x,y: x**(self.genus + i)/y, self.basepoints, self.cycles) for i in range(self.genus)]
        return self._periods2    
    
    def derhamrational_test(self):
        print("The following should be rational numbers: ")
        B = np.linalg.inv(self.intersection_matrix)
        for p1 in self.periods():
            for p2 in self.periods2():
                print(bilinear_form(B, p1, p2)/2/pi/mpc(1j))
    
class PointedHyperEllCurve(HyperEllCurve):
    
    def __init__(self, f, points, realroots = False):
        self.f = f
        self.points = [mpc(p) for p in points]
        self.genus = (len(f) - 2)//2
        self.basepoints, self.cycles = homology.homology_basis(self.f, points, realroots = realroots)
        self.intersection_matrix = homology.cycles_intersection(self.f, self.basepoints, self.cycles)
        self.basepoints = [mpc(x) for x in self.basepoints]
        self._periods = None
        self._periods2 = None
        self._logperiods = None
        self._partialperiods = None

    def __str__(self):
        str = f"Pointed (x in {self.points}) genus {self.genus} curve: y^2 = " + poly_to_str(self.f)
        str += "\n" + self._str_homology()
        if not (self._periods is None):
            str += "\nPeriod matrix:"
            for p in self._periods:
                str += f"\n {p}"
        if not (self._logperiods is None):
            str += "\nLog-Period matrix:"
            for p in self._logperiods:
                str += f"\n {p}"
        if not (self._partialperiods is None):
            str += "\nPartial periods:"
            for p in self._partialperiods:
                str += f"\n {p}"
        return str
    
    def logperiods(self):
        if self._logperiods is None:
            self._logperiods = []
            for a in self.points:
                self._logperiods.append([cycle_integrals(self.f, lambda x,y : log(x - a)*x**i/y, self.basepoints, self.cycles) for i in range(self.genus)])
        return self._logperiods
    
    def partialperiods(self):
        if self._partialperiods is None:
            self._partialperiods = []
            for a in self.points:
                self._partialperiods.append([partial_period(self.f, a, lambda x,y : x**i/y) for i in range(self.genus)])
        return self._partialperiods

    def beilinson_matrix(self):
        self.periods()
        self.logperiods()
        self.partialperiods()
        B = np.linalg.inv(self.intersection_matrix)
        
        entry = lambda v, w, i, j : hermitian_form(B, v[i], w[j]) + hermitian_form(B, v[j], w[i])
        pairs = [(0,0), (0,1), (1,1)]
        mat = [[entry(self._periods, self._periods, i, j) for i,j in pairs]]
        for k in range(len(self.points)):
            bilinear_term = [entry(self._logperiods[k], self._periods, i, j) for i,j in pairs]
            pp = self._partialperiods[k]
            membrane_term = [2*pi*mpc(1j)* (pp[i]*conj(pp[j]) + conj(pp[i])*pp[j]) for i,j in pairs ]
            mat.append([b + m for b, m in zip(bilinear_term, membrane_term)])
  
        return mat
    
    
def parse_mpc(s):
    """
    Parse a string like:
    '-1.91... + 4.80...e-1*1j'
    into mpmath.mpc, handling scientific notation.
    """
    s = s.replace(" ", "")  # remove all spaces

    # purely imaginary?
    if s.endswith("*1j"):
        s = s[:-3]  # remove '*1j'
        for i in range(1, len(s), 1):
            if s[i] in "+-" and s[i-1] != 'E':
                split_idx = i
                break
        else:
            # no '+' or '-', purely imaginary
            return mpc(mpf(0), mpf(s))

        real_part = s[:split_idx]
        imag_part = s[split_idx:]
        return mpc(mpf(real_part), mpf(imag_part))
    else:
        # purely real
        return mpc(mpf(s), mpf(0))

def test3125():
    f = [4, 0, 0, 0, 0, -1]
    C = PointedHyperEllCurve(f, [-1])
    beilinson = C.beilinson_matrix()
    print(C)
    print("Beilinson matrix: ")
    for row in beilinson:
        print(row)
        
    lvalue = parse_mpc(magma_free("M := JacobiMotive([1/5,1/5,1/5], [3/5]); chi := Grossencharacter(M); L := LSeries(chi : Precision := " + str(mp.dps) + "); Evaluate(L,2);"))
    print("L(2): ", lvalue.real)
    RR = real_mpfr.RealField(int(mp.dps * log(10)/log(2)))
    print("lindep (L(2), pi * reg)", gp.lindep([RR(lvalue.real), RR(pi * beilinson[1][1].imag)], 10))

from regulator_integral_numpy import hyperell_integral

def test394():
    f = [-4, 0, 0, 1, 2, 1]
    C = PointedHyperEllCurve(f, [-1, -2])
    C.derhamrational_test()
    beilinson = C.beilinson_matrix()
    print(C)
    print("Beilinson matrix: ")
    for row in beilinson[:-1]:
        print(row)
    
    integrands = [lambda z : 1, lambda z : z.real, lambda z : np.abs(z)**2]
    old_beilinson = [[2*hyperell_integral(f, om)[0] for om in integrands]]
    old_beilinson.append([2*hyperell_integral(f, lambda z : np.log(np.abs(z + 1)) * om(z))[0] for om in integrands])
    print("Old Beilinson matrix: ")
    for row in old_beilinson:
        print(row)

test394()
#test3125()

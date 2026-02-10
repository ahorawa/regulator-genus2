
// Genus 2 curves downloaded from the LMFDB on 20 January 2026.
// Search link: https://www.lmfdb.org/Genus2Curve/Q/?search_type=
// Query "{}" was limited to 100/66158 curves, sorted by conductor.

// Each entry in the following data list has the form:
//    [Label, Class, Conductor, Rank*, Torsion, $\textrm{End}^0(J_{\overline\Q})$, Equation]
// For more details, see the definitions at the bottom of the file.

// To create a list of curves, type "curves:= make_data();"


columns := ["label", "class", "cond", "analytic_rank", "torsion_subgroup", "geom_end_alg", "eqn"];
data := [
[*"169.a.169.1", "169.a", 169, 0, "[19]", "M_2(Q)", [[0, 0, 0, 0, 1, 1], [1, 1, 0, 1]]*],
[*"196.a.21952.1", "196.a", 196, 0, "[6,6]", "M_2(Q)", [[1, 3, 6, 7, 6, 3, 1], [0, 1, 1]]*],
[*"249.a.249.1", "249.a", 249, 0, "[14]", "Q", [[0, 1, 1], [1, 0, 0, 1]]*],
[*"249.a.6723.1", "249.a", 249, 0, "[28]", "Q", [[2, 3, 1, 1, 0, -1], [1, 0, 0, 1]]*],
[*"256.a.512.1", "256.a", 256, 0, "[2,10]", "M_2(Q)", [[0, -1, 1, 1, -3, 2], [1]]*],
[*"277.a.277.1", "277.a", 277, 0, "[15]", "Q", [[0, -1, -1], [1, 1, 1, 1]]*],
[*"277.a.277.2", "277.a", 277, 0, "[5]", "Q", [[-6, 11, -19, 14, -9, 1], [1]]*],
[*"294.a.294.1", "294.a", 294, 0, "[12]", "Q x Q", [[0, 0, 1, 0, 1], [1, 0, 0, 1]]*],
[*"294.a.8232.1", "294.a", 294, 0, "[12]", "Q x Q", [[-14, -9, 4, 0, -2], [1, 0, 0, 1]]*],
[*"295.a.295.1", "295.a", 295, 0, "[14]", "Q", [[0, 0, -1], [1, 0, 0, 1]]*],
[*"295.a.295.2", "295.a", 295, 0, "[2]", "Q", [[-608, 389, 22, -40, 0, 1], [1, 1, 1]]*],
[*"324.a.648.1", "324.a", 324, 0, "[21]", "M_2(Q)", [[0, 0, 1, 2, 2, 1], [1, 1, 0, 1]]*],
[*"336.a.172032.1", "336.a", 336, 0, "[2]", "Q x Q", [[-56, 0, -75, 0, 15, 0, -1], [0, 1, 0, 1]]*],
[*"349.a.349.1", "349.a", 349, 0, "[13]", "Q", [[0, 0, -1, -1], [1, 1, 1, 1]]*],
[*"353.a.353.1", "353.a", 353, 0, "[11]", "Q", [[0, 0, 1], [1, 1, 0, 1]]*],
[*"360.a.6480.1", "360.a", 360, 0, "[2,2,8]", "Q x Q", [[-5, 0, 7, 0, -3], [0, 1, 0, 1]]*],
[*"363.a.11979.1", "363.a", 363, 0, "[2,10]", "Q x Q", [[0, 2, 4, 2, 0, 1], [1, 0, 1]]*],
[*"363.a.43923.1", "363.a", 363, 0, "[10]", "Q x Q", [[-2, 1, 10, -7, -13, 11], [0, 0, 1]]*],
[*"388.a.776.1", "388.a", 388, 0, "[21]", "Q", [[0, 1, 2, 0, -1], [1, 1, 0, 1]]*],
[*"389.a.389.1", "389.a", 389, 0, "[10]", "Q", [[7, 16, 0, -8, -2, 1], [0, 1, 0, 1]]*],
[*"389.a.389.2", "389.a", 389, 0, "[10]", "Q", [[0, 0, 1, 2, 2, 1], [1, 1]]*],
[*"394.a.394.1", "394.a", 394, 0, "[10]", "Q", [[-9, 17, 0, -12, 1, 2], [0, 1, 0, 1]]*],
[*"394.a.3152.1", "394.a", 394, 0, "[20]", "Q", [[0, 0, 0, 0, 0, -1], [1, 1]]*],
[*"400.a.409600.1", "400.a", 400, 0, "[3,6]", "M_2(Q)", [[1, 0, 4, 0, 4, 0, 1], []]*],
[*"427.a.2989.1", "427.a", 427, 0, "[14]", "Q", [[-4, 4, 4, -5, -1, 1], [1, 0, 0, 1]]*],
[*"448.a.448.2", "448.a", 448, 0, "[12]", "CM x Q", [[7, 0, 0, 0, -2], [0, 1, 0, 1]]*],
[*"448.a.448.1", "448.a", 448, 0, "[6]", "CM x Q", [[-7, 0, 0, 0, 1], [0, 1, 0, 1]]*],
[*"450.a.2700.1", "450.a", 450, 0, "[24]", "Q x Q", [[0, 1, 3, 3, 3, 1], [1, 0, 0, 1]]*],
[*"450.a.36450.1", "450.a", 450, 0, "[2,12]", "Q x Q", [[-16, -6, 28, -9, -4, 1], [1, 0, 0, 1]]*],
[*"461.a.461.1", "461.a", 461, 0, "[7]", "Q", [[-2, 3, 0, -3, 0, 1], [0, 0, 0, 1]]*],
[*"461.a.461.2", "461.a", 461, 0, "[]", "Q", [[-306, 272, 10, -39, -1, 1], [1]]*],
[*"464.a.464.1", "464.a", 464, 0, "[8]", "Q", [[0, 0, 0, -1, -2, -2, -1], [1, 1]]*],
[*"464.a.29696.1", "464.a", 464, 0, "[2,8]", "Q", [[0, 0, -2, -4, 3, 8], [1, 1]]*],
[*"464.a.29696.2", "464.a", 464, 0, "[2,2]", "Q", [[0, 1, 16, 72, 33, 4], [0, 1]]*],
[*"472.a.944.1", "472.a", 472, 0, "[2,8]", "Q", [[0, 1, 0, -2, -1, 1], [1, 0, 1]]*],
[*"472.a.60416.1", "472.a", 472, 0, "[8]", "Q", [[0, 0, 2, 4, 5, 8], [1, 1]]*],
[*"476.a.952.1", "476.a", 476, 0, "[3,6]", "Q x Q", [[54, -75, 25, 7, -5], [1, 0, 0, 1]]*],
[*"484.a.1936.1", "484.a", 484, 0, "[15]", "Q x Q", [[0, 0, 1, 0, 2, 0, 1], [1]]*],
[*"504.a.27216.1", "504.a", 504, 0, "[4,4]", "Q x Q", [[21, 0, 15, 0, 3], [0, 1, 0, 1]]*],
[*"523.a.523.1", "523.a", 523, 0, "[10]", "Q", [[0, 0, 0, -1, -1, 1], [1, 1]]*],
[*"523.a.523.2", "523.a", 523, 0, "[2]", "Q", [[0, -1, 21, -110, -31, 1], [0, 1]]*],
[*"529.a.529.1", "529.a", 529, 0, "[11]", "RM", [[0, 0, 0, 0, 0, -1], [1, 1, 0, 1]]*],
[*"555.a.8325.1", "555.a", 555, 0, "[2,10]", "Q", [[0, 1, 1, -4, -2, 3], [1, 1]]*],
[*"574.a.293888.1", "574.a", 574, 0, "[2,10]", "Q", [[1, 1, -3, 0, -1, 1], [0, 1, 1]]*],
[*"576.a.576.1", "576.a", 576, 0, "[10]", "M_2(Q)", [[0, -1, 0, -1], [1, 1, 1, 1]]*],
[*"576.b.147456.1", "576.b", 576, 0, "[4,4]", "M_2(Q)", [[1, 0, 2, 0, 2, 0, 1], []]*],
[*"578.a.2312.1", "578.a", 578, 0, "[12]", "Q x Q", [[0, 1, -2, 2, -2, 1], [0, 1, 1]]*],
[*"587.a.587.1", "587.a", 587, 1, "[]", "Q", [[0, -1, -1], [1, 1, 0, 1]]*],
[*"588.a.18816.1", "588.a", 588, 0, "[24]", "Q x Q", [[8, 12, 5, 0, 1, 1], [1, 0, 0, 1]]*],
[*"597.a.597.1", "597.a", 597, 0, "[7]", "Q", [[0, 1, 2, 3, 2, 1], [1]]*],
[*"600.a.18000.1", "600.a", 600, 0, "[2,2,6]", "Q x Q", [[0, -1, 1, 8, -18, 10], [0, 1]]*],
[*"600.a.96000.1", "600.a", 600, 0, "[2,6]", "Q x Q", [[0, 0, 2, 3, 5, 4], [1, 1]]*],
[*"600.b.30000.1", "600.b", 600, 0, "[2,8]", "Q x Q", [[-3, 0, 1, 0, 1], [0, 1, 0, 1]]*],
[*"600.b.450000.1", "600.b", 600, 0, "[2,2,8]", "Q x Q", [[-45, 0, 25, 0, -5], [0, 1, 0, 1]]*],
[*"603.a.603.1", "603.a", 603, 0, "[10]", "Q", [[0, 2, 4, 4, 8, 1], [1, 0, 1]]*],
[*"603.a.603.2", "603.a", 603, 0, "[10]", "Q", [[0, 1, 0, -1, 0, 1], [1, 0, 1]]*],
[*"604.a.9664.1", "604.a", 604, 0, "[]", "Q", [[-21, -53, -4, 48, 9, 4], [1, 1, 1]]*],
[*"604.a.9664.2", "604.a", 604, 0, "[27]", "Q", [[0, -1, 1, 1, -1], [1, 0, 0, 1]]*],
[*"630.a.34020.1", "630.a", 630, 0, "[2,2,4]", "Q x Q", [[15, -6, -23, 0, 10, 3], [0, 1, 1]]*],
[*"640.a.81920.1", "640.a", 640, 0, "[12]", "CM x Q", [[20, 0, 13, 0, 3], [0, 0, 0, 1]]*],
[*"640.a.81920.2", "640.a", 640, 0, "[12]", "CM x Q", [[-20, 0, 13, 0, -3], [0, 0, 0, 1]]*],
[*"644.a.2576.1", "644.a", 644, 0, "[6]", "Q x Q", [[-5, 11, -20, 20, -20, 11, -5], [0, 1, 1]]*],
[*"644.a.659456.1", "644.a", 644, 0, "[2]", "Q x Q", [[-3, -13, 4, 51, 4, -13, -3], [0, 1, 1]]*],
[*"644.b.14812.1", "644.b", 644, 0, "[10]", "Q", [[-1, -1, 5, -4, -1, 1], [1, 0, 0, 1]]*],
[*"672.a.172032.1", "672.a", 672, 0, "[4]", "Q x Q", [[56, 0, -75, 0, -16, 0, -1], [0, 1, 0, 1]]*],
[*"676.a.5408.1", "676.a", 676, 0, "[21]", "Q x Q", [[1, 3, 3, 1], [0, 1, 1, 1]]*],
[*"676.a.562432.1", "676.a", 676, 0, "[21]", "Q x Q", [[0, 2, 2, 4, 2, 2], [1, 0, 0, 1]]*],
[*"676.b.17576.1", "676.b", 676, 0, "[3,3]", "M_2(Q)", [[-1, 3, -6, 6, -6, 3, -1], [0, 1, 1]]*],
[*"686.a.686.1", "686.a", 686, 0, "[6]", "CM x Q", [[0, 1, 1, 2, 1, 1], [0, 1, 1]]*],
[*"688.a.2752.1", "688.a", 688, 0, "[20]", "Q", [[0, -1, 0, 4, -5, 2], [1]]*],
[*"688.a.704512.2", "688.a", 688, 0, "[10]", "Q", [[1, 4, 2, -8, -7, 2], []]*],
[*"688.a.704512.1", "688.a", 688, 0, "[10]", "Q", [[1, 2, 1, 4, 0, 2], []]*],
[*"691.a.691.1", "691.a", 691, 0, "[8]", "Q", [[0, 0, -1, -1, 0, 1], [1, 1]]*],
[*"704.a.45056.1", "704.a", 704, 0, "[2,6]", "Q", [[0, 0, -2, -1, 4, 4], [1]]*],
[*"708.a.2832.1", "708.a", 708, 0, "[10]", "Q", [[0, 0, 0, 0, 0, 1], [1, 1, 1]]*],
[*"708.a.19116.1", "708.a", 708, 0, "[10]", "Q", [[-1, 4, 4, 0, 0, -1], [1, 0, 0, 1]]*],
[*"708.a.181248.1", "708.a", 708, 0, "[2]", "Q", [[-36, -98, -41, 48, 9, -4, -1], [1, 0, 0, 1]]*],
[*"709.a.709.1", "709.a", 709, 0, "[8]", "Q", [[0, 1, -2, 0, 0, 1], [0, 1]]*],
[*"713.a.713.1", "713.a", 713, 1, "[]", "Q", [[0, -1, 0, 0, 0, -1], [1, 1, 0, 1]]*],
[*"713.b.713.1", "713.b", 713, 0, "[9]", "Q", [[0, 0, 0, 0, -1], [1, 1, 0, 1]]*],
[*"720.a.6480.1", "720.a", 720, 0, "[2,4]", "Q x Q", [[5, 0, 7, 0, 2], [0, 1, 0, 1]]*],
[*"720.b.116640.1", "720.b", 720, 0, "[2,12]", "Q x Q", [[-90, 0, 39, 0, -6], [0, 1, 0, 1]]*],
[*"726.a.1452.1", "726.a", 726, 0, "[10]", "Q x Q", [[0, -1, -2, 6, 2, 2], [1, 0, 1]]*],
[*"731.a.12427.1", "731.a", 731, 0, "[10]", "Q", [[-3, -1, 0, 0, 2, 1], [0, 0, 1, 1]]*],
[*"741.a.28899.1", "741.a", 741, 0, "[2,8]", "Q", [[0, 1, 2, 0, -1, -3], [1, 1]]*],
[*"743.a.743.1", "743.a", 743, 1, "[]", "Q", [[0, 0, 1, 0, -1], [1, 1, 0, 1]]*],
[*"745.a.745.1", "745.a", 745, 0, "[9]", "Q", [[0, -1], [1, 1, 0, 1]]*],
[*"762.a.3048.1", "762.a", 762, 0, "[12]", "Q", [[1, 1, 1], [0, 1, 1, 1]]*],
[*"762.a.82296.1", "762.a", 762, 0, "[2,12]", "Q", [[0, -1, 2, 14, -8, 1], [0, 1, 1]]*],
[*"763.a.763.1", "763.a", 763, 0, "[10]", "Q", [[0, -1, 2, 0, -2], [0, 1, 0, 1]]*],
[*"768.a.1536.1", "768.a", 768, 0, "[2,6]", "Q", [[0, 1, 0, -3, -1, 2], [1]]*],
[*"768.a.4608.1", "768.a", 768, 0, "[2,6]", "Q", [[-1, -1, -1, -1], [1, 1, 1, 1]]*],
[*"784.a.1568.1", "784.a", 784, 0, "[12]", "Q x Q", [[-2, 0, 3, 0, -2], [0, 1, 0, 1]]*],
[*"784.a.43904.1", "784.a", 784, 0, "[12]", "Q x Q", [[56, 0, 27, 0, 4], [0, 1, 0, 1]]*],
[*"784.b.12544.1", "784.b", 784, 0, "[2,6]", "Q x Q", [[-1], [0, 1, 0, 1]]*],
[*"784.b.25088.1", "784.b", 784, 0, "[2]", "Q x Q", [[-9, 41, -49, 2, 7, -3, -1], [1, 0, 1]]*],
[*"784.b.76832.1", "784.b", 784, 0, "[6]", "Q x Q", [[-9, 10, 0, -2, -4, 4, -1], [1, 1]]*],
[*"784.c.614656.1", "784.c", 784, 0, "[2,2]", "M_2(Q)", [[0, -1, -9, -13, -4, 1], []]*],
[*"797.a.797.1", "797.a", 797, 0, "[7]", "Q", [[0, 0, 0, 1, -1, 1], [1]]*],
[*"800.a.1600.1", "800.a", 800, 0, "[12]", "Q x Q", [[0, 0, -1, 0, -1], [1, 1, 1, 1]]*]
];
RecFormat := recformat<label,class,cond,analytic_rank,torsion_subgroup,geom_end_alg,eqn,curve>;


function create_record(row)
    out := rec<RecFormat|label:=row[1],class:=row[2],cond:=row[3],analytic_rank:=row[4],torsion_subgroup:=row[5],geom_end_alg:=row[6],eqn:=row[7]>;
    QQx<x> := PolynomialRing(Rationals());
    curve := HyperellipticCurve(QQx!(out`eqn[1]), QQx!(out`eqn[2]));
    out`curve := curve;
    return out;
end function;

function make_data()
    return [create_record(row) : row in data];
end function;


// Label --
//    The label of a genus 2 curve over $\Q$ has the form $N$.$s$.$D$.$n$, where

//     - $N$ is the conductor,
//     - $s$ is a string of letters that distinguishes this isogeny class among those with the same conductor,
//     - $D$ is the absolute discriminant, and
//     - $n$ is a positive integer that distinguishes the curve among other curves with the same absolute discriminant in the same isogeny class.

//    In particular, $N.s$ is the label of the isogeny class of the Jacobian of the curve. The values $s$ and $n$ are assigned as curves are added to the database and carry no intrinsic meaning


// Class --
//    The **isogeny class** (over a field $K$) of an abelian variety $A$ over a field $K$ is the set of isomorphism classes of abelian varieties over $K$ that are isogenous to $A$ (over $K$).

//    LMFDB entries for isogeny classes typically list only those elements of the isogeny class that are present in the LMFDB; for abelian varieties of dimension greater than 1 this means that the list of elements of the isogeny class will often be incomplete.

//    Isogeny class information listed on LMFDB pages for curves refer to the isogeny class of its Jacobian.



//Conductor (cond) --
//    The **conductor** $N$ of a genus 2 curve $X/\Q$ is the conductor of its Jacobian $\mathrm{Jac}(X)$.  This is a positive integer that divides the discriminant of $X$ and is divisible by every prime of bad reduction for $\mathrm{Jac}(X)$ (but not necessarily by every prime of bad reduction for $X$).

//    The valuation of $N$ at a prime $p$ satisfies the following bounds.
//    <table>
//    <tr><td>$p$:</td><td>$2$</td><td>$3$</td><td>$5$</td><td>$\ge 7$</td</tr>
//    <tr><td>$v_p(N)$:</td><td>$20$</td><td>$10$</td><td>$9$</td><td>$4$</td</tr>
//    </table>



//Rank* (analytic_rank) --
//    The **analytic rank** of an abelian variety is the analytic rank of its L-function $L(A,s)$.  The analytic rank of a curve is the analytic rank of its Jacobian.  The weak form of the BSD conjecture implies that the analytic rank is equal to the rank of the Mordell-Weil group of the abelian variety.

//    Analytic ranks are always computed under the assumption that $L(A,s)$ satisfies the Hasse-Weil conjecture (they are not necessarily well-defined otherwise).  When $A$ is defined over $\Q$, the parity of the analytic rank is always compatible with the sign of the functional equation.

//    In general, analytic ranks stored in the LMFDB are only upper bounds on the true analytic rank (they could be incorrect if $L(A,s)$ has a zero very close to but not on the central point).  For abelian varieties over $\Q$ of analytic rank less than 2 this upper bound is necessarily tight, due to parity.



//Torsion (torsion_subgroup) --
//    The **torsion subgroup** of an abelian variety over a number field  is the subgroup of elements of finite order; it is a finite group that is isomorphic to the direct sum of at most $2g$ cyclic groups, where $g$ is the dimension of the abelian variety.

//    The structure of the torsion subgroup can be compactly described by listing its sequence of elementary divisors $[d_1,\ldots,d_n]$, where each $d_i$ divides $d_{i+1}$, indicating a finite abelian group that is isomorphic to $\Z/d_1\Z\oplus \cdots \oplus\Z/d_n\Z$.


//$\textrm{End}^0(J_{\overline\Q})$ (geom_end_alg) --
//    The **geometric endomorphism algebra** of an abelian surface $A$ over a field $K$ is the $\Q$-algebra $\End(A_{\overline{K}}) \otimes \Q$, the endomorphism algebra of the base change $A_{\overline{K}}$ of $A$ to an algebraic closure $\overline{K}$ of $K$.  This is a special case of the geometric endomorphism algebra of an abelian variety.

//    When $A$ is an abelian surface over a number field $K$, there are nine possibilities for $\End(A_{\overline K})\otimes\Q$:

//    1. $\Q$;
//    2. a real quadratic field (in which case $A$ has **real multiplication**, denoted RM);
//    3. a quartic CM field (in which case $A$ has **complex multiplication**, denoted CM);
//    4. a non-split quaternion algebra over $\Q$ (in which case $A$ has **quaternionic multiplication**, denoted QM);
//    5. $\Q\times \Q$;
//    6. $F\times \Q$, where $F$ is a quadratic CM field (denoted $\mathrm{CM} \times \Q$);
//    7. $F_1\times F_2$, where $F_1$ and $F_2$ are distinct quadratic CM fields (denoted $\mathrm{CM} \times \mathrm{CM}$);
//    8. $\mathrm{M}_2(\Q)$;
//    9. $\mathrm{M}_2(F)$, where $F$ is a quadratic CM field (denoted $\mathrm{M}_2(\mathrm{CM})$).

//    The first four cases occur when $A$ is geometrically simple, while the last five cases occur when $A_{\overline K}$ is isogenous to a product of elliptic curves $E_1\times E_2$ over $\overline K$. Which of the last five cases occurs depends on whether $E_1$ and/or $E_2$ have complex multiplication, and whether $E_1$ and $E_2$ are isogenous or not.



//Equation (eqn) --
//    Every (smooth, projective, geometrically integral) hyperelliptic curve $X$ over $\Q$ of genus $g$ can be defined by an integral Weierstrass equation
//    $$y^2+h(x)y=f(x),$$
//    where $h(x)$ and $f(x)$ are integral polynomials of degree at most $g+1$ and $2g+2$, respectively.    Each such equation has a discriminant $\Delta$.  A **minimal equation** is one for which $|\Delta|$ is minimal among all integral Weierstrass equations for the same curve.  Over $\Q$, every hyperelliptic curve has a minimal equation.  The prime divisors of $\Delta$ are the primes of bad reduction for $X$.

//    The equation $y^2+h(x)y=f(x)$ uniquely determines a homogeneous equation of weighted degree 6 in variables $x,y,z$, where $y$ has weight $g+1$, while $x$ and $z$ both have weight 1: one homogenizes $h(x)$ to obtain a homogeneous polynomial $h(x,z)$ of degree $g+1$ and homogenizes $f(x)$ to obtain a homogeneous polynomial $f(x,z)$ of degree $2g+2$.  This yields a smooth projective model $y^2+h(x,z)y=f(x,z)$ for the curve $X$.

//    One can always transform the minimal equation into a simplified equation $y^2 = g(x) = 4f(x)+h(x)^2$, but this equation need not have minimal discriminant and may have bad reduction at primes that do not divide the minimal discriminant (it will always have bad reduction at the prime $2$).



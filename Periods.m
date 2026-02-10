function cplus(H)
	// Calculates c^+(H)
    
	assert(Type(H) eq CrvHyp);	// Assert H is an hyperelliptic curve over the rationals.
	assert(Type(BaseField(H)) eq FldRat);
    
    g := Genus(H);

	M := BigPeriodMatrix(AnalyticJacobian(H));
	MR := [[ Real(M[i][j]) : i in [1..g]] : j in [1..2*g]]; 
	rp := RealLatticeArea(Matrix(MR));

	return rp;

end function;

function cminus(H)
	// Calculates c^-(H) by just calculating c^+(H_(-1)), a quadratic twist of H by -1.

	assert(Type(H) eq CrvHyp);	// Assert H is an hyperelliptic curve over the rationals.
	assert(Type(BaseField(H)) eq FldRat);
    
    Htwist := QuadraticTwist(H, -1);
    
	return cplus(Htwist);
end function;
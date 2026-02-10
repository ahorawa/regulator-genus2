// f(x) polynomial defining C : y^2 = f(x) and O := Point at Infinity.

for x0 in [1 .. 1000] do
  y02 := Evaluate(f, x0);
  if IsSquare(y02) then
    _, y0 := IsSquare(y02);
    CK := C;
    K := Rationals();
  else 
    K<y0> := NumberField(x^2 - y02);
    CK := BaseChange(C, K);
  end if;
  J := Jacobian(CK);
  O := CK![1, 1, 0];
  ord := Order( J![CK![x0, y0, 1], O] );
  if not ord eq 0 then
    printf "x0 = %o, y0^2 = %o, y0 = %o\n", x0, y02, y0;  
    print ord;
  end if;
end for;

J := Jacobian(C);
ptsC := Points(C : Bound := 100);
N := #ptsC;

for i in [1 .. N] do
  for j in [1 .. i-1] do
    printf "P = %o, Q = %o\n", ptsC[i], ptsC[j];
    printf "Order(P - Q) = %o\n", Order(J!([ptsC[i], ptsC[j]]));
  end for;
end for;

for t in [1 .. 100] do
  C := HyperellipticCurve(x^6 + (x^2 + t*x + 1)^2);
  J := Jacobian(C);
  printf "For t = %o, Order(O^+ - O-) = %o\n", t, Order(J!([C![1,1, 0], C![1,-1,0]]));
end for;


for t in [1 .. 100] do
  printf "For t = %o ...\n", t;
  C := HyperellipticCurve(x^5 + (x^2 + t*x + 1)^2);
  J := Jacobian(C);
  ptsC := Points(C : Bound := 100);
  N := #ptsC;
  for i in [1 .. N] do
    for j in [1 .. i-1] do
      ord := Order(J!([ptsC[i], ptsC[j]]));
      if not ord eq 0 then
        printf "P = %o, Q = %o\n", ptsC[i], ptsC[j];
        printf "Order(P - Q) = %o\n", ord;
      end if;
    end for;
  end for;
  printf "--------\n";
end for;

for t in [1 .. 100] do
  printf "For t = %o ...\n", t;
  C := HyperellipticCurve(x^5 + (x^2 + t*x + t)^2);
  J := Jacobian(C);
  Order(J!([ptsC[i], ptsC[j]]));
function functie_ex1(A, B, C, D, x0, u)

syms s;

L = s * eye(3) - A;
L = inv(L);
Phi = ilaplace(L)
xl = Phi * x0
yl = C * xl
Ts = C * L * B + D
yf = ilaplace(Ts*u)

end
syms s t z;

A = [-1 0 0; -1 -2 -101; 1 1 0];
B = [0 1; 1 -1; 0 0];
C = [1 0 101];
D = [0 0];
h = 0.1;
u = [1, -2]';

Aux = s*eye(3) - A;
inversa = inv(Aux);
mt = ilaplace(inversa);
Ad = subs(mt, t, h);
Bd = int(mt, t, 0, h);
Bd = Bd * B;
Cd = C;
Dd = D;

Ad1 = double(Ad);
Bd1 = double(Bd);




[num1s, den1s] = ss2tf(A, B, C, D, 1);
H11s = tf(num1s, den1s);
H11z = c2d(H11s, h);
[num1z, den1z] = tfdata(H11z, 'v');

[num2s, den2s] = ss2tf(A, B, C, D, 2);
H12s = tf(num2s, den2s);
H12z = c2d(H12s, h);
[num2z, den2z] = tfdata(H12z, 'v');

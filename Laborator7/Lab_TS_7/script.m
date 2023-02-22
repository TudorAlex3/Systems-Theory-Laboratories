A = [0, 0, 0; 1, 0, -1; 0, 1, 2];
n = 3;
B = [0, -1; 1, 0; 0, 1];
C = [1, 0, 1];
Sd = [-1, -1, -1];
Se = [-2, -2, -2];
Rc = ctrb(A, B);
Ro = obsv(A,C);
n = 3;
m = 2;
p = 1;
R0 = [0,0,0;0,0,0;0,0,0];
v = [1;-2];

%P1
if (rank(Rc) < n || rank(Ro) < n)
    return
end
%P2
while(rank(R0) ~= n)
    g = rand(m,1);
    F0 = rand(m,n);
    A0 = A + B * F0;
    b0 = B * g;
    R0 = ctrb(A0,b0);
end
Xd = 1;
for i=1:size(Sd,2)
    Xd = Xd * (A0 -eye(3)*Sd(i));
end

R0 = pinv(R0);
q = R0(n,:);
f = -q * Xd;
F = F0 + g * f;
%P3 1)
A1 = A';
B1 = C';
R0 = [0,0,0;0,0,0;0,0,0]; 
while(rank(R0) ~= n)
    g = rand(p,1);
    F0 = rand(p,n);
    A0 = A1 + B1 * F0;
    b0 = B1 * g;
    R0 = ctrb(A0,b0);
end
Xe = 1;
for i=1:size(Se,2)
    Xe = Xe * (A0 -eye(3)*Se(i));
end

R0 = pinv(R0);
q = R0(n,:);
f = -q * Xe;
F1 = F0 + g * f;
L = F1';
%2)
J = A + L*C;
K = -L;
H = B;
M = eye(3);
N = [0;0;0];
%P4
Ac = J + H*F*M
Bc = K + H*F*N
Fc = F*M
Gc = F*N


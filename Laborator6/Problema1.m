A = [0, 0, 0; 1, 0, -1; 0, 1, 2];
B = [0, -1; 1, 0; 0, 1];
C = [1, 0, 1];
vd = [-1, -1, -1];
[n, m] = size(B);
G = eye(m);

%Se verifica daca (A,B) este controlabila
R = ctrb(A, B);
if (rank(R) ~= n)
    disp("perechea (A,B) nu este controlabila");
    return;
end

%Se genereaza g, F0
g = [1; 1];
F0 = zeros(m, n);

%Se calculeaza A0, b0
A0 = A + B * F0;
b0 = B * g;
    
%Se verifica daca (A0,b0) este controlabila
R0 = ctrb(A0, b0);
if(rank(R0) ~= n)
   disp("Fara solutie");
   return;
end

%Se calculeaza polinomul caracteristic
Xd = eye(n);
for i = 1:size(vd, 2)
    Xd = Xd * (A0 - eye(n) * vd(i));
end

R0 = inv(R0);
q = R0(n,:);
f = -q * Xd;
F = F0 + g * f;
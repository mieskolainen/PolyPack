% Symbolic associated Legendre polynomials P_l^m(x)
%
% l >= 0 and -l <= m <= l
%
% mikael.mieskolainen@cern.ch, 2018

function P = assolegendre(l,m)

syms x;
syms f(x);

% First part
a = (-1)^m/(2^l*factorial(l)) * (1 - x^2)^(m/2);

% Second part
f(x) = (x^2 - 1)^l;
b    = diff(f, x, l+m);

% Total
P = simplify(a*b);

end
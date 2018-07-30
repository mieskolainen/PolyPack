% Symbolic associated Laguerre polynomials L_m^n
%
% mikael.mieskolainen@cern.ch, 2018

function L = assolaguerre(m,n)

syms x;
syms f(x);

% First part
a = exp(x) * x^(-n) / factorial(m);

% Second part
f(x) = exp(-x) * x^(n+m);
b = diff(f, x, m);

% Total
L = simplify(a*b);

end
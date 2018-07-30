% Symbolic Laguerre polynomials of order n
%
% mikael.mieskolainen@cern.ch, 2018

function L = laguerrepoly(n)

syms x;
syms f(x);

% By Rodrigues formula

% First part
a = exp(x) / factorial(n);

% Second part
f(x) = exp(-x)*x^n;
b = diff(f, x, n);

% Total
L = simplify(a*b);

end
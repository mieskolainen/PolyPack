% Symbolic Legendre polynomials of order l
%
% mikael.mieskolainen@cern.ch, 2018

function P = legendrepoly(l)

syms x;
syms f(x);

% By Rodrigues formula

% First part
a = 1/(2^l * factorial(l));

% Second part
f(x) = (x^2 - 1)^l;
b    = diff(f, x, l);

% Total
P = simplify(a*b);

end
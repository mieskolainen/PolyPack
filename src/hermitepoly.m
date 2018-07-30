% Symbolic Hermite polynomial of order p
%
% mikael.mieskolainen@cern.ch, 2018

function H = hermitepoly(p)

syms x;
syms f(x);

% First part
a = (-1)^p * exp(x^2);

% Second part: d/dx^p exp(-x^2)
f(x) = exp(-x^2);
b = diff(f,x,p); % p-th derivative

% Total
H = simplify(a*b);

end
% Symbolic spherical harmonics (complex basis) Y_l^m(theta,phi)
%
% l >= 0, -l <= m <= l
%
% Y_l^m* (theta,phi) = (-1)^m Y_l^{-m} (theta,phi) 
%
% The normalization is the usual from Quantum Mechanics.
%
% mikael.mieskolainen@cern.ch, 2018

function Y = complexsphericalharm(l,m)

syms theta;
syms phi;
syms x;
syms PI;

% First part
a = (-1)^m * sqrt(((2*l+1)/(4*PI))) * sqrt(factorial(l-m)/factorial(l+m));

% Second part
Plm = assolegendre(l, m);
Plm = subs(Plm, x, cos(theta));

% Complex part
b = Plm * exp(1i*m*phi);

% Total
Y = simplify(a*b);

end
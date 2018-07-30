% Symbolic real basis spherical harmonics (tesseral spherical harmonics)
%
% sqrt(2) gives proper normalization \int |Y_l^m|^2 dOmega = 1
%
% Functions with negative m are rotated by 90 degrees w.r.t to functions
% with positive m.
%
%
% Expansion:
% f(theta,phi) = \sum_{l=0}^\infty \sum_{m=-l}^l f_l^m Y_l^m(theta,phi)
%
% N.B. These span the same functional space as the complex
% spherical harmonics.
%
% The normalization is the usual from Quantum Mechanics.
%
% mikael.mieskolainen@cern.ch, 2018

function Y = realsphericalharm(l,m)

syms theta;
syms phi;
syms x;
syms PI;

% First part
a = (-1)^m * sqrt(((2*l+1)/(4*PI))) * sqrt(factorial(l-abs(m))/factorial(l+abs(m)));

% Second part
Plm = assolegendre(l, abs(m));
Plm = subs(Plm, x, cos(theta));

% Total
if (m > 0)
    Y = sqrt(2) * a * Plm * cos(m*phi);
end
if (m == 0)
    Y = a * Plm; % This does not have sqrt(2).
end
if (m < 0)
    Y = sqrt(2) * a * Plm * sin(abs(m)*phi); % Note abs
end

Y = simplify(Y);

end
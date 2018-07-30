% Expand in a complex valued spherical harmonic basis with
% measurement(theta,phi) = \sum_{l=0}^\inf \sum_{m=-l}^l c_l^m x Y_l^m(theta,phi)
%
% Input:  theta = Coordinate point
%           phi = Coordinate point
%         coeff = Expansion coefficients (complex numbers)
%          lmax = Maximum expansion degree
%        active = Active expansion coefficients, (0,1) linearly indexed vector
%
% See https://en.wikipedia.org/wiki/Spherical_harmonics
%
% mikael.mieskolainen@cern.ch, 2018

function f = expandcomplexsh(theta, phi, coeff, lmax, active)

f = 0;
k = 1;

for l = 0:lmax
    for m = -l:l
        f = f + coeff(k) * complexsphnum(theta, phi, l, m) * active(k);
        k = k + 1;
    end
end

end
% Expand in a real valued spherical harmonic basis with
% measurement(theta,phi) = \sum_{l=0}\sum_{m=-l}^l c_lm x Y_R^{lm}(theta,phi)
%
% Input:  theta = Coordinate point
%           phi = Coordinate point
%         coeff = Expansion coefficients (real numbers)
%          lmax = Maximum expansion degree
%        active = Active expansion coefficients, (0,1) linearly indexed vector
%
% See https://en.wikipedia.org/wiki/Spherical_harmonics
%
% mikael.mieskolainen@cern.ch, 2018

function f = expandrealsh(theta, phi, coeff, lmax, active)

f = 0;
k = 1;

for l = 0:lmax
    for m = -l:l
        f = f + coeff(k) * realsphnum(theta, phi, l, m) * active(k);
        k = k + 1;
    end
end

end
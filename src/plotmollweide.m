% Plot in Mollweide projection
%
% Input:   theta  =  Vector of coordinate values in [0,pi]
%          phi    =  Vector of coordinate values in [0, 2pi]
%          Z      =  Function values for coordinates of (theta,phi) (N x M)
%
% Output:  h      =  Function handle
%
% Check that results are visually compatible with 
% cartesian (cos(theta),phi) plane (no sign flips etc.)
%
% mikael.mieskolainen@cern.ch, 07/2018

function h = plotmollweide(theta,phi,Z)

[theta_g, phi_g] = ndgrid(theta,phi); % Replicate
[x,y] = projmollweide(theta_g, phi_g);

h = surf(x, y, zeros(size(x)), Z);    % Color defined by Z
set(h, 'LineStyle', 'none');
campos([0 0 1]); camup([0 1 0]);      % Camera position
axis equal; axis off;

end
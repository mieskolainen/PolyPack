% Mollweide projection from spherical coordinates
% [theta,phi] -> [x,y] via Newton-Rhapson iteration
%
% see.
%      www.progonos.com/furuti/MapProj/Normal/CartHow/HowMoll/howMoll.html
%      en.wikipedia.org/wiki/Mollweide_projection
%
%      x with range [-2*R*sqrt(2), 2*R*sqrt2)]
%      y with range [-R*sqrt(2), R*sqrt(2)]
%
% mikael.mieskolainen@cern.ch, 07/2018

function [x, y] = projmollweide(theta, phi)

% Map the range
theta = pi/2 - theta; % [0,pi]  -> [-pi2/pi2]
phi   = phi - pi;     % [0,2pi] -> [-pi,pi]

% Initial estimate and stopping conditions
th = theta;
MAXITER = 1e4;
EPS = 1e-9;

% Newton-Rhapson iterations
for k = 1:MAXITER

    % Protection for zero division
    denom = (2 + 2*cos(th));
    denom(abs(denom) < EPS) = EPS;
    
    % Update
    Dth = (2*th + sin(2*th) - pi * sin(theta)) ./ denom;
    th  = th - Dth;
    
    if ( max(abs(Dth)) < EPS)
        break;
    end
end

% Final mapping
R = 1; % just scale
x  = R * (2 * sqrt(2) / pi) .* phi .* cos(th);
y  = R * sqrt(2) .* sin(th);

end
% Synthesize CMB style radiation on sphere
%
% mikael.mieskolainen@cern.ch, 2018
clear;
close all;
addpath ./src

f1 = figure;
f2 = figure;

N    = 9;   % Number of simulations
reso = 160; % Discretization (visualization) resolution
lmax = 10;  % Maximum angular order

% Create symbolic functions
%createrealsh(lmax);

for kk = 1:N
    
fprintf('Simulation %d/%d \n', kk, N);

% Create random expansion coefficients
% (a toy distribution for now here - make it physical)
coeff  = randn((lmax+1)*(lmax+1),1); coeff(1) = 1; % "DC-level"
active = ones(size(coeff));

% Linear discretization of costheta and phi
costheta = linspace(-0.9999, 0.9999, reso);
phi      = linspace(0, 2*pi, reso);

% Loop over values
Z = zeros(length(phi), length(costheta));
for i = 1:length(costheta)
    for j = 1:length(phi)
        Z(j,i) = expandrealsh(acos(costheta(i)), phi(j), coeff, lmax, active);
        
        % Geometric detector acceptance cutoff (in lab Lorentz frame)
        %{
        if (acos(costheta(i)) < pi/4 || acos(costheta(i)) > 3*pi/4)
            Z(j,i) = 0;
        end
        %}
    end
end

if (kk == 1)
LIM = max(abs(Z(:)))*0.8; % Colormap range
end

% Distribution in (costheta,phi)-coordinates
figure(f1);
subplot(sqrt(N), sqrt(N), kk);
imagesc(costheta, phi, Z); axis square; set(gca,'fontsize', 7);

xlabel('cos$(\theta)$','interpreter','latex');
ylabel('$\phi$ (rad)','interpreter','latex');
%colormap(hot(100)); %colorbar;
set(gca,'YDir','normal');
caxis([-LIM LIM]); % colormap range

% Distribution in Molweide projection
figure(f2);
subplot(sqrt(N), sqrt(N), kk);
h = plotmollweide(acos(costheta), phi, Z);
caxis([-LIM LIM]); % colormap range

end

%% Print out results

filename = sprintf('cylinder_radiation_lmax_%d', lmax);
print(f1, sprintf('./figs/%s.pdf', filename), '-dpdf');
print(f1, sprintf('./figs/%s.png', filename), '-dpng');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);

filename = sprintf('mollweide_radiation_lmax_%d', lmax);
print(f2, sprintf('./figs/%s.pdf', filename), '-dpdf');
print(f2, sprintf('./figs/%s.png', filename), '-dpng');
cmd = sprintf('pdfcrop --margins 2 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);


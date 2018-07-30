% One Dimensional (=QM) Quantum Field Theory visualized
%
% See https://aip.scitation.org/doi/pdf/10.1063/1.1666302
% G.Parisi, F.Zirilli, Anomalous Dimensions in one-dimensional quantum
% field theory
%
% mikael.mieskolainen@cern.ch, 07/2018
clear;
close all;

% Eigenvalues E_n
E_n = @(n,m,a) m*(2*n + a + 1);

% Eigenfunctions psi_n(x)
psi_n = @(x,n,m,a) (4*m)^(1/4) * sqrt(gamma(n+1)/(gamma(a+n+1))) * ...
            (m*x.^2).^((2*a+1)/4) .* exp(-m*x.^2/2) .* laguerreL(n,a,m*x.^2);


%% 
close all;

g = 0.1; % Coupling (minimum -1/8)
a = 0.5 * (1 + 8*g)^0.5;
m = 0.1;

x = linspace(-10,10,4e2);
f = figure;

% Plot over eigenfunctions
legs = {};
for n = 0:5
    subplot(1,2,1);
    psival = psi_n(x,n,m,a);
    plot(x, psival, 'linewidth', 1.2); hold on; axis square;
    xlabel('$x$','interpreter','latex');
    ylabel('$\psi_n(x)$','interpreter','latex');
    
    subplot(1,2,2);
    plot(x, abs(psival).^2, 'linewidth', 1.2); hold on; axis square;
    xlabel('$x$','interpreter','latex');
    ylabel('$|\psi_n(x)|^2$','interpreter','latex');
    
    legs{end+1} = sprintf('$E_{%d}=%0.2f$', n, E_n(n,m,a));
end
l = legend(legs); set(l,'interpreter','latex');% legend('boxoff');
axis square;

filename = sprintf('1D_QFT');
print(f, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);


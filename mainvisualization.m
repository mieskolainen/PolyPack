% Physics polynomials generated (symbolically) and visualized.
%
% Run the whole file directly.
%
% mikael.mieskolainen@cern.ch, 06/2018

clear; close all;
addpath ./src


%% Hermite polynomials H_n(x)
close all;

pmax = 5;

H = {};
for p = 0:pmax
    H{p+1} = hermitepoly(p);
end

% Plot
f = figure;
xval = linspace(-1.5, 1.5, 1e3); legs = {};
for k = 1:length(H)
    plot(xval, H{k}(xval)); hold on; axis square;
    legs{k} = sprintf('$H_{%d}$', k-1);
end
axis([-1.5 1.5 -40 40]);
title('Hermite polynomials','interpreter','latex');
xlabel('$x$','interpreter','latex');
ylabel('$H_n(x)$','interpreter','latex');
l = legend(legs); set(l,'interpreter', 'latex'); axis square;

filename = sprintf('hermite');
print(f, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);


%% Laguerre polynomials L_n(x)
close all;

L = {};
for l = 0:6
    L{l+1} = laguerrepoly(l);
end

% Plot
xval = linspace(-2, 10, 1e2); legs = {};

f = figure;
for k = 1:length(L)
    plot(xval, L{k}(xval)); hold on; axis square;
    legs{k} = sprintf('$L_{%d}$', k-1);
end
title('Laguerre polynomials','interpreter','latex');
xlabel('$x$','interpreter','latex');
ylabel('$L_n(x)$','interpreter','latex');
l = legend(legs); set(l,'interpreter', 'latex');

filename = sprintf('laguerrepoly');
print(f, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);


%% Associated Laguerre polynomials L_m^{(n)}(x)

close all;
f = figure;

maxm = 3;
maxn = 3;
%createassolaguerre(maxm, maxn);

xval = linspace(-2,10,1e3);
legs = {};
for m = 0:3
    for n = 0:3
        y = zeros(size(xval));
        for i = 1:length(xval)
            y(i) = aspnum(xval(i), m, n);
        end
        plot(xval, y); hold on;
    legs{end+1} = sprintf('$L_%d^{(%d)}$', m, n);
    end
end
axis square;
l = legend(legs); set(l,'interpreter','latex');

title('Generalized Laguerre polynomials','interpreter','latex');
xlabel('$x$','interpreter','latex');
ylabel('$L_m^{(n)}(x)$','interpreter','latex');
l = legend(legs); set(l,'interpreter', 'latex');

filename = sprintf('genlaguerrepoly');
print(f, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);


%% Cylindrical Transverse Electromagnetic Modes (TEM) - no electric or
% magnetic field in the direction of propagation. The boundary conditions
% provide quantization.

close all;

rho = @(r,w) 2*r.^2 / w^2;

w   = 0.5; % Spot size
I0  = 1;   % Intensity

% Degree and order
pmax = 4;
lmax = 4;
%createassolaguerre(pmax, lmax);

xval = linspace(-1,1,3e2);
yval = linspace(-1,1,3e2);

f = figure;

k = 1;
for p = 0:pmax
    for l = 0:lmax
        subplot(pmax+1,lmax+1,k);
        Z = zeros(length(xval), length(yval));
        for i = 1:length(xval)
            for j = 1:length(yval)
                r = sqrt(xval(i)^2 + yval(j)^2);
                phi = atan2(yval(j), xval(i));
                Z(j,i) = I0 * rho(r,w)^l * (aspnum(rho(r,w), p, l))^2 * cos(l*phi)^2 * exp(-rho(r,w));
            end
        end
        imagesc(xval, yval, Z); colormap(hot); axis square; set(gca,'fontsize',4);
        title(sprintf('$\\langle %d%d \\rangle$', p,l), 'interpreter','latex','color',[1 1 1]);
        k = k + 1;
    end
end
set(gcf,'color',[0 0 0]);
filename = sprintf('TEM');
print(f, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);


%% Associated Legendre polynomials P_l^{(m)}(x)
close all;

rval = linspace(-1,1,1e3);
lmax = 6;

for m = 0:2
    f = figure;
    legs = {};
    visualmax = 0;
    for l = 0:lmax
        fun = assolegendre(l,m);
        y = fun(rval);
        plot(rval, y); hold on; axis square;
        xlabel('$x$','interpreter','latex');
        ylabel('$P_l^{(m)}(x)$','interpreter','latex');
        legs{end+1} = sprintf('$P_{%d}^{(%d)}$', l, m);
        if (max(abs(double(y))) > visualmax)
            visualmax = max(abs(double(y)));
        end
    end
    axis([-1 1 -visualmax visualmax]);
    title('Associated Legendre polynomials','interpreter','latex');
    l = legend(legs); set(l,'interpreter','latex');
    drawnow;
    
    filename = sprintf('assolegendre_m%d', m);
    print(f, sprintf('./figs/%s.pdf', filename), '-dpdf');
    cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);
end


%% Legendre polynomials P_l(x)
close all;

L = {};
for l = 0:6
    L{l+1} = legendrepoly(l);
end

% Plot
xval = linspace(-1,1,100); legs = {};

f = figure;
for k = 1:length(L)
    plot(xval, L{k}(xval)); hold on; axis square;
    legs{k} = sprintf('$P_{%d}$', k-1);
end
title('Legendre polynomials','interpreter','latex');
xlabel('$x$','interpreter','latex');
ylabel('$P_{l}(x)$','interpreter','latex');
l = legend(legs); set(l,'interpreter', 'latex');

filename = sprintf('legendrepoly');
print(f, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);



%% Real basis representation of Spherical harmonics Y_R^{lm}(theta,phi)
close all;

lmax = 2;
mode = 1;
resolution = 50;
init = false; % Create symbolic functions from scratch
[fRE, ~, ~] = plotsh(lmax, mode, resolution, init);

filename = sprintf('spherical_realbasis_lmax_%d', lmax);
print(fRE, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);


%% Complex basis representation of Spherical harmonics Y_l^{(m)}(theta,phi)
close all;

lmax = 2;
mode = 2;
resolution = 50;
init = false; % Create symbolic functions from scratch
[fRE, fIM, fA2] = plotsh(lmax, mode, resolution, init);

filename = sprintf('spherical_complexbasis_RE_lmax_%d', lmax);
print(fRE, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);

filename = sprintf('spherical_complexbasis_IM_lmax_%d', lmax);
print(fIM, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);

filename = sprintf('spherical_complexbasis_A2_lmax_%d', lmax);
print(fA2, sprintf('./figs/%s.pdf', filename), '-dpdf');
cmd = sprintf('pdfcrop --margins 10 ./figs/%s.pdf ./figs/%s.pdf', filename, filename); system(cmd);


% Visualize Spherical Harmonics
%
% Input:
%    lmax = Maximum polynomial degree (use even number) (e.g. 4)
%    mode = 1 for real basis, 2 for complex basis spherical harmonics
%    reso = Discretization resolution (say e.g. 100)
%    init = Create symbolic functions (false if those are ready)
%  active = Active list of coefficients (0,1) vector (optional)
%
% Output:
%     fRE = Figure handle for real part (mode 1)
%     fIM = Figure handle for imag part (mode 2)
%     fA2 = Figure handle for amplitude squared (mode 2)
%
% mikael.mieskolainen@cern.ch, 06/2018

function [fRE, fIM, fA2] = plotsh(lmax, mode, reso, init, active)

fRE = 0;
fIM = 0;
fA2 = 0;

% Create function which evaluates spherical harmonics
if (mode == 1 && init)
    createrealsh(lmax);
end
if (mode == 2 && init)
    createcomplexsh(lmax);
end

% Create linear indices for l = 0...lmax, m = -l,...,l
p = 1;
for l = 0:lmax
    for m = -l:l
        lm(p,:) = [l m];
        p = p + 1;
    end
end

% If no active list
if (nargin == 4)
    active = ones(size(lm,1),1);
end

% Discretization of cos(theta) and phi linearly
xval = linspace(-0.999, 0.999, reso);
yval = linspace(0, 2*pi, reso);

% Real, Imag and |A|^2
fRE = figure;%('units','normalized','outerposition',[0 0 1 1]);

if (mode == 2)
fIM = figure;%('units','normalized','outerposition',[0 0 1 1]);
fA2 = figure;%('units','normalized','outerposition',[0 0 1 1]);
end

% Loop over (l,m) values
for p = 1:size(lm,1)
    
    Z = zeros(length(yval), length(xval));
    for x = 1:length(xval)     % cos(theta)
        for y = 1:length(yval) % phi
            
            if (mode == 1)
                Z(y, x) = realsphnum(acos(xval(x)), yval(y), lm(p,1), lm(p,2));
            end
            if (mode == 2)
                Z(y, x) = complexsphnum(acos(xval(x)), yval(y), lm(p,1), lm(p,2));   
            end
        end
    end
    titlestr = sprintf('$lm = (%d,%d)$', lm(p,1), lm(p,2));
    
    if (mode == 1)
        
        figure(fRE);
        ax = subplot(lmax+1,lmax+1,p);
        h = imagesc(xval, yval, real(Z)); axis square;
        xlabel('cos$(\theta)$','interpreter','latex');
        ylabel('$\phi$','interpreter','latex');
        title(sprintf('$Y_{\\mathbf{R}}^{lm}$ %s', titlestr),'interpreter','latex');
        set(gca,'fontsize',6); set(gca,'YDir','normal');
        SetActiveColor(ax, active(p));
    end
    
    if (mode == 2)
        
        figure(fRE);
        ax = subplot(lmax+1,lmax+1,p);
        imagesc(xval, yval, real(Z)); axis square;
        xlabel('cos$(\theta)$','interpreter','latex');
        ylabel('$\phi$','interpreter','latex');
        title(sprintf('Re $Y_l^m$ %s', titlestr),'interpreter','latex');
        set(gca,'fontsize',6); set(gca,'YDir','normal');
        SetActiveColor(ax, active(p));
        
        figure(fIM);
        ax = subplot(lmax+1,lmax+1,p);
        imagesc(xval, yval, imag(Z)); axis square;
        xlabel('cos$(\theta)$','interpreter','latex');
        ylabel('$\phi$','interpreter','latex');
        title(sprintf('Im $Y_l^m$ %s', titlestr),'interpreter','latex');
        set(gca,'fontsize',6); set(gca,'YDir','normal');
        SetActiveColor(ax, active(p));
        
        figure(fA2);
        ax = subplot(lmax+1,lmax+1,p);
        imagesc(xval, yval, abs(Z)^2); axis square;
        xlabel('cos$(\theta)$','interpreter','latex');
        ylabel('$\phi$','interpreter','latex');
        title(sprintf('$|Y_l^m|^2$ %s', titlestr),'interpreter','latex');
        set(gca,'fontsize',6); set(gca,'YDir','normal');
        SetActiveColor(ax, active(p));
    end
    
end

end

% Set active colormap
function SetActiveColor(h, state)

if (state == true)
    cmap1 = hot(100);
    colormap(h, cmap1);
end
if (state == false)
    cmap1 = gray(100);
    colormap(h, cmap1); 
end

end

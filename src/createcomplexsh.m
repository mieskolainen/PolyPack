% Create complex basis spherical harmonic functions for numerical evaluation
%
% mikael.mieskolainen@cern.ch, 2018

function createcomplexsh(lmax)

fprintf('Creating complex basis spherical harmonic functions: complexsphnum() \n');

% Create complex valued spherical harmonic basis functions
FP  = fopen('complexsphnum.m','w');

fprintf(FP, 'function Y = complexsphnum(theta,phi,l,m) \n\n');
fprintf(FP, 'PI = pi; \n\n');

Y = {};
p = 1;

for l = 0:lmax
    fprintf('l = %d/%d \n', l, lmax);
    for m = -l:l
        Y{p} = complexsphericalharm(l,m);
        if (p == 1)
            fprintf(FP, 'if (l == %d && m == %d) \n', l,m);
        else
            fprintf(FP, 'elseif (l == %d && m == %d) \n', l,m);
        end
        fprintf(FP, 'Y = %s; \n', char(Y{p}) );
        p = p + 1;
    end
end
fprintf(FP, 'else \n');
fprintf(FP, 'fprintf(''Not found (l,m) = (%d,%d)\\n''); \n', l,m);
fprintf(FP, 'end \n');
fprintf(FP, '\nend\n');

end
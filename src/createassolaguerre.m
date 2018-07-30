% Create generalized (associated) Laguerre polynomial L_m^{n}
% evaluation functions for numerical evaluation
%
% mikael.mieskolainen@cern.ch, 2018
function createassolaguerre(maxm, maxn)

fprintf('Creating associated Laguerre polynomials: aspnum() \n');

FP  = fopen('aspnum.m','w');

fprintf(FP, 'function L = aspnum(x,m,n) \n\n');
fprintf(FP, 'PI = pi; \n\n');

Y = {};
p = 1;
for m = 0:maxm
    for n = 0:maxn
        Y{p} = assolaguerre(m,n);
        if (p == 1)
            fprintf(FP, 'if (m == %d && n == %d) \n', m,n);
        else
            fprintf(FP, 'elseif (m == %d && n == %d) \n', m,n);
        end
        fprintf(FP, 'L = %s; \n', char(Y{p}) );
        p = p + 1;
    end
end
fprintf(FP, 'else \n');
fprintf(FP, 'fprintf(''Not found (m,n) = (%d,%d)\\n''); \n', m,n);
fprintf(FP, 'end \n');
fprintf(FP, '\nend\n');

end
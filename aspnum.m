function L = aspnum(x,m,n) 

PI = pi; 

if (m == 0 && n == 0) 
L = 1; 
elseif (m == 0 && n == 1) 
L = 1; 
elseif (m == 0 && n == 2) 
L = 1; 
elseif (m == 0 && n == 3) 
L = 1; 
elseif (m == 0 && n == 4) 
L = 1; 
elseif (m == 1 && n == 0) 
L = 1 - x; 
elseif (m == 1 && n == 1) 
L = 2 - x; 
elseif (m == 1 && n == 2) 
L = 3 - x; 
elseif (m == 1 && n == 3) 
L = 4 - x; 
elseif (m == 1 && n == 4) 
L = 5 - x; 
elseif (m == 2 && n == 0) 
L = x^2/2 - 2*x + 1; 
elseif (m == 2 && n == 1) 
L = x^2/2 - 3*x + 3; 
elseif (m == 2 && n == 2) 
L = x^2/2 - 4*x + 6; 
elseif (m == 2 && n == 3) 
L = x^2/2 - 5*x + 10; 
elseif (m == 2 && n == 4) 
L = x^2/2 - 6*x + 15; 
elseif (m == 3 && n == 0) 
L = (3*x^2)/2 - 3*x - x^3/6 + 1; 
elseif (m == 3 && n == 1) 
L = 2*x^2 - 6*x - x^3/6 + 4; 
elseif (m == 3 && n == 2) 
L = (5*x^2)/2 - 10*x - x^3/6 + 10; 
elseif (m == 3 && n == 3) 
L = 3*x^2 - 15*x - x^3/6 + 20; 
elseif (m == 3 && n == 4) 
L = (7*x^2)/2 - 21*x - x^3/6 + 35; 
elseif (m == 4 && n == 0) 
L = 3*x^2 - 4*x - (2*x^3)/3 + x^4/24 + 1; 
elseif (m == 4 && n == 1) 
L = 5*x^2 - 10*x - (5*x^3)/6 + x^4/24 + 5; 
elseif (m == 4 && n == 2) 
L = (15*x^2)/2 - 20*x - x^3 + x^4/24 + 15; 
elseif (m == 4 && n == 3) 
L = (21*x^2)/2 - 35*x - (7*x^3)/6 + x^4/24 + 35; 
elseif (m == 4 && n == 4) 
L = 14*x^2 - 56*x - (4*x^3)/3 + x^4/24 + 70; 
else 
fprintf('Not found (m,n) = (4,4)\n'); 
end 

end

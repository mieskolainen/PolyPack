function Y = complexsphnum(theta,phi,l,m) 

PI = pi; 

if (l == 0 && m == 0) 
Y = (1/PI)^(1/2)/2; 
end 
if (l == 1 && m == -1) 
Y = -(6^(1/2)*exp(-phi*1i)*(1 - cos(theta)^2)^(1/2)*(1/PI)^(1/2))/4; 
end 
if (l == 1 && m == 0) 
Y = (3^(1/2)*cos(theta)*(1/PI)^(1/2))/2; 
end 
if (l == 1 && m == 1) 
Y = (6^(1/2)*exp(phi*1i)*(1 - cos(theta)^2)^(1/2)*(1/PI)^(1/2))/4; 
end 
if (l == 2 && m == -2) 
Y = -30^(1/2)*exp(-phi*2i)*(1/PI)^(1/2)*(cos(theta)^2/8 - 1/8); 
end 
if (l == 2 && m == -1) 
Y = -(30^(1/2)*exp(-phi*1i)*cos(theta)*(1 - cos(theta)^2)^(1/2)*(1/PI)^(1/2))/4; 
end 
if (l == 2 && m == 0) 
Y = (5^(1/2)*(1/PI)^(1/2)*((3*cos(theta)^2)/2 - 1/2))/2; 
end 
if (l == 2 && m == 1) 
Y = (30^(1/2)*exp(phi*1i)*cos(theta)*(1 - cos(theta)^2)^(1/2)*(1/PI)^(1/2))/4; 
end 
if (l == 2 && m == 2) 
Y = -(30^(1/2)*exp(phi*2i)*(1/PI)^(1/2)*(3*cos(theta)^2 - 3))/24; 
end 

end

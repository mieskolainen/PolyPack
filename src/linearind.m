% Return linear index for (l,m) pair
%
% mikael.mieskolainen@cern.ch, 2018
function index = linearind(l,m)

index = l*(l+1)+m + 1; % plus 1 for matlab indexing

end

function cmp=colCog(n);
% function colCog(n);
% Makes a Cyan Orange Gray colormap;

if nargin<1
  n=length(colormap);
end;

[cmp,hueout] = twohue(7/12,1/12,n,0.7,0,0.7,0.3,1);

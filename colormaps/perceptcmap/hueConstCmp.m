function [cmp,hsvOut] = lhsCmp(Hue,n,xs,vs,xv,vv,mv);
%function [cmp,hsvOut] = lhsCmp(Hue,n,low,satdrop,lumfull);
% Hue is from 0-1.  Other arguements are optional. 
%
% n is the colormap length (current colormap is default)
% low, satdrop, and lum full are all part of the color model.  
%
% - Hue is held constant.  
% - Value liearly interpolated from [0 valfull 1]  onto [vv 1 mv];
% - Saturation is  liearly interpolated from [0 satdrop 1]  onto [1 1
% vs];
%
% In general it is good to make valful>=satdrop otherwise there is a
% monochromatic region  between satdrop and valful.  
%
% in 1/12 increments hue is red, orange, yellow, yellow-green, green,
% blue-green, cyan, slate-blue, blue, purple, magenta, pink/red.
% Complements are 1/3 apart, opposites are of course 0.5 apart.
%
% Examples?  


if nargin<2
  n=[];
end;
if nargin<6
  vv=[];
end;
if nargin<5
  xv=[];
end;
if nargin<4
  vs=[];
end;
if nargin<3
  xs=[];
end;
if nargin<7
  mv=[];
end;
if isempty(vv)
  vv = 0.6;
end;
if isempty(xv)
  xv = 0.5;
end;
if isempty(vs)
  vs = 0;
end;
if isempty(xs)
  xs = 0.5;
end;
if isempty(mv)
  mv = 0.8;
end;
if isempty(n)
  n = length(colormap);
end;





h = [1  1]*Hue;
s = [1 1 vs];
y = [vv 1 mv]*1; 
if xv==1
  xv = 0.9999;
elseif xv*n<=1
  xv = 1.001*n;
end;

cmp(:,1) = interp1([1 n],h,1:n);
cmp(:,2) = interp1([1 n*(xs)+1e-10 n],s,1:n);
cmp(:,3) = interp1([1 n*xv n],y,1:n);
hsvOut = cmp;
cmp = hsv2rgb(cmp);


  
  
  
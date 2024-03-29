function [cmp,hsvOut] = twohue(Hue,Hue2,n,xs,vs,xv,vv,mv);
%function [cmp,hsvOut] = twohue(Hue,Hue2,n,xs,vs,xv,vv,mv);
% Hue is from 0-1.  Other arguments are optional. 
%
% n is the colormap length (current colormap is default)
% low, satdrop, and lum full are all part of the color model.  
%
% - Hue is held constant.  
% - Value liearly interpolated from [0 xv 1]  onto [vv 1 mv];
% - Saturation is  liearly interpolated from [0 xs 1]  onto [1 1
% vs];
%
%
% In general it is good to make valful>=satdrop otherwise there is a
% monochromatic region  between satdrop and valful.  
%
% in 1/12 increments hue is red, orange, yellow, yellow-green, green,
% blue-green, cyan, slate-blue, blue, purple, magenta, pink/red.
% Complements are 1/3 apart, opposites are of course 0.5 apart.
%
% Examples?  



if nargin<5
  vv=[];
end;
if nargin<4
  xv=[];
end;
if nargin<7
  vs=[];
end;
if nargin<6
  xs=[];
end;
if nargin<8
  vm=[];
end;


[cmp2,h1] = hueConstCmp(Hue2,floor(n/2),xs,vs,xv,vv,mv);
[cmp1,h2] = hueConstCmp(Hue,floor(n/2),xs,vs,xv,vv,mv);
cmp = [cmp1;flipud(cmp2)];
hsvOut = [h1;flipud(h2)];
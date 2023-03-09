function f = myfun1(x)
% myfun1 calculate smth difficult with exp, sqrt and power
f = exp(-x).*sqrt((x.^2+1)./(x.^4+0.2));

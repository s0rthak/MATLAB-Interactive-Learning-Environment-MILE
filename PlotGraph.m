function [] = PlotGraph(y,min,max)

syms x;
if nargin ==1
    ezplot(y);
elseif nargin == 3
ezplot(y,[min,max]);
end

% I can pass a one variable function
%I can also pass limits

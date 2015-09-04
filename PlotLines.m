function [] = PlotLines(x1,x2)
ylim auto;
m = ylim;
    line([x1 x1],m);
    if nargin == 2
        hold on;
        line([x2 x2],m);
    end
end
        
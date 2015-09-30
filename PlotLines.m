function [] = PlotLines(x1,x2)
ylim auto;
m = ylim;
    line([x1 x1],m,'Color',[1 0 0]);
    if nargin == 2
        hold on;
        line([x2 x2],m,'Color',[1 0 0]);
    end
end
        
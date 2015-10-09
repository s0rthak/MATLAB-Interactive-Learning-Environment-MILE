function Shade(x1,x2,x3)
ylim auto;
y = ylim;
%x1,x2 is Red region
%x2,x3 is Green Region
if(x1>x3) %if the Red and Green Region are interchanged
    x1=x1-x3;
    x3=x3+x1;
    x1=x3-x1;
    h1 = rectangle('Position',[x1 y(1) x2-x1 y(2)-y(1)],'FaceColor',[0 1 0]);
hold on;
h2= rectangle('Position',[x2 y(1) x3-x2 y(2)-y(1)],'FaceColor',[0.7 0 0]);
pause(1);
else
    h1 = rectangle('Position',[x1 y(1) x2-x1 y(2)-y(1)],'FaceColor',[0.7 0 0]); %Draws a rectangle of color Red
hold on;
h2= rectangle('Position',[x2 y(1) x3-x2 y(2)-y(1)],'FaceColor',[0 1 0]); %Draws a rectangle of color Green
pause(1); %Pause for Effect
end
end
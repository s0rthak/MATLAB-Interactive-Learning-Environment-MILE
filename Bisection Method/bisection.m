function p = bisection()
syms x;
y = x^3 -x -2;
a=-2;
b=2;
N= 27;
% provide the equation you want to solve with R.H.S = 0 form. 
% Write the L.H.S by using inline function
% Give initial guesses.
% Solves it by method of bisection.
% A very simple code. But may come handy

    p = (a + b)/2;
      
    for (i = 1:N)
        fa = subs(y,x,a);
        fp = subs(y,x,p);
        fprintf('%d \n',i);
        fprintf('x1:%8f \n',a);
        fprintf('x2:%8f \n',b);
        fprintf('mid:%8f \n\n',p);
   if fa*fp<0 
       b = p;
              
   else
       a = p;     
    end
    p = (a + b)/2; 
      
    end
end
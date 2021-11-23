clear;
clc;
f=@(x) x(1)*x(1)+x(2)*x(2)-2*x(1)*x(1)*x(2)*x(2);
df=@(x) [2*x(1)-2*x(1)*(x(2)*x(2));2*x(2)-2*x(2)*(x(1)*x(1))];

f2=@(x) x(1)*x(1)+x(2)*x(2);
df2=@(x) [2*x(1);2*x(2)];

f3=@(x) x(1)*x(1)+x(2)*x(2)-sin(x(1))+cos(x(2));
df3=@(x) [2*x(1)-cos(x(1));2*x(2)-sin(x(2))];

iteration=20;
interval=8;
optimalX=grad_descent(f2,df2,0,[-7;-8],iteration,interval);


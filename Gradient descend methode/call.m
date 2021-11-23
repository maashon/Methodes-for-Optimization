clear;
clc;
f=@(x) x(1)*x(1)+x(2)*x(2)-2*x(1)*x(1)*x(2)*x(2);
df=@(x) [2*x(1)-2*x(1)*(x(2)*x(2));2*x(2)-2*x(2)*(x(1)*x(1))];

f2=@(x) x(1)*x(1)+x(2)*x(2);
df2=@(x) [2*x(1);2*x(2)];

iteration=15;
optimalX=grad_descent(f2,df2,0,[4.5;3.86],iteration);


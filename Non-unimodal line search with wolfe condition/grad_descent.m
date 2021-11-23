function [ x ] = grad_descent(f,df,~,x0,iter,interval)
% f: vector->scalar objective function
% df: gradient function
% x0: starting point
% iter: number of iterations
% This method repeatedly (exactly "iter" times) performs a linesearch on f in the direction of steepest descent;
%		each iteration runs until the Armijo condition gets satisfied for some fixed parameter values.

%plotting the function
     a=linspace(-interval,interval,25);
     b=linspace(-interval,interval,25);
     for i=1:25
         for j=1:25
             z(i,j)=f([a(i);b(j)]);
         end
     end
     surf(a,b,z);
     hold on;

    c2 = 0.5;
    c1 = 0.2; 
    alpha = 1; %Maximal step length
	vals=zeros(iter,3);
    x = x0;
    for k = 1:iter
        p = -df(x); %Direction of (steepest) descent
        p = p / norm(p); %Normalized
        %function [ alpha ] = Wolfe_LineSearch(f, df, p, x, alpha, c1, c2)
        gamma = Wolfe_LineSearch(f,df,p,x,alpha,c1,c2); %Compute step length
        startingPoint=x;
        x = x + gamma*p;
        endPoint=x;
        %plotting the examined line in the current iteration
        pl=plot3([startingPoint(1),endPoint(1)],[startingPoint(2),endPoint(2)],[f(startingPoint),f(endPoint)],'Color','w');
        pl.LineWidth=2;
       % plotting point in the current iteration
        vals(k,1)=x(1);
        vals(k,2)=x(2);
        vals(k,3)=f(x);
        plot3(x(1),x(2),vals(k,3),'.','Color','r','MarkerSize',20);
    end
     
end

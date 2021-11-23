function [ x ] = grad_descent(f,df,~,x0,iter)
% f: vector->scalar objective function
% df: gradient function
% x0: starting point
% iter: number of iterations
% This method repeatedly (exactly "iter" times) performs a linesearch on f in the direction of steepest descent;
%		each iteration runs until the Armijo condition gets satisfied for some fixed parameter values.

%plotting the function
     a=linspace(-5,5,25);
     b=linspace(-5,5,25);
     for i=1:25
         for j=1:25
             z(i,j)=f([a(i);b(j)]);
         end
     end
     surf(a,b,z);
     hold on;


    rho = 0.5; %For the Armijo LS; usually 0.5..0.9
    c = 0.2; %For the Armijo LS; usually 0.01..0.2
    alpha = 0.8; %Maximal step length for the Armijo LS
	vals=zeros(iter,3);
    x = x0;
    for k = 1:iter
        p = -df(x); %Direction of (steepest) descent
        p = p / norm(p); %Normalized
        gamma = Armijo_LS(f,df,p,x,alpha,rho,c); %Compute step length
        startingPoint=x;
        x = x + gamma*p;
        endPoint=x;
        pl=plot3([startingPoint(1),endPoint(1)],[startingPoint(2),endPoint(2)],[f(startingPoint),f(endPoint)],'Color','w');
        pl.LineWidth=2;
        


        vals(k,1)=x(1);
        vals(k,2)=x(2);
        vals(k,3)=f(x);
        plot3(x(1),x(2),vals(k,3),'.','Color','r','MarkerSize',20);
    end
    
  
     
end

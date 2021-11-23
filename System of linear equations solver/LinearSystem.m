function [X] = LinearSystem(A,b,x0)
%Solving a system of linear equatoins with the help of conjugate gradient
%formulas are taken from the slides.

%setting the starting point the input starting ponit
X=x0;
stepNum=size(b,2);
% calculating the initial gradient (gradient) and conjugate direction (d)
gradient=A.*x0-b;
d=-gradient;
    
for k=1:stepNum-1
    gamma=-(d.'*gradient)/(d.'*A*d);
	% calculating the new point in the given iteration
    X=X+gamma*d;
	%calculating the gradient and conjugate directions for the next iteration
    gradient=A*X-b;
	
    betha=(d.'*A*gradient) / (d.'*A*d);
    d= -gradient + (betha*d);
	% checking if the gradient is zero , so that we know we have reached the minimum earlier
    if gradient==0
        break;
    end
end

end






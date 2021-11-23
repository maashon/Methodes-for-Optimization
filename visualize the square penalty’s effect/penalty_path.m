function [ x ] = penalty_path(f,h,rho,x0,iter)
    mul = 2;
    internal_limit = 25;
    tiledlayout(1,2)
    ax1 = nexttile;
    x = x0;
    for l=1:iter
        frho = @(x) f(x)+rho*sq_penalty(h,x);
        dfrho = @(x) cdiff(f,x)+rho*sq_penalty_grad(h,x);
        ddfrho = @(x) fHesse(dfrho,x);
        x = Newton(frho,dfrho,ddfrho,x,internal_limit);
        rho = rho*mul;
     
             A= linspace(-2,2,30);
             B = linspace(-2,2,30);
              Zmf = zeros(30,30);
                for m=1:30
                for n=1:30
                    Zmf(m,n)=frho([A(m);B(n)]);
                end
                end
                
               plot3(x(1),x(2),f([x(1);x(2)]),'.','Color','r','MarkerSize',20)
                hold on
                surf(A,B,Zmf); 
                title('Modified functions')
               colormap(ax1,spring)
            
                
              
               hold on
               
               
        
    end
    
    X = linspace(-2,2,30);
    Y = linspace(-2,2,30);
    Zf = ones(30,30);
    for i=1:30
        for j=1:30
            Zf(i,j)=f([X(i);Y(j)]);
        end
    end
    ax2 = nexttile; 
       colormap cool
     surf(X,Y,Zf'); 
     title('Objective function')
  colormap(ax2,autumn)
      hold 

    
    
end

function [ hx ] = sq_penalty(h,x)
% returns the eval of the square penalty at point x
    hx = 0.5*sum(h(x).^2);
end

function [ dhx ] = sq_penalty_grad(h,x)
% returns the gradient of the Carrol-type barrier at point x
    dhx = transpose(cdiff(h,x))'*h(x);
end
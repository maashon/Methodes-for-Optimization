function [ x ] = plot_penalty(f,h,rho)
    x = zeros(30,2);
    x(1,:) = [2;-1.2];
    for k=2:30
        x(k,:)= penalty_path(f,h,rho,[x(1,1);x(1,2)],k-1);         
    end
    end

function [ddf] = SOFD(f,x)
    eps = 15e-9;
    n=size(x,1);
    H = zeros(n);
    fx=f(x);
    for k=1:n
        e1=zeros(n,1);
        e1(k) = eps;
        for l=1:n
            e2 = zeros(n,1);
            e2(l) = eps;
            dfxe1e2=f(x+e1+e2);
            dfxe1=f(x+e1);
            dfxe2=f(x+e2);
            H(k,l) = (dfxe1e2-dfxe1-dfxe2+fx)/(eps^2);
        end
    end
    % We force the symmetry of H, further refining our approximation of ddf
   ddf = (H+H')/2;
    %ddf=H/2;
end


function [ alpha ] = Wolfe_LineSearch(f, df, p, x, alpha, c1, c2)

    f0 = f(x);
    g0 = df(x);
    x0 = x;
    x = x0 + alpha * p;
    fk = f(x);
    dfk = df(x);
   
    
    % checking the first wolfe condition(similar to Armijo)
    while fk > f0 + c1 * alpha * (g0'*p)
    
        dfk = df(x);
        alpha = c2 * alpha;
        x = x0 + alpha * p;
        fk = f(x);
		%checknig the second wolfe condition(curvature condition)
		%this condition no longer allow the derivative abs(p.' * dfk) to be too big
		%this is the strong wolfe conditoin to make sure we are terminating near a stationary point
		if abs(p.' * dfk) > abs(c2 * (p.'*g0))
		break;
		end
    end
end


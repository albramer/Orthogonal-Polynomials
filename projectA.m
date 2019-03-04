
%% Project A Orthogonal Polynomials
%% Exercise 3.1
% Using my function poly_seq.m for generating the polynomials
%
syms a b c d x
a = poly_seq(x,0) - 1
b = poly_seq(x,1) - x
c = poly_seq(x,2) - 0.5*(3*x^2 - 1)
d = poly_seq(x,3) - 0.5*(5*x^3 - 3*x)
simplify(d)
%%
% a b c and d = 0 which verifies the values.
%%
% P4(x)
poly_seq(x,4)
%%
% P5(x)
poly_seq(x,5)
%%
% P6(x)
poly_seq(x,6)
%%
% P7(x)
poly_seq(x,7)
%%
% P8(x)
poly_seq(x,8)
%%
% P9(x)
poly_seq(x,9)
%%
% P10(x)
poly_seq(x,10)


%% Exercise 3.2
% I have used a dummy variable t in linspace form with 100 points between 
% -1 and 1 to construct the lines of the graph. I then used the plot funtion, 
% with hold on to keep all lines on the same graph.
%
t = linspace(-1,1,100);
plot(t, poly_seq(t,8));
hold on;
plot(t, poly_seq(t,9));
plot(t,poly_seq(t,10));
legend('y = P8(x)','y = P9(x)', 'y= P10(x)');



%% Exercise 3.4
% Using my function poly_coef.m. Note, each polynomial is stored as a row
% with the coefficients listed along the row with degree increasing from left to right.
%
poly_coef(10)

%% Exercise 3.5
% Part (a)
syms f g x

A = zeros(11,11);
for f = 1:11
    for g = 1:11;
        A(f,g) = (int(poly_seq(x,f-1)*poly_seq(x,g-1),x,-1,1));
    end
end
A
%%
% Part(b)
% One observes that all of the inner products where i=/=j are of value
% zero, and the ones where i=j have values =/=0
%% Exercise 3.6
% To normalise the polynomial Pm(x) we would take the (m,m)th entry of the
% matrix from 3.5 and divide the polynomial by the square root of this
% value, ie. dividing by the relevant norm.
%



%% Exercise 3.7
clear
syms p x
for p = 1:11
    if (p==1)
        Q(p) = sym(1);
    elseif (p==2)
        Q(p)=x-(int(x,x,-1,1));
    elseif (p>2)
        Q(p)=(x-(int(x*sym(Q(p-1))^2/sqrt(1-x^2),-1,1)/(int(sym(Q(p-1))^2,-1,1))))*Q(p-1)-((int(sym(Q(p-1))^2,-1,1))/(int(sym(Q(p-2))^2,-1,1))*sym(Q(p-2)));
    end
    simplify(Q(p))
end

 %% Exercise 3.8
syms r v
    C = zeros(11,11);
for r = 1:11
    for v = 1:11;
        C(r,v) = int(Q(r)*Q(v)*(1-x^2)^(-0.5),x,-1,1);
    end
end
C       
    
%%  Exercise 3.9
syms theta
for p=1:11
    simplify(subs(Q(p),x,cos(theta)))
end




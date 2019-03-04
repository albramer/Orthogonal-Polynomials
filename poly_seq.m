function [ y ] = poly_seq( x,n )


if n == 0 
    y = ones(1,length(x));
elseif n == 1
    y = x;
else
    y = (((2*n-1)* x .* poly_seq(x,n-1) - ((n-1)*poly_seq(x,n-2)))/n);
end

end
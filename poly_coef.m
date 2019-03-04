
function M = poly_coef ( n )
if ( n < 0 )
    M = [];
    return
  end

  M(1:n+1,1:n+1) = 0.0;

  M(1,1) = 1.0;

  if ( n <= 0 )
    return
  end

  M(2,2) = 1.0;
 
  for s = 2 : n
    M(s+1,1:s-1) =                (   - s + 1 ) * M(s-1,1:s-1) / ( s );
    M(s+1,2:s+1) = M(s+1,2:s+1) + ( s + s - 1 ) * M(s  ,1:s  ) / ( s );
  end
 
  return
end
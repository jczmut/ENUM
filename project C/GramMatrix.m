function [G, q] = GramMatrix(x, y, n)
% returns the Gram matrix for a specified polynomial order n

G = zeros(n+1, n+1);
q = zeros(n+1, 1);

% filling the G matrix
for i=1:n+1
   for j=1:n+1
      
       for sum = 0:length(x)-1
          G(i,j) = G(i,j) + ((x(1,sum+1))^(i+j-2)); 
       end
   end
end

% filling the q vector
for i=1:n+1
    
    for sum = 0:length(x)-1
        q(i,1) = q(i,1) + (y(sum+1)*(x(sum+1)^(i-1)));
    end
end



end

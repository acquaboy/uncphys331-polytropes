
%---------------------------------------

function [x,y] = newodesolverstep(iter,f,x0,y0,h,iinteg)
  
  y(:,1) = y0;
  x(1) = x0;
 
  switch iinteg
          
      case 2
          
          singlestep = @newrk4step;
          
  end
  
  r = 1;
  
  for i=1:iter
      
      x(r+1) = x(r) + h;
      y(:,r+1) = singlestep(y(:,r),f,x(r),h);
      
      if y(1,r+1) < 10^(-10) && y(1,r+1) > 0
                    
          break
      end
      
      if y(1,r+1) < 0
          
          h = h/2;
          r = r-1;
          
      end         
      
       r = r+1;
      
  end

  return
end

function [I_disp] = ssd(left,right,window,maxDisp)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
window = window;
disp_range = maxDisp;

row = size(left,1);
col = size(left,2);
%
for m =1:row
    row_min= max(1, m- window);
    row_max= min(row, m+ window);
    
    for n =1:col
          col_min= max(1,n-window);
          col_max= min(col,n+window);
          %% setting the pixel search limit
        
          pix_min= max(-disp_range, 1 - col_min);
          pix_max= min(disp_range, col - col_max);
          
          template = left(row_min:row_max ,col_min:col_max);
          
          block_count= pix_max - pix_min + 1;
          block_diff= zeros(block_count, 1);
          
          for i = pix_min : pix_max
              block= right(row_min:row_max ,(col_min +i ):(col_max+i));
              index= i-pix_min+1;
              block_diff(index,1)= sumsqr(template - block); %SSD
              
          end
          [B,I]= sort(block_diff);
          match_index= I(1,1); %Picking the minimum
          disparity= match_index+pix_min-1;
          I_disp(m, n) = disparity;
    end
end

end


% This function calculates the ML estimate of a multivariate Bernoulli
% distribution and displays the learned parameters as an image --> get_ml()
function ml = get_ml()
    % The following 3 lines of code have been written by Zoubin Ghahramani
    % in 2003 in the file bindigit.m
    load binarydigits.txt -ascii;
    Y=binarydigits;
    [N D]=size(Y);
    
    % calculate the ml estimate 
    ml = sum(Y)/N;
    ml = ml';
    
    % The following 2 lines of code are very similar to the code written by
    % Zoubin Ghahramani in 2003 in the file bindigit.m
    colormap gray;
    imagesc(reshape(ml,8,8)')
    
    title('Learned ML Parameters')
    
end
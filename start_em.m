% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function runs the EM algorithm for different numbers of K components
% on a mixture of K multivariate Bernoulli distributions. The K values are 
% specified in the vector K_vec. The EM algorithm will run 
% for at most max_it iterations. Only if want_plot = 'y', learning plots 
% will be displayed. This function returns a vector of max log-likelihoods, 
% asociated responsibilities matrices and final parameters --> 
% [lk_vec,R_3d] = start_em(K_vec, max_it,want_plot)
function [lk_vec,R_3d,P_all,pi_all] = start_em(K_vec, max_it,want_plot)

% The following 2 lines of code are very similar to the code written by 
% Zoubin Ghahramani in 2003 in the file bindigit.m
load binarydigits.txt -ascii;
X=binarydigits;

l = length(K_vec);
lk_vec = zeros(1,l);
for i = 1:l 
    [lk_vec(i),R_3d{i},P_all{i},pi_all{i}] = em(K_vec(i),X,max_it,i,want_plot);
end

end
% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function calculates the probability of picture x_n given the P
% parameters and mixture parameters pi --> sum = sumk(x_n,pi,P)
function sum = sumk(x_n,pi,P)
    K = length(pi);
    sum = 0;
    for k = 1:K
        pi_k = pi(k);
        p_k = P(k,:);
        sum = sum + pi_k*prod_d(x_n,p_k);
    end
end
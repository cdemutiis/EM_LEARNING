% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function calculates a vector pi containing the K mixing proportions
% of a mixture of K multivariate Bernoulli distributions for the 
% script em.m --> pi = get_pi(R)
function pi = get_pi(R)
    [N,K] = size(R);
    pi = zeros(K,1);
    for k = 1:K
        numerator = 0;
        for n = 1:N
            r_nk = R(n,k);
            numerator = numerator + r_nk; 
        end
        pi(k) = numerator/N;
    end
end
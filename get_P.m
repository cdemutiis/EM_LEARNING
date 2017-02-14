% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function calculates the "current" Bernoulli probability matrix for 
% the script em.m. p_{kd} is the probability that pixel d takes probability 
% 1 under mixture component k  --> P = get_P(R,X)
function P = get_P(R,X)
    [N,K] = size(R);
    [~,D] = size(X);
    P = zeros(K,D);
    for k = 1:K
        numerator = zeros(1,D);
        denominator = 0;
        for n = 1:N
            r_nk = R(n,k);
            x_n = X(n,:);
            numerator = numerator + r_nk*x_n; 
            denominator = denominator + r_nk;
        end
        P_k = numerator/denominator;
        P(k,:) = P_k;
    end
end
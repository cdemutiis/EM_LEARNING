% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function calculates the "current" responsibilities matrix for the 
% script em.m. r_{nk} is the responsibility for mixture component k for 
% data vector x_{n} --> R = get_responsibilities(pi,P,X)
function R = get_responsibilities(pi,P,X)
    K = length(pi);
    [N, ~]=size(X);
    R = zeros(N,K);
    for n = 1:N
        x_n = X(n,:);
        for k = 1:K
            pi_k = pi(k);
            p_k = P(k,:);
            R(n,k) = pi_k*prod_d(x_n,p_k)/sumk(x_n,pi,P);
        end
    end
end
% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function calculates a "current" estimate for the log-likelihood for the 
% script em.m --> log_likelihood = get_log_likelihood(pi,P,X)
function l = get_log_likelihood(pi,P,X)
    [N, ~]=size(X);
    l = 0;
    for n = 1:N
        x_n = X(n,:);
        l = l + log(sumk(x_n,pi,P));
    end
end
% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function calculates the probability of picture x_n given the P
% parameters --> p = prod_d(x_n,p_k)
function p = prod_d(x_n,p_k)
    D = length(x_n);
    p = 1;
    for d = 1:D
        x_nd = x_n(d);
        p_kd = p_k(d);
        p = p*((p_kd)^x_nd)*((1-p_kd)^(1-x_nd));
    end
end
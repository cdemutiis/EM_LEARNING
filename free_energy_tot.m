function F_tot = free_energy_tot(X, lambda, pie, sigma, mu)
    [N, D] = size(X);
    K = length(pie);
    F_tot = 0;
    for n = 1:N
        x_n = X(n,:);
        lambda_n = lambda(n,:);
        F_tot = F_tot + free_energy(lambda_n, pie, D, K, sigma, x_n, mu);
    end
end
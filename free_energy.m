function F_n = free_energy(lambda_n, pie, D, K, sigma, x_n, mu)
    common = -D*log(sigma) - (D/2)*log(2*pi);
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    for i = 1:K 
        lambda_ni = lambda_n(i);
        pie_i = pie(i);
        mu_i = mu(:,i);
        sum1 = sum1 + lambda_ni*log(pie_i/lambda_ni) + (1-lambda_ni)*log((1-pie_i)/(1-lambda_ni));
        sum2 = sum2 + lambda_ni*mu_i;
        sum3 = sum3 + (lambda_ni - lambda_ni^2)*(mu_i'*mu_i); 
    end
    F_n = common + sum1 - (1/(2*sigma^2))*(((x_n-sum2)'*(x_n-sum2)) + sum3);
end
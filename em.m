% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function uses the EM algorithm to calculate the maximum
% log-likelihood lk_max, associated responsibility matrix R and final 
% parameters of a mixture of K multivariate Bernoulli distributions
% given a pictures dataset X. The EM algorithm will run for at most max_it 
% iterations. Only if want_plot = 'y', a learning plot will be displayed.  
% --> [lk_max,R] = em(K,X,max_it,i,want_plot)
function [lk_max,R,P,pi] = em(K,X,max_it,i,want_plot)
    
    % Get the size of every image
    [~, D]=size(X);
    
    % Initialization of parameters
    % p_{kd} is the probability that pixel d takes probability 1 under 
    % mixture component k 
    P = rand(K,D); 
    % Initialize the mixing proportions so that they sum up to 1
    pi_not_normalized = rand(K,1);
    pi = pi_not_normalized/sum(pi_not_normalized);
    
    % Set the earlier convergence criterion 
    epsilon = 0.000000000000000000000000000000000000000000000000000001;
    
    it = 0; % number of iterations
    % Make sure the while loop executes at least once
    log_likelihood = 1000000000;
    log_likelihood_prev = 0;
    if want_plot == 'y'
        figure(i);
    end
    hold on;
    while (log_likelihood - log_likelihood_prev > epsilon) && it < max_it
        fprintf('Iteration n. %d\n', it+1)
        log_likelihood_prev = get_log_likelihood(pi,P,X);
        % E STEP 
        R = get_responsibilities(pi,P,X);
        % M STEP 
        P = get_P(R,X);
        pi = get_pi(R);
        it = it + 1;
        log_likelihood = get_log_likelihood(pi,P,X);
        if want_plot == 'y'
            plot(it, log_likelihood, 'r*');
            title_name = sprintf('EM Algorithm (K = %d)',K);
            title(title_name);
            xlabel('Number of iterations');
            ylabel('log-likelihood');
        end
        log_likelihood
    end
    
    lk_max = log_likelihood;
end
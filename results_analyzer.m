% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function runs the EM algorithm num_emruns times for every k in
% k_vec. At the end, it returns and makes two plots for the means and 
% standard deviations for every k.
% --> [means, stds] = results_analyzer(num_emruns, k_vec,num_it)
function [means, stds] = results_analyzer(num_emruns, k_vec,num_it)
    l = length(k_vec);
    results = zeros(num_emruns,l);
    for i = 1:num_emruns
        [results(i,:),~,~,~] = start_em(k_vec,num_it,'n');
    end
    stds = std(results);
    means = mean(results);
    figure(1)
    plot(k_vec, stds, 'b*');
    title('EM ANALYSIS (standard deviations)');
    xlabel('K')
    ylabel('Standard Deviation of the log-likelihood')
    figure(2)
    plot(k_vec, means, 'b*');
    title('EM ANALYSIS (means)');
    xlabel('K')
    ylabel('Mean of the log-likelihood')
end
% Author: Claudio S. De Mutiis (claudiodemutiis@gmail.com)
% Date: October 2016
% This function performs "hard clustering" on the images x_{n} contained in 
% the dataset X using the trained responsibilities in R. r_{nk} is the 
% responsibility for mixture component k for data vector x_{n}. Then it 
% displays the K clusters' images collections on different subplots.
% --> categorize(R)
function categorize(R)

% The following 2 lines of code were written by Zoubin Ghahramani in 2003 
% in the file bindigit.m
load binarydigits.txt -ascii;
Y=binarydigits;

[~,K] = size(R);

for k = 1:K
    figure(k)
    % find the index of the max columns for every row
    [~,ind_max] = max(R,[],2);
    % filter the columns with index k 
    ind_k = find(ind_max == k);
    X_k = Y(ind_k,:);
    % Calculate the number of k filtered images 
    num_k = length(ind_k);
    colormap gray;
    for n=1:num_k,
        subplot(10,10,n);
        imagesc(reshape(X_k(n,:)',8,8)');
        axis off;
    end;
end

end

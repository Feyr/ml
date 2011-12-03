% Load an example dataset that we will be using
load('ex7data2.mat');

X=[X;X];

% Select an initial set of centroids
K = 15; % 3 Centroids
initial_centroids = kMeansInitCentroids(X,K);

% Find the closest centroids for the examples using the
% initial_centroids
idx = findClosestCentroids(X, initial_centroids);


fprintf('Closest centroids for the first 3 examples: \n')
fprintf(' %d', idx);
fprintf('\n(the closest centroids should be 1, 3, 2 respectively)\n');

fprintf('Program paused. Press enter to continue.\n');
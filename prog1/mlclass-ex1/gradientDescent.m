function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

%J = computeCost(X, y, theta);
%(X *theta) -y

% theta = theta - ( alpha * J )
%grad = (1/m) .* X' * (( X *theta) -y)
%grad2 = sum((1/m) * (( X *theta) -y))




%t0 = Z;
%t1 = Z * X(1);

%theta(1) = theta(1) - alpha .* t0;
%theta(2) = theta(2) - alpha .* t1 ;



grad = (1/m) .* X' * (( X *theta) -y);
theta = theta - ( alpha * grad )

hold on

plot(theta(1), y, 'rx', 'MarkerSize', 10);
plot(theta(2), y, 'gx', 'MarkerSize', 10);


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end

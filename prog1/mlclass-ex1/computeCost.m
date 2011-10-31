function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% through matrix tricks
% [ data ] * [ O1, O2] = H for every data point
% H - actual results squared is O
% summed and times  1/2m is my squared error function
H= X*theta;
O= H-y;
O2=power(O,2);
Z=sum(O2)
J= 1/(2*m)*Z

% also (from a later video) 1/m * Z 1/2(hO(x(i) - y(i))^2




% =========================================================================

end

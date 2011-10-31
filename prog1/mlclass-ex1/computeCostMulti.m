function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y



% Initialize some useful values
m = length(X); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


% add the first intercept term
%X= [ones( m,1), X];

H=theta*X
% find the hypothesis.  Ox1 + Ox2 + Ox3 + ...
O= H-y;
O2=power(O,2);
Z=sum(O2);
J= 1/(2*m)*Z




% =========================================================================

end

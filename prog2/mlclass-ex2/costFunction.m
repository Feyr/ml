function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
H=0;

Z=zeros(m,1);
	
	% why the hell is that equal to theta' * X ???
	
	% answer: vectorized vs non
	
	%http://www.ml-class.org/course/qna/view?id=1803
	
	%What you are missing (I was missing it too), is that the formula refers to theta' * x ... a lowercase x that is, and that is a 
	% single training case as a vector, which is the same as X(i:)'
	% Your operation works and it calculates h(x) for the whole training set
	
	
	
	z= X*theta ;
	h= sigmoid(z);
	
	%grad= (1/m).* X' * (h-y);
	grad= (1/(m)) * X' * (h-y);
	J=(-y.*log(h)) - ((1 - y).*log(1-h));
	J= (1/m)*sum(J)
	
	

% =============================================================

end

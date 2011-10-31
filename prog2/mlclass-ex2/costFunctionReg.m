function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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


%Xorig= X

	
	z= X*theta ;
	h= sigmoid(z);
	
	%grad= (1/m).* X' * (h-y);
	
	% make a lamba vector consisting of 0 followed by theta a number of times. to avoid having to calculate theta0 independently
	L= repmat([lambda],[length(theta),1]);
	L(1,1)=0;
	%
	reg= (L./m) .* theta;
	reg(1)=0;
	
	%
	%P = lambda.*eye(length(theta));
	%P(1)=0;
	%reg= (X' * X +P)\X' * y
		
	grad= (1/(m)) * X' * (h-y)  + reg;
		
	J=(-y.*log(h)) - ((1 - y).*log(1-h));

	
		
	reg2= (lambda / (2*m-1)) * sum(theta([2:end]).^2)
	%reg2= (lambda/(2*m))*norm(theta([2:end]))^2
	J= (1/m)*sum(J) + reg2
	
% =============================================================

end


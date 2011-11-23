function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
Cfac= [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
l= length(Cfac);
Cmat = ones(l,l)*0;

%{
for C1 = 1:l
	for S1 = 1:l
		[ C1		S1]
		C= Cfac(C1);
		sigma= Cfac(S1);
		model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		p= svmPredict(model, Xval);
		err= mean(double(p ~= yval))
		Cmat(C1,S1)=err
	end
end
%}

Cmat = [
   0.565000   0.060000   0.045000   0.145000   0.185000   0.180000   0.185000   0.185000;
   0.565000   0.060000   0.045000   0.140000   0.180000   0.185000   0.185000   0.180000;
   0.565000   0.060000   0.045000   0.080000   0.170000   0.180000   0.185000   0.180000;
   0.565000   0.060000   0.035000   0.070000   0.095000   0.180000   0.185000   0.180000;
   0.565000   0.065000   0.030000   0.065000   0.080000   0.145000   0.185000   0.180000;
   0.565000   0.080000   0.035000   0.080000   0.095000   0.090000   0.180000   0.185000;
   0.565000   0.080000   0.070000   0.070000   0.080000   0.075000   0.160000   0.180000;
   0.565000   0.080000   0.060000   0.070000   0.100000   0.065000   0.095000   0.180000;
]


a=min(min(Cmat));

[x,y]=find(Cmat==a);
C=Cfac(x);
sigma=Cfac(y);

% =========================================================================

end

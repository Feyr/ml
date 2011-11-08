function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


%%% cost function
y2=y;
% make the output layer from the result. since our result contains the INDEX of the highest result

temp1=ones(m,1) * [1:num_labels];
temp2=y2*ones(1,num_labels)
y=(temp1==temp2);
clear temp*



% feed forward:
% and cost function

X = [ ones(m,1) X ];
z2=X*Theta1';
a2= sigmoid(z2);

% add intercept to a2
a2 = [ ones(size(a2),1) a2 ];
z3=a2 * Theta2';
a3= sigmoid(z3);

J=(-y.*log(a3)) - ((1 - y).*log(1-a3));
		

t1noI= Theta1(:,2:end);
regt1= sum(sum(t1noI.^2));
t2noI= Theta2(:,2:end);
regt2= sum(sum(t2noI.^2));
reg= (lambda / (2*m)) * (regt1 + regt2);

J= (1/m)*sum(sum(J)) + reg;

clear t*
clear reg*	
clear z*
clear i
%%%%%  end costfunction


%delta3 - output layer - actual value     (this would be delta4 in video, if we had 2 hidden layers)
delta3 = a3 - y;

%delta2 - hidden layer (delta3 if we had 2 hidden layers, as per video)
delta2 =  (delta3 *Theta2) .* (a2 .* (1-a2));
%possible d2: step 3 has delta2 = Theta2' * delta3 .* sigmoidGradient(z2)



%for i = 1:m
	Theta2_grad=(1/m)*(a2'*delta3)';
	Theta1_grad=(1/m)*(X'*delta2)';
%end

% remove the intercept term
Theta1_grad = Theta1_grad(2:end,:);


%a2 has rows with neurons and columns with training exemple

%Theta1(1,:)


%whos








% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end

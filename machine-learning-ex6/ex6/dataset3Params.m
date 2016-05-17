%==============================================================================
%
% Return the optimal C and sigma learning parameters found using the cross 
% validation set. This is done by constructing a model for each pair (C,sigma)
% and then using svmPredict to compare the predicted output p = (model, Xval) 
% for Xval to the the actual output yval. The pair (C,sigma) which produces
% the most accurate prediction will be the optimal pair of learning parameters.
%
%==============================================================================

function [C, sigma] = dataset3Params(X, y, Xval, yval)

    parameters = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
    best = 0.0;
    
    for C0 = parameters
        for sigma0 = parameters
            model = svmTrain(X, y, C0, @(x1, x2) gaussianKernel(x1, x2, sigma0));;
            p = svmPredict(model, Xval);
            if mean(double(p == yval)) > best;
                best = mean(double(p == yval));
                C = C0;
                sigma = sigma0;
            endif;
        endfor;
    endfor;
    
end

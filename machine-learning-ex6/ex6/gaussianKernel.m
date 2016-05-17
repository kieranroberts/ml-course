%============================================================================
% 
% Compute the gaussian kernel (or similarity) between two vectors x1 and x2
% for a given sigma.
%
%============================================================================

function sim = gaussianKernel(x1, x2, sigma)

    % Ensure that x1 and x2 are column vectors
    x1 = x1(:); x2 = x2(:);
    
    sim = exp(-sum((x1-x2).^2)/(2*sigma^2));
end

% bardlim.m is a custom made of the hardlim function that
% is only included in the Deep Learning Toolbox, which
% is not to be used for EEL-5813
%
% The syntax and functionality of bardlim should be the
% same as hardlim's.
% SYNTAX: a = bardlim(n)
% where n is the column vector of net inputs, and
% a is the resulting column vector of activations.
%
function a = bardlim(n);

% This implementation of barlim is THE SAME AS BARLIMS,
% followed by shifting and scaling on the result
a = sign(n);  % after this must transform 0s to 1s
a(a == 0) = 1;
% Explanation of last line:  a == 0 returns the locations
% (row and column) of all the elements in a that equal 0.
% Imagine we call that result ZEROLOCATIONS. Then a 2nd line
% could overwrite all those locations with '1'
% a(ZEROLOCATIONS) = 1 ;
% The 2nd line of actual code does both things in 1 line.
% 
% Now shift results up by one and shrink to half
a = ( a + 1) .* (0.5);
end  % end of function


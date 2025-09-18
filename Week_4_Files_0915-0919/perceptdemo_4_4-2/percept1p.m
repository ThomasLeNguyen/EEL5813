% percept1p learns for ONE pattern p and its target
% to modify the old matrix of weight Wold and bias 
% vector bold, to find the new ones Wnew bnew
% NOTICE that THIS VERSION IS FOR TARGETS ENCODED AS BINARY
% Therefore the activation function is hardlim (outputs 0 or 1)
% if targets were encoded in BIPOLAR, you'd CHANGE TO harlims
% so that the outpits (activations) can be 1 OR -1
% 
% percept1p.m   Train a perceptron with 1 pattern (and its targets)
%
% SYNTAX: [Wnew,bnew,e]= percept1p(Wold, bold, p, t); 
% 
function [Wnew,bnew,e]= percept1p(Wold, bold, p, t);
n = Wold * p + bold;
a = bardlim(n);
% a = bardlims(n);    % Version for bipolar targets (commented out)
e = t - a;
Wnew = Wold + ( e * p');
bnew = bold + e;
end


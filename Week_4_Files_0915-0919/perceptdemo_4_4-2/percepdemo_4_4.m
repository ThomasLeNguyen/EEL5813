% PERCEPDEMO_4_4 - SETS UP AND EXECUTES A DEMONSTRATION 
% OF A PERCEPTRON LEARNING A 2-INPUT AND FUNCTION (BINARY)
% This version (percepdemo_4_4) simulates Prob 4.4 from book
%
% ONLY RECEIVES THE INITIAL WEIGHTS AND BIAS
% Wini = [w1_ini , w2_ini], and bini = bi;
% AND THE MAXIMUM NUMBER OF EPOCHS maxepochs;
%
%  To simulate Prob 4.4 use:
%  Winit = [0 , 0];  binit = 0;  maxepochs = 5;
%
% SYNTAX: lastepoch = percepdemo_4_4( Winit , binit, maxepochs);
%
% Execution pauses after each pattern - press space bar to advance
%
function  lastepoch = percepdemo_4_4( Winit , binit, maxepochs);

% SETUP BEFORE ACTUAL EXECUTION
% Create the matrix of patterns and vector of targets
% In this version, PATS & TARGS from Prob 4.4 of book
p1 = [2;2]
t1 = 0
p2 = [1;-2]
t2 = 1
p3 = [-2;2]
t3 = 0
p4 = [-1;1]
t4 = 1
% PUT all individual vector patterns together in mtx PATS
PATS = [p1,p2,p3,p4]
% PUT all individual targets together in mtx TARGS
TARGS = [t1,t2,t3,t4]

% Now ready to execute the demo

lastepoch = perceptdem2d(PATS, TARGS, Winit, binit, maxepochs);

end   % End of function percepdemo

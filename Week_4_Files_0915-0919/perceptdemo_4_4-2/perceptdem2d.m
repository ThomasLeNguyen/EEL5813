% perceptdem2d  demonstrates implementation of perceptron rule
% for 2-D patterns as columns of matrix PATS, with
% scalar binary (0 or 1) targets in row vector TARGS
% initilized with Winit = [w1,w2] and bias binit
% executing is PAUSED after each pattern, so hit tab to continue
% 
% SYNTAX: lastepoch = perceptdem2d(PATS, TARGS, Winit, binit, maxepochs);
%
function lastepoch = perceptdem2d(PATS, TARGS, Winit, binit, maxepochs);

%Read prameters from the data (PATS and TARGS)

[rpats,cpats] = size(PATS);
xmin = min(PATS(1,:));
xmax = max(PATS(1,:));
ymin = min(PATS(2,:));
ymax = max(PATS(2,:));

% Geometric center of patters, to use as origin for weight vector display
meanx = mean(PATS(1,:));
meany = mean(PATS(2,:));

% For GRAPHIC PURPOSES ONLY, segregate ON pats from OFF pats
% and make them 2-column matrices, in preparationm for "plot"

[indxon, valson] = find(TARGS' > 0.5);
[indxoff, valsoff] = find(TARGS' < 0.5);

PATSON = (PATS(:, indxon))' ;
PATSOFF = (PATS(:, indxoff))' ;



%Initialization
Wthis = Winit;
bthis = binit;

% Display patterns and decision boundary with initial wieghts, bias
% display patterns
close all
figure; 
plot( PATSON(:,1),PATSON(:,2), '+r');hold on;
plot( PATSOFF(:,1),PATSOFF(:,2), 'ob');grid;

% display initial (random) decision boundary

x1 = xmin - 0.5;
x2 = xmax + 0.5;
y1 = (-binit / Winit(2)) - (x1 * Winit(1)/ Winit(2));
y2 = (-binit / Winit(2)) - (x2 * Winit(1)/ Winit(2));

line( [x1; x2] , [y1;y2] )

axis([(xmin -1), (xmax + 1), (ymin - 1), (ymax + 1) ]);

 title('INITIAL DECISION BOUNDARY . - Hit TAB');

 pause;   % Execution pauses - Will be re-started by spacebar

for ep = 1:maxepochs
    ep = ep
    for patnum = 1: cpats
        
 % LEARN FROM ONE PATTERN-TARGET COMBINATION      
 
% display the patterns AND HOLD
close all
figure; 
plot( PATSON(:,1),PATSON(:,2), '+r');hold on;
plot( PATSOFF(:,1),PATSOFF(:,2), 'ob');
% 

%display IN MAGENTA the orientation of the PREVIOUS weight vector 
% starting "from pattern, center" at(X)
plot(meanx, meany, 'Xk')

wv_tail = [meanx, meany];
wv_head = wv_tail + ( Wthis /(norm(Wthis)) );
linemtx = ( [wv_tail ; wv_head] );
line(linemtx(:,1), linemtx(:,2),'Color','Magenta')

% [Wnew,bnew,n,a,e]= percept1pat(Wthis, bthis, PATS(:,patnum), TARGS(patnum));
[Wnew,bnew,e]= percept1p(Wthis, bthis, PATS(:,patnum), TARGS(patnum));

% REPORT TO CONSOLE
    formatSpec0 =' EPOCH %d   , PATTERN %d  HAD ERROR  %d' ;
    rep_str = sprintf(formatSpec0,ep,patnum,e);
    disp(rep_str)


%display the orientation of the PREVIOUS weight vector pattern center(X)
% plot(meanx, meany, 'mo','MarkerEdgeColor','k','MarkerFaceColor',[.49 1 .63],'MarkerSize',10))

wv_tail = [meanx, meany];
wv_head = wv_tail + ( Wnew /(norm(Wnew)) );
linemtx = ( [wv_tail ; wv_head] );
line(linemtx(:,1), linemtx(:,2))

% Put GREEN CIRCLE on the PATTERN THAT WAS PRDSENTED to the network
ThisPat = PATS(:,patnum);
plot( ThisPat(1), ThisPat(2),'mo','MarkerFaceColor',[.49 1 .63],'MarkerSize',10);

% Display the modified (new) decision boundary
% x1 = xmin - 0.5;
% x2 = xmax + 0.5;
y1 = (-bnew / Wnew(2)) - (x1 * Wnew(1)/ Wnew(2));
y2 = (-bnew / Wnew(2)) - (x2 * Wnew(1)/ Wnew(2));
line( [x1; x2] , [y1;y2],'Color','Blue' )

%display IN BLUE  the orientation of the NEW weight vector
% from pattern center (X)
wv_tail = [meanx, meany];
wv_head = wv_tail + ( Wnew /(norm(Wnew)) );
linemtx = ( [wv_tail ; wv_head] );
plot(meanx, meany, 'Xk')
line(linemtx(:,1), linemtx(:,2), 'Color','Blue')





axis([(xmin -1), (xmax + 1), (ymin - 1), (ymax + 1) ]);grid


% NOW PASS RECENT RESULTS TO BE USED AS OLD IN NEXT PATTERN PRESENTATION
Wthis = Wnew;
bthis = bnew;

    lastepoch = ep;
        
    % REPORT EPOCH AND PATTERN # (already presented to ntwk.)
    formatSpec =' AFTER EPOCH %d ,     PATTERN %d -Hit TAB';
    titlestr = sprintf(formatSpec,ep,patnum);
    title(titlestr);

    xlabel('Green circle = pattern that WAS presented ; MAGENTA line = old W')
      pause;
     
    end   % end of all patterns in one epoch
    
end % end of all epochs

end  % end of the function




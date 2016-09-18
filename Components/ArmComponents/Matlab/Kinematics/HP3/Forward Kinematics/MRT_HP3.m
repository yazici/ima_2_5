% Matlab Robotics toolkit Motoman HP3 models
% 15 July 2008

% from published DH parameters
% w.r.t the TP joint polarities 3-6 are reversed (negative)

pL1 = link( [-pi/2 100 0   0 0], 'standard' );
pL2 = link( [    0 290 0   0 0], 'standard' );
pL3 = link( [ pi/2 -85 0   0 0], 'standard' );
pL4 = link( [-pi/2   0 0 300 0], 'standard' );
pL5 = link( [ pi/2   0 0   0 0], 'standard' );
pL6 = link( [    0   0 0  90 0], 'standard' );

pr = robot({pL1 pL2 pL3 pL4 pL5 pL6});

% plot in home configuration
% note that theta2 == -90 and theta3 = 180 degrees
plot(pr,[0 -pi/2 pi 0 0 0])


% with DH parameters that preserve the TP joint polarities

L1 = link( [-pi/2 100 0    0 0],'standard');
L2 = link( [   pi 290 0    0 0],'standard');
L3 = link( [-pi/2  85 0    0 0],'standard');
L4 = link( [ pi/2   0 0 -300 0],'standard');
L5 = link( [-pi/2   0 0    0 0],'standard');
L6 = link( [    0   0 0  -90 0],'standard'); 

r = robot({L1 L2 L3 L4 L5 L6});

% plot in home configuration
% note that theta2 == -90
plot(r,[0 -pi/2 0 0 0 0])




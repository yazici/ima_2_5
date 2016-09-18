function PlotCBData(FolderName,Type)

%% Plots CB Data
% Arguments:
%
% FolderName: is where data of interest is saved. Folders are named
% according to date.
%
% Type: String with values of C or MF, to indicate the kinds of
% controlllers, and accordingly the names of the files used to store the
% data.

% Global String Path is
% U:\\School\\Ph_D\\Experiments\\ControlBasis\\Data\\HP3JC\\
P = 'U:\\School\\Ph_D\\Experiments\\ControlBasis\\Data\\HP3JC\\';

%% Determine Type
%% Cartesian Controller
 if(strcmp(Type,'C'))
     
     % Set File Name
     % All Cartesian controller files will be named: DomCartesianError.txt
     FILE = 'DomCartesianError.txt';
          
     % Plot Cartesian Error data
     Path = strcat(P,FolderName,FILE);
     
     % Load data
     S=load(Path);
     
     % Plot the data.
     % As of Feb. 10th, this component does not plot time, just a 6x1 vec.
     
    figure(Cart), plot(S);
    
    % Labels
    Title('CB: Error for Cartesian Controller');
    xlabel('Time (seconds)');
    ylabel('Cartesian Error (mm)');
    legend('East');
     
     
 elseif(strcmp(type,'MF'))

     % Set File Name
     % All Cartesian controller files will be named: DomCartesianError.txt
     FILE_FTSensor = 'ForceData.txt';
     FILE_Moment   = 'DomMomentError.txt';
     FILE_Force    = 'SubForceError.txt';
          
     % Plot Cartesian Error data
     Path_FTSensor = strcat(P,FolderName,FILE_FTSensor);
     Path_Moment   = strcat(P,FolderName,FILE_Moment);
     Path_Force    = strcat(P,FolderName,FILE_Force);
     
     % Load data
     S_FTSensor = load(Path_FTSensor);
     S_Moment   = load(Path_Moment);
     S_Force    = load(Path_Force);
     
     % Plot the data
     % We want a subplot that compares FT Sensor readings over time against Moment and Force Error data.
     
     subplot(3,1,1), plot(S_FTSensor(:,1), S_FTSensor(:,2-6));
     subplot(3,1,1), plot(S_FTSensor(:,1), S_Moment);
     subplot(3,1,1), plot(S_FTSensor(:,1), S_Force);
     
 end
% a = load('MatlabWork.txt');
% 
% figure
% plot(a(:,1),a(:,2:3));%%AXIS([-0.045 0.03 -80 60]);
% clear all; close all; clc
% b = load('C:\Program Files\Microsoft Visual Studio\MyProjects\ISACNeural\TrainFiles\NeuralDataBackward4567Angle3.txt');
% c = load('C:\Program Files\Microsoft Visual Studio\MyProjects\ISACNeural\TrainFiles\NeuralDataForward4567Angle3.txt');
% hold on
% plot(b(:,1),b(:,2),'r');%%AXIS([-0.045 0.03 -80 60]);
% grid on
% plot(c(:,1),c(:,2));%%AXIS([-0.045 0.03 -80 60]);
% hold off

%% Neural Error
clear all; clc; close all;
%d=load('C:\Documents and Settings\EE\Desktop\ISACNeural\NNWeights\NNmuscle01FWeightsErrors.txt');
%d=load('C:\Documents and Settings\EE\Desktop\ISACNeural\NNWeights\NNmuscle01BWeightsErrors.txt');
%d=load('C:\Documents and Settings\EE\Desktop\ISACNeural\NNWeights\NNmuscle23FWeightsErrors.txt');
%d=load('C:\Documents and Settings\EE\Desktop\ISACNeural\NNWeights\NNmuscle23BWeightsErrors.txt');
%d=load('C:\Documents and Settings\EE\Desktop\ISACNeural\NNWeights\NNmuscle4567Angle2FWeightsErrors.txt');
%d=load('C:\Documents and Settings\EE\Desktop\ISACNeural\NNWeights\NNmuscle4567Angle2BWeightsErrors.txt');
%d=load('C:\Documents and Settings\EE\Desktop\ISACNeural\NNWeights\NNmuscle4567Angle3FWeightsErrors.txt');
%d=load('C:\Documents and Settings\EE\Desktop\ISACNeural\NNWeights\NNmuscle4567Angle3BWeightsErrors.txt');
%d=load('C:\Program Files\Microsoft Visual Studio\MyProjects\ISACNeural\NNWeights\NNmuscle891011Angle4FWeightsErrors.txt');
%d=load('C:\Program Files\Microsoft Visual Studio\MyProjects\ISACNeural\NNWeights\NNmuscle891011Angle4BWeightsErrors.txt');
%d=load('C:\Program Files\Microsoft Visual Studio\MyProjects\ISACNeural\NNWeights\NNmuscle891011Angle5FWeightsErrors.txt');
d=load('C:\Program Files\Microsoft Visual Studio\MyProjects\ISACNeural\NNWeights\NNmuscle891011Angle5BWeightsErrors.txt');

sqrt(mse(d))

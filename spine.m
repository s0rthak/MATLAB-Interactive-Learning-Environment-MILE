%No need to have this as a function file
%Spine is the face of the program that is visible to the User
set(0,'DefaultFigureWindowStyle','docked')
% % %Docking by Default
addpath(genpath('jsonlab-master'));
% % addpath(genpath('Data_Structures/Heaps/'));
% % yml = ParserYAML('BisectionMethod.yml');
% % [yml, names, queue] = yml.ReturnYAML();

tic %Start of timer
lesson = ParseJSON('lesson.json');
%returns a cell array as opposed to YAML's structure array
%obj = ExecuteLessonFromYAML(yml, names, queue);
obj = ExecuteLessonFromJSON(lesson.JSONCellArray);
disp('End of Lesson!');
toc %End of Timer






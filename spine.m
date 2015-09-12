%No need to have this as a function file
%Spine is the face of the program that is visible to the User
addpath(genpath('YAMLParser'));
addpath(genpath('Data_Structures/Heaps/'));
yml = ParserYAML('text.yml');
[yml, names, queue] = yml.ReturnYAML();
l = length(yml);
tic %Start of timer
obj = ExecuteLessonFromYAML(yml, names, queue);

disp('End of Lesson!');
toc %End of Timer





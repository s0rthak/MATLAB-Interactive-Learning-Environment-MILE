%No need to have this as a function file
%Spine is the face of the program that is visible to the User
yml = ParserYAML();
[yml, names] = yml.ReturnYAML();

tic %Start of timer
obj = ExecuteLessonFromYAML(yml, names);

disp('End of Lesson!');
toc %End of Timer





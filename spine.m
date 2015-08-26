function [] = spine()

yaml_file = 'text.yml';
addpath(genpath('YAMLparser'));
YamlStruct = ReadYaml(yaml_file);
pause on;

%Lacks Modularity here
obj = ExecuteFunctions;
Task = LessonContent(YamlStruct.l1.id,YamlStruct.l1.content,YamlStruct.l1.type);
obj.CheckObjectType(Task);
Task = LessonContent(YamlStruct.l2.id,YamlStruct.l2.content,YamlStruct.l2.type);
obj.CheckObjectType(Task);
Task = LessonContent(YamlStruct.l3.id,YamlStruct.l3.content,YamlStruct.l3.type);
obj.CheckObjectType(Task);
Task = LessonContent(YamlStruct.l4.id,YamlStruct.l4.content,YamlStruct.l4.type);
obj.CheckObjectType(Task);
Task = LessonContent(YamlStruct.l5.id,YamlStruct.l5.content,YamlStruct.l5.type);
obj.CheckObjectType(Task);
disp('End of Lesson!');






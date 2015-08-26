function [] = spine()

yaml_file = 'text.yml';
addpath(genpath('YAMLparser'));
YamlStruct = ReadYaml(yaml_file);
pause on;
YamlStructNames = char(fieldnames(YamlStruct));
%Added Modularity to this part
obj = ExecuteFunctions;
for i = 1:length(YamlStructNames)
    Task = LessonContent(YamlStruct.(YamlStructNames(i,:)).id,YamlStruct.(YamlStructNames(i,:)).content,YamlStruct.(YamlStructNames(i,:)).type);
    obj.CheckObjectType(Task);
end
disp('End of Lesson!');






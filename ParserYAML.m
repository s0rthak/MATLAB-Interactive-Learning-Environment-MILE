%Parse YAML using YAMLparser and check for integrity of the document for
%the parsing rules
%Returns the Parsed YAML object[YAMLStruct, YAMLStructNames]


classdef ParserYAML
    properties (SetAccess = 'private')
        %Add properties here if and when needed
        AllowedHeads = cellstr(['id     ';'content';'type   ']);
        AllowedTypes = [1,2,3,4,5,6,7];
        AllowedGraphArgs = '^(x1|x2|y|xmin|ymax|hold)$';
        YAMLStruct;
        YAMLStructNames;
        Correct = 1;
    end
    methods
        
        function checkParse(obj)
            for i = 1:length(obj.YAMLStructNames)
                %Checking for the correct heads
                 heads = fieldnames(obj.YAMLStruct.(obj.YAMLStructNames(i,:)));
                 for j = 1:3
                     if ~strcmp(heads(j),obj.AllowedHeads(j))
                        obj.Correct = 0;
                     end
                 end 
                 %Check for valid Types
                 type = obj.YAMLStruct.(obj.YAMLStructNames(i,:)).type;
                 if ~any(type == obj.AllowedTypes)
                    obj.Correct = 0;
                 end
            end 
        end %end function
        function obj =  ParserYAML(filename)
            yaml_file = char(filename);
            obj.YAMLStruct = ReadYaml(yaml_file);
            pause on;
            obj.YAMLStructNames = char(fieldnames(obj.YAMLStruct));
            obj.checkParse()
        end
        
        function q = MakeLessonQueue(obj)
            q = MinHeap(length(obj.YAMLStructNames));
            for i = 1:length(obj.YAMLStructNames)
                   q.InsertKey(i);
            end
        end
        
        %Return YAML Struct to a call that requires the Parsed YAMLstruct
        function [yamlStruct, structNames, lessonQueue] = ReturnYAML(obj)
            if obj.Correct 
                yamlStruct = obj.YAMLStruct;
                structNames = obj.YAMLStructNames;
                lessonQueue = obj.MakeLessonQueue();
            end
        end
        
        %Return the validity of YAML to a call that just checks the
        %validity of YAML doc.
        function valid = isValidYAML(obj)
            valid = obj.Correct;
        end
        
        function parseGraph(obj, YAMLStruct)
         %Takes the graph structure as the argument and analyses it for valid format
            if YAMLStruct.comtent
                heads = fieldnames(YAMLStruct.content);
                %iterate over the heads to find the one that is not correct
                for j = 1:length(heads)
                    if ~regexp(heads(j),obj.AllowedGraphArgs)
                        obj.Correcct = 0;
                    end
                end
            end
        end
        
    end %end methods
end



%Present shortcomings:
% 1. Cannot smartly sort the 

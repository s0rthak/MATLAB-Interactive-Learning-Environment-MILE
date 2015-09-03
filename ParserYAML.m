%Parse YAML using YAMLparser and check for integrity of the document for
%the parsing rules
%Returns the Parsed YAML object[YAMLStruct, YAMLStructNames]


classdef ParserYAML
    properties (SetAccess = 'private')
        %Add properties here if and when needed
        AllowedHeads = cellstr(['id     ';'content';'type   '])
        AllowedTypes = [1,2,3,4,5,6]
        YAMLStruct;
        YAMLStructNames;
        Correct = 1;
    end
    methods
        function obj =  ParserYAML(~)
            yaml_file = 'text.yml';
            addpath(genpath('YAMLParser'));
            obj.YAMLStruct = ReadYaml(yaml_file);
            pause on;
            obj.YAMLStructNames = char(fieldnames(obj.YAMLStruct));
        end
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
        %Return YAML Struct to a call that requires the Parsed YAMLstruct
        function [yamlStruct, structNames] = ReturnYAML(obj)
            if obj.Correct 
                yamlStruct = obj.YAMLStruct;
                structNames = obj.YAMLStructNames;
            end
        end
        
        %Return the validity of YAML to a call that just checks the
        %validity of YAML doc.
        function valid = isValidYAML(obj)
            valid = obj.Correct;
        end
        
    end %end methods
end

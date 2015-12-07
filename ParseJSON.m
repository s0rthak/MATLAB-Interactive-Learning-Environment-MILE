%Parse YAML using YAMLparser and check for integrity of the document for
%the parsing rules
%Returns the Parsed YAML object[YAMLStruct, YAMLStructNames]




classdef ParseJSON
    properties (SetAccess = 'private')
        %Add properties here if and when needed
        AllowedHeads = ['id     ';'content';'type   '];
        AllowedTypes = [1,2,3,4,5,6,7,8];
        AllowedGraphArgs = '^(x1|x2|y|xmin|ymax|hold)$';
        JSONCellArray;
        Correct = 1;
    end
    methods
        
        function checkParse(obj)
                                     
             for i = 1:length(obj.JSONCellArray)
                 %Looping through the entire CellArray
                
                %Checking for the Correct Fieldnames                      
                            
                 heads = char(fieldnames(obj.JSONCellArray{i}));
                 for j = 1:length(fieldnames(obj.JSONCellArray{i}))
                     sum = 0;
                     for k = 1:3
                       sum= sum + strcmp(obj.AllowedHeads(k,:),heads(j,:));   
                     end
                         if (sum ~= 1)
                             obj.Correct = 0;
                             disp('incorrect');
                         end            
                 end
                 
                 %Checks for the Allowed Types
                 type = obj.JSONCellArray{i}.type;
                 if ~any(type == obj.AllowedTypes)
                        obj.Correct = 0;
                 end
                 
                 if ~obj.Correct
                     break;
                 end
                  
              end
        end 
%         
%         ParseJSON takes the filename and then loads the JSON into JSONCellArray
%         Then it parses the fieldnames from the JSOnCellArray and stores it in JSONCellNames
%         Then it calls checkParse to check whether the format is correct
        function obj = ParseJSON(filename)
            JSON_file = char(filename);
            obj.JSONCellArray = loadjson(JSON_file);
            clear JSON_file filename; %Removing it from the workspace
            obj.checkParse();
            
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

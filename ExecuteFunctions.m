% Type 1 is: Just Display Line
% Type 2 is: Wait for input prompt
% Type 3 is: Perform an function
% Type 4 is: Display without pausing

%Contains a list of functions
% 1. YamlParseAndPlay for YAML Parsing and Lesson Playing
% 2. ObjectType(number) : To run a function based on object type
% 3. CheckObjectType: To check and call relevant ObjectType function
%Cleanup names of functions

%Can add assert() functions at the beginning of each function
% Ex: assert(isfloat(train_x), 'train_x must be a float');
% assert(nargin == 4 || nargin == 6,'number ofinput arguments must be 4 or 6')

%Would of all of these work on octave as well? Mention the issues that may
%arise
%Can possibly put each function into a different file to make the
%readibility and editing better
%Explicitly adding the directory of the file in case it is not included in
%the right place this will be in initMISC file

%Add more comments to better explain the functions and classes

%Free up variables from memory
classdef ExecuteFunctions
     properties (SetAccess = 'private')
        ObjectType = [1 2 3 4 5];  
     end
    methods 
        function YamlParseAndPlay(obj)
            yaml_file = 'text.yml';
            addpath(genpath('YAMLparser'));
            YamlStruct = ReadYaml(yaml_file);
            pause on;
            YamlStructNames = char(fieldnames(YamlStruct));
            %Added Modularity to this part
            
            for i = 1:length(YamlStructNames)
                Task = LessonContent(YamlStruct.(YamlStructNames(i,:)).id,YamlStruct.(YamlStructNames(i,:)).content,YamlStruct.(YamlStructNames(i,:)).type);
                obj.CheckObjectType(Task);
            end
            pause off;
            
        end
       function ObjectType1(~,LessonContentobj)
           disp(LessonContentobj.content);
                pause;
       end
       function ObjectType2(~,LessonContentobj)
           prompt = LessonContentobj.content;
                x = input(prompt);
                if(x==3.14285)
                    fprintf('Correct!\n');
                    else
                    disp('Incorrect. The correct answer is 3.14285');
                end
                %Correct this to make it general after YAML integration
       end
       function ObjectType3(~,LessonContentobj)
           fprintf('%f...\n',LessonContentobj.content);
                pause;
       end
       function ObjectType4(~,LessonContentobj)
            disp(LessonContentobj.content);
       end
       function ObjectType5(~,LessonContentobj)
           PlotFieldName =char(fieldnames(LessonContentobj.content));
           GraphValues = ['y   ' ;'xmin' ;'xmax' ;'x1  '; 'x2  ';'hold'];
           %List of all possible Variables
           %Looping through all values of list
           for i = 1:length(GraphValues)
           shortGraphValue = regexprep(GraphValues(i,:),'[^\w'']','');
           if DoesFieldExist(PlotFieldName,shortGraphValue)==1
          anonfunc = @() assignin('caller',shortGraphValue(1,:),LessonContentobj.content.(shortGraphValue(1,:)));
          anonfunc();
          %Using anon function so that 'caller'  becomes this function
          %workspace and not the base workspace
           end
           end
            %Check existence of variable
            if (any(strcmp(who,'y'))==1 && any(strcmp(who,'xmin'))==1 && any(strcmp(who,'xmax'))==1)
            PlotGraph(y,xmin,xmax);
            end
            if(any(strcmp(who,'x1'))==1 && any(strcmp(who,'x2'))==1)
                PlotLines(x1,x2);
                %What about when either x2 or x1 exists?
            end
            if (DoesFieldExist(PlotFieldName,'hold')==1)
                hold on;
            else
                hold off;
            end;
                          
       end
      function  CheckObjectType(obj,LessonContentobj)
          if any(LessonContentobj.type == obj.ObjectType)   
            switch LessonContentobj.type
                    case 1
                        obj.ObjectType1(LessonContentobj);
                    case 2
                        obj.ObjectType2(LessonContentobj);
                    case 3
                        obj.ObjectType3(LessonContentobj);
                    case 4
                        obj.ObjectType4(LessonContentobj);
                case 5
                    obj.ObjectType5(LessonContentobj);
                    
            end
             %Add error handling for different object type
          end
      end
    end
end
          

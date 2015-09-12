% Type 1 is: Just Display Line
% Type 2 is: Wait for input prompt
% Type 3 is: Perform an function
% Type 4 is: Display without pausing
% Type 5 is: Graphs
% Type 6 is: Video Links
% Type 7 is: 2 Variable Array

%Methods
    %ExecuteLessonFromYAML() : Object Constructor
    %CallLesson() :  Calls the lesson. 
                    %eg : 1. CallLesson(

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
classdef ExecuteLessonFromYAML
     properties
         YAMLStruct;
         YAMLStructNames;
         LessonQueue;
     end
    methods 
        %constructor
      
        
        function CallLesson(obj, indicator)
            
            if indicator == 0
                obj.ExecuteAll();
            else
                obj.ExecuteAll(indicator);
            end
        end
        
        
        function ExecuteAll(obj)
            while (~obj.LessonQueue.IsEmpty())
                a = obj.LessonQueue.ExtractMin();
                obj.ExecuteLesson(a);
            end
        end
        
        function ExecuteLesson(obj,pointer)
            
            if pointer
                Task = LessonContent(obj.YAMLStruct.(obj.YAMLStructNames(pointer,:)).id,obj.YAMLStruct.(obj.YAMLStructNames(pointer,:)).content,obj.YAMLStruct.(obj.YAMLStructNames(pointer,:)).type);
                obj.CheckObjectType(Task);
            end
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
            if (any(strcmp(who,'y')) && any(strcmp(who,'xmin')) && any(strcmp(who,'xmax')))
            PlotGraph(y,xmin,xmax);
            end
            if(any(strcmp(who,'x1')) && any(strcmp(who,'x2')))
                PlotLines(x1,x2);
                %What about when either x2 or x1 exists?
            end
            if (DoesFieldExist(PlotFieldName,'hold'))
                hold on;
            else
                hold off;
            end;
                          
       end
       function ObjectType6(~, LessonContentobj)
          
          message = LessonContentobj.content.message;
          link = LessonContentobj.content.link;
          ans = input('Would you like to see a video? (y/n): ','s');
          if ans == 'Y' || ans == 'y'
          web(link,'-browser');
          end
          
          pause;
       end
       
       %Finds interpoliation of 1D data
       function ObjectType7(~,LessonContentobj)
       %Gets x y and method from YAML 
        AllowedMethods = ['linear  ';'spline  ';'cubic   ';'nearest ';'next    ';'previous';'pchip   '];
        x = str2num(char(LessonContentobj.content.x));
        y = str2num(char(LessonContentobj.content.y));
        method = LessonContentobj.content.method;
        %Authenticates the method
        flag=0;
        for i = 1:size(AllowedMethods,1)
        if (strcmp(method,regexprep(AllowedMethods(i,:),'[^\w'']','')));
        flag=1;
        end
        end
        %Runs 1D interpolation if number of points are same
         if size(x,2)~=size(y,2)
            disp('Error in data');
         elseif flag
             disp(LessonContentobj.content.message);
             fprintf('x: ');
           disp(x);
           fprintf('y: ');
           disp(y);
          point = input('Input Interpolation Point: ');
          interp1(x,y,point,method)      
         else
         disp('Wrong method');    
        end
           pause;  
           
       end
       
      function  CheckObjectType(obj,LessonContentobj)  
              %Is there any way to reduce the number of lines in switch?
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
                    case 6 
                        obj.ObjectType6(LessonContentobj);
                case 7
                    obj.ObjectType7(LessonContentobj);
                    
            end
             %Add error handling for different object type
      end
      function obj = ExecuteLessonFromYAML(YAMLStruct, YAMLStructNames, LessonQueue)
            obj.YAMLStruct = YAMLStruct;
            obj.YAMLStructNames = YAMLStructNames;
            obj.LessonQueue = LessonQueue;
            obj.CallLesson(0);
        end
    end
end
          

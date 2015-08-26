
% Type 1 is: Just Display Line
% Type 2 is: Wait for input prompt
% Type 3 is: Perform an function
% Type 4 is: Display without pausing

classdef ExecuteFunctions
     properties (SetAccess = 'private')
        ObjectType = [1 2 3 4];  
     end
    methods 
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
            end
             %Add error handling for different object type
          end
      end
    end
end
          

classdef LessonContent %< handle
    % Class to store Lesson Content after parsing from YAML document
    properties (SetAccess = 'private') %SetObservable)
        index
        content
        type %Of the next command
    end
    methods
        function obj = LessonContent(index1,content1,type1)
            obj.index = index1;
            obj.content = content1;
            obj.type= type1;
        end
    function  LessonType(obj)
            if obj.type == 1
                disp(obj.content);
                pause;
            elseif obj.type == 2
                prompt = obj.content;
                x = input(prompt);
                if(x==3.14285)
                    fprintf('Correct!\n');
                    else
                    disp('Incorrect. The correct answer is 3.14285');
                end
            elseif obj.type == 3
                fprintf('%f...\n',obj.content);
                pause;
            elseif obj.type == 4
                disp(obj.content);
            end
        end
    end
   % events
    %addlistener(obj,'index','PostSet',@LessonContent.LessonType);
    %end 
end

% Type 1 is: Just Display Line
% Type 2 is: Wait for input prompt
% Type 3 is: Perform an function
% Type 4 is: Display without pausing
% Class to store Lesson Content after parsing from YAML document

classdef LessonContent %< handle
    properties (SetAccess = 'private') %SetObservable)
        index = 0;
        content = '';
        type = 0;%Of the next command
    end
    methods
        function obj = LessonContent(index1,content1,type1)
            obj.index = index1;
            obj.content = content1;
            obj.type= type1;
        end
    end
   % events
    %addlistener(obj,'index','PostSet',@LessonContent.LessonType);
    %end 
end

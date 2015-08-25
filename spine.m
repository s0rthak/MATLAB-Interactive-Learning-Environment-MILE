function [] = spine()

pause on;

obj = ExecuteFunctions;
Task = LessonContent(1,'Today we shall learn about approximation',1);
obj.CheckObjectType(Task);
Task = LessonContent(2,'Some number terminate after a finite set of digits.For example: 1/2 is equal to 0.5',1);
obj.CheckObjectType(Task);
Task = LessonContent(3,'Other numbers repeat forever: For example 1/3 = ',4);
obj.CheckObjectType(Task);
Task = LessonContent(4,1/3,3);
obj.CheckObjectType(Task);
Task = LessonContent(5,'Now, you do one. What are the first 6 digits of 22/7?\n',2);
obj.CheckObjectType(Task);
disp('End of Lesson!');








function [] = spine()

pause on;
   
Task = LessonContent(1,'Today we shall learn about approximation',1);
Task.LessonType();
Task = LessonContent(2,'Some number terminate after a finite set of digits.For example: 1/2 is equal to 0.5',1);
Task.LessonType();
Task = LessonContent(3,'Other numbers repeat forever: For example 1/3 = ',4);
Task.LessonType();
Task = LessonContent(4,1/3,3);
Task.LessonType();
Task = LessonContent(5,'Now, you do one. What are the first 6 digits of 22/7?\n',2);
Task.LessonType();
disp('End of Lesson!');








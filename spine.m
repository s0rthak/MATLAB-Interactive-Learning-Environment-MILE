function [] = spine()

flag=0;
pause on;

%In future this can be a saved from a file using for loop
% Some explanation: 
% Each structure has three variables:
% 1. Index
% 2. Content
% % 3. Type - Of the next command
% Type 1 is: continued by another line
% Type 2 is: Waiting for input prompt
% Type 3 is: Perform an function
% 
% Adding Pausing Functionalities.
% There is a Pause for Type 1
% There is no pause for Type 3
% There is implicit pausing for Type 2

   



Task(1).index = 1;
Task(1).content = 'Today, we shall learn about approximation';
Task(1).type = 1;
disp(Task(1).content)
pause;
Task(2).index = 2;
Task(2).content = 'Some number terminate after a finite set of digits.For example: 1/2 is equal to 0.5';
Task(2).type = 1;
disp(Task(2).content)
pause;
Task(3).index = 3;
Task(3).content = 'Other numbers repeat forever: For example 1/3 = ';
Task(3).type = 3;
disp(Task(3).content)
Task(4).index = 4;
Task(4).content = 1/3;
Task(4).type = 1;
fprintf('%9f...\n',Task(4).content)
pause;
Task(5).index = 5;
Task(5).content = 'Now, you do one. What are the first 6 digits of 22/7?\n';
Task(5).type = 2;
prompt = Task(5).content;
x = input(prompt);
if(x==3.14285)
    fprintf('Correct!\n');
    flag=1;
else
    error('Incorrect. The correct answer is 3.14285')
end








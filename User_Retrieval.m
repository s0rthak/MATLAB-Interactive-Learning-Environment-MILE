function [] = User_Retrieval2(str)

% Accepting a table and then counting it to an array.
%Not best for memory purposes
try
User_Table = readtable('Usernames.xlsx');
[m,n] = size(User_Table);
if(size(User_Table)==0)
    error('File not Found');
end
flag=0;
User_Array = table2cell(User_Table);
for i = 1:m
    if(strcmp(str,User_Array(i,1))==1)
        Lesson_No = User_Array(i,2);
        Lesson_No
        %fprintf('Found %s \n',str);
        flag=1;
    end
end
if(flag==0)
    fprintf('Not Found \n');
end

catch 
         disp('File not Found');
           
    
end


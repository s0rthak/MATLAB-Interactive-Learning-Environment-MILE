function [answer] = DoesFieldExist(structArr,str)

 
[m,~] = size(structArr);
answer = 0;
StrName = mat2str(str);
for i = 1:m
      RowName = mat2str(structArr(i,:));
      RowName = regexprep(RowName,'[^\w'']','');
      if strcmp(RowName,StrName)==1
        answer = 1;
end
 end



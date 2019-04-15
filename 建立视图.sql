--学生信息视图
create view Studentview 
as
select StuId,StuClass,StuMajor,StuName,StuSex,StuPhone
from Student;


--教材信息视图
create view Textbookview
as
select TextId,TextName,TextWriter,TextCategory,TextPrice,TextPress
from Textbook;


--库存信息视图
create view Stockview
as
select WarehouseId,TextId,TextName,StoNumber,TextPrice
from Stock;



--订购信息视图

create view Ordview
as
select OrdDate,OrdName,OrdNumber,Ord.TextId,TextName,TextPrice
from Ord,Textbook
where Ord.TextId=Textbook.TextId
--领用信息视图
create view Accessview
as
select StuMajor,Ord.StuId,StuClass,StuName,AccUsage
from Ord,Student
where Ord.StuId=Student.StuId


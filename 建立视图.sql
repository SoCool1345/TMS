--ѧ����Ϣ��ͼ
create view Studentview 
as
select StuId,StuClass,StuMajor,StuName,StuSex,StuPhone
from Student;


--�̲���Ϣ��ͼ
create view Textbookview
as
select TextId,TextName,TextWriter,TextCategory,TextPrice,TextPress
from Textbook;


--�����Ϣ��ͼ
create view Stockview
as
select WarehouseId,TextId,TextName,StoNumber,TextPrice
from Stock;



--������Ϣ��ͼ

create view Ordview
as
select OrdDate,OrdName,OrdNumber,Ord.TextId,TextName,TextPrice
from Ord,Textbook
where Ord.TextId=Textbook.TextId
--������Ϣ��ͼ
create view Accessview
as
select StuMajor,Ord.StuId,StuClass,StuName,AccUsage
from Ord,Student
where Ord.StuId=Student.StuId


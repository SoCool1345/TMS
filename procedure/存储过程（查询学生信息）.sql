--����3���洢����
--����5��������
--����һ������
--��ѯѧ����Ϣ
create proc QureuInfor
@ID char(15)
as
begin
	declare @cant varchar(50)
	set @cant='��Ϣ������'
	if exists(select * from Studentview where StuId=@ID)
		select *
		from Student
		where StuId=@ID
	else
		print @cant
end
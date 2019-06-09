--至少3个存储过程
--至少5个触发器
--至少一个事务
--查询学生信息
create proc QureuInfor
@ID char(15)
as
begin
	declare @cant varchar(50)
	set @cant='信息不存在'
	if exists(select * from Studentview where StuId=@ID)
		select *
		from Student
		where StuId=@ID
	else
		print @cant
end
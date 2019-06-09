--至少5个触发器
--至少一个事务

create trigger tri_admin
on Administrator
instead of update
as 
raiserror('不能修改管理员信息',16,2)
go
--����5��������
--����һ������

create trigger tri_admin
on Administrator
instead of update
as 
raiserror('�����޸Ĺ���Ա��Ϣ',16,2)
go
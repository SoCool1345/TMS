--����3���洢����
--����5��������
--����һ������
--���ӿ����Ϣ

create proc InsertStock
@WarehouseId int,
@TextId char(9),
@TextName char(9),
@StoNumber int,
@TextPrice money
AS
insert into Stock values(@WarehouseId,@TextId,@TextName,@StoNumber,@TextPrice)
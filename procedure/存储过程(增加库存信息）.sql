--至少3个存储过程
--至少5个触发器
--至少一个事务
--增加库存信息

create proc InsertStock
@WarehouseId int,
@TextId char(9),
@TextName char(9),
@StoNumber int,
@TextPrice money
AS
insert into Stock values(@WarehouseId,@TextId,@TextName,@StoNumber,@TextPrice)
--至少3个存储过程
--至少5个触发器
--至少一个事务
--增加库存信息

create proc InsertIf
@TextId char(9),
@WarehouseId int
as
begin
	declare @cant varchar(50)
	declare @sel varchar(50)
	declare @aa varchar(50)
	declare @bb varchar(50)
	set @cant='信息已存在，不能录入'
	set @sel='有教材信息，无库存信息，可以录入（执行InsertStock）'
	set @aa='无此教材信息,请先录入教材信息'
if exists(select * from Textbook where TextId=@TextId)
	print @aa
else
	begin
		if exists(select * from Stock where WarehouseId=@WarehouseId and TextId=@TextId)
			print @cant
		else
			print @sel
	end
end

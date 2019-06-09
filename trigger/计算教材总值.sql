--插入库存信息，计算教材总值
CREATE TRIGGER trig_insert_TextPrice
 ON Stock
  FOR INSERT 
   AS
   DECLARE @TextPrice money,@WarehouseId int,@StoNumber int
   SELECT @TextPrice=TextPrice,@WarehouseId=WarehouseId,@StoNumber=StoNumber
   FROM inserted
     IF exists(select * from Warehouse where WarehouseId=@WarehouseId) 
        UPDATE Warehouse SET StoValue=StoValue+@TextPrice*@StoNumber
             WHERE WarehouseId=@WarehouseId
    ELSE
        insert into Warehouse values(@WarehouseId,@TextPrice*@StoNumber)
    
Go
--更新库存信息，更新教材总值
CREATE TRIGGER trig_update_TextPrice
 on Stock
  for update
as
	DECLARE @TextPrice money,@WarehouseId int,@StoNumber int
	DECLARE @Old_TextPrice money,@Old_WarehouseId int,@Old_StoNumber int
	SELECT @TextPrice=TextPrice,@WarehouseId=WarehouseId,@StoNumber=StoNumber
	FROM inserted
	SELECT @Old_TextPrice=TextPrice,@Old_WarehouseId=WarehouseId,@Old_StoNumber=StoNumber
	FROM deleted
	if(@WarehouseId=@Old_WarehouseId)
	UPDATE Warehouse SET StoValue=StoValue+(@TextPrice*@StoNumber-@Old_TextPrice*@Old_StoNumber)
             WHERE WarehouseId=@WarehouseId
    else insert into Warehouse values(@WarehouseId,@TextPrice*@StoNumber)  
    begin
    IF exists(select * from Warehouse where WarehouseId=@WarehouseId) 
		UPDATE Warehouse SET StoValue=StoValue+@TextPrice*@StoNumber
             WHERE WarehouseId=@WarehouseId
    else          
    UPDATE Warehouse SET StoValue=StoValue-@Old_TextPrice*@Old_StoNumber
             WHERE WarehouseId=@Old_WarehouseId   
    end
 Go
--����3���洢����
--����5��������
--����һ������
--���ӿ����Ϣ

create proc InsertIf
@TextId char(9),
@WarehouseId int
as
begin
	declare @cant varchar(50)
	declare @sel varchar(50)
	declare @aa varchar(50)
	declare @bb varchar(50)
	set @cant='��Ϣ�Ѵ��ڣ�����¼��'
	set @sel='�н̲���Ϣ���޿����Ϣ������¼�루ִ��InsertStock��'
	set @aa='�޴˽̲���Ϣ,����¼��̲���Ϣ'
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

--至少5个触发器
--至少一个事务
--显示教材信息表删除后的信息
create trigger tri_textbook
on Textbook for delete
as select * from Textbook
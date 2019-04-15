create table Administrator(
AdmiId	Int	primary key,
AdmiName	Char(15)	not null,
AdmiSex	Bit	not null,
AdmiAdd	Char(15)	not null,
AdmiPhone	Char(15)	not null,
)
create table Teacher(
TeaId	Int	primary key,
TeaName	Char(9)	not null,
TeaSex	Bit	not null,
TeaPhone	Char(15)	not null,
)
create table Student(
StuId	Char(15)	primary key,
StuClass	Char(15)	not null,
StuMajor	Char(15)	not null,
StuName	Char(10)	not null,
StuSex	Bit	not null,
StuPhone	Char(15)	not null,
)
create table Textbook(
TextId	Char(9)	primary key,
TextName	Char(15)	not null,
TextWriter	Char(15)	not null,
TextCategory	Char(15)	not null,
TextPrice	Money	not null,
TextNumber	Int	not null,
TextPress	Char(20)	not null,
)
create table Stock(
WarehouseId	Int	not null,
TextId	Char(9)	not null,
TextName	Char(9)	not null,
StoNumber	Int	not null,
TextPrice	Money	not null,

primary key(WarehouseId,TextId,TextName),
foreign key(TextId) references Textbook(TextId),
)
create table Warehouse(
WarehouseId	Int	primary key,
StoValue	Int	not null,


)

create table Ord(
OrdDate	Datetime	not null,
OrdName	Char(10)	not null,
OrdNumber	Int	not null,
TextId	Char(9)	not null,
TextName	Char(15)	not null,
TextPrice	Money	not null,
StuMajor	Char(15)	not null,
StuId	Char(15)	not null,
StuClass	Char(15)	not null,
StuName	Char(10)	not null,
AccUsage	Int	not null,

primary key(OrdDate,OrdName),
foreign key(TextId) references Textbook(TextId),
foreign key(StuId) references Student(StuId),
)

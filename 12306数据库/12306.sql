create table TArea  (
   ano                number(9)                       not null,
   aname              varchar2(50)                    not null,
   constraint PK_TAREA primary key (ano)
);



create table Train  (
   tno                varchar2(18)                    not null,
   tstart              varchar2(30),
   tend                varchar2(30),
   startTime          date,
   longTime           varchar2(30),
   departure          number(9),
   destination        number(9),
   constraint PK_TRAIN primary key (tno)
);

alter table Train
   add constraint FK_TRAIN_REFERENCE_TAREA foreign key (departure)
      references TArea (ano);

alter table Train
   add constraint FK_TRAIN_REFERENCE_TAREA foreign key (destination)
      references TArea (ano);



create table TBanci  (
   bno                number(9)                       not null,
   tno                varchar2(18),
   startDate          date,
   constraint PK_TBANCI primary key (bno)
);

alter table TBanci
   add constraint FK_TBANCI_REFERENCE_TRAIN foreign key (tno)
      references Train (tno);



create table Ticket  (
   seatno             varchar2(18)                    not null,
   bno                number(9),
   stype              varchar2(5),
   state              varchar2(5),
   buyer              varchar2(30),
   constraint PK_TICKET primary key (seatno)
);


alter table Ticket
   add constraint FK_TICKET_REFERENCE_TBANCI foreign key (bno)
      references TBanci (bno);



create table TUser  (
   uname              varchar2(50)                    not null,
   pwd                varchar2(30)                    not null,
   constraint PK_TUSER primary key (uname)
);














insert into tarea values(1,'北京');
insert into tarea values(2,'上海');
insert into tarea values(3,'天津');
insert into tarea values(4,'重庆');
insert into tarea values(5,'长沙');
insert into tarea values(6,'长春');
insert into tarea values(7,'成都');
insert into tarea values(8,'福州');
insert into tarea values(9,'广州');
insert into tarea values(10,'贵阳');
insert into tarea values(11,'呼和浩特');
insert into tarea values(12,'哈尔滨');
insert into tarea values(13,'合肥');
insert into tarea values(14,'杭州');
insert into tarea values(15,'海口');
insert into tarea values(16,'济南');
insert into tarea values(17,'昆明');




insert into train values('G101','北京南','上海虹桥',to_date('06:44','hh:mi'),'05:55,当日到达',1,2);

insert into train values('T101','北京南','哈尔滨站',to_date('06:44','hh:mi'),'05:55,当日到达',1,12);

insert into train values('K102','北京南','上海虹桥',to_date('9:44','hh:mi'),'16:55,次日到达',1,2);



insert into tbanci values(1,'G101',to_date('08/20/2017','mm/dd/yyyy'));

insert into tbanci values(2,'T101',to_date('08/20/2017','mm/dd/yyyy'));

insert into tbanci values(3,'K102',to_date('08/20/2017','mm/dd/yyyy'));



insert into ticket(seatno,bno,stype,state) values('A16',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('A17',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('A18',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('A19',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('A20',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('A21',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('B16',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('B17',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('B18',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('B19',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('B20',1,'01','01');
insert into ticket(seatno,bno,stype,state) values('B21',1,'01','01');


insert into ticket(seatno,bno,stype,state) values('C16',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('C17',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('C18',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('C19',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('C20',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('C21',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('D16',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('D17',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('D18',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('D19',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('D20',1,'02','01');
insert into ticket(seatno,bno,stype,state) values('D21',1,'02','01');


insert into ticket(seatno,bno,stype,state) values('E16',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('E17',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('E18',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('E19',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('E20',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('E21',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('F16',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('F17',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('F18',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('F19',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('F20',1,'03','01');
insert into ticket(seatno,bno,stype,state) values('F21',1,'03','01');


insert into ticket(seatno,bno,stype,state) values('G16',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('G17',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('G18',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('G19',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('G20',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('G21',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('H16',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('H17',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('H18',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('H19',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('H20',1,'04','01');
insert into ticket(seatno,bno,stype,state) values('H21',1,'04','01');

insert into ticket(seatno,bno,stype,state) values('M16',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('M17',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('M18',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('M19',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('M20',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('M21',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('N16',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('N17',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('N18',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('N19',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('N20',1,'05','01');
insert into ticket(seatno,bno,stype,state) values('N21',1,'05','01');
























insert into ticket(seatno,bno,stype,state) values('T101-A16',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-A17',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-A18',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-A19',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-A20',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-A21',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-B16',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-B17',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-B18',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-B19',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-B20',2,'01','01');
insert into ticket(seatno,bno,stype,state) values('T101-B21',2,'01','01');


insert into ticket(seatno,bno,stype,state) values('T101-C16',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-C17',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-C18',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-C19',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-C20',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-C21',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-D16',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-D17',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-D18',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-D19',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-D20',2,'02','01');
insert into ticket(seatno,bno,stype,state) values('T101-D21',2,'02','01');


insert into ticket(seatno,bno,stype,state) values('T101-E16',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-E17',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-E18',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-E19',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-E20',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-E21',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-F16',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-F17',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-F18',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-F19',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-F20',2,'03','01');
insert into ticket(seatno,bno,stype,state) values('T101-F21',2,'03','01');


insert into ticket(seatno,bno,stype,state) values('T101-G16',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-G17',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-G18',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-G19',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-G20',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-G21',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-H16',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-H17',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-H18',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-H19',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-H20',2,'04','01');
insert into ticket(seatno,bno,stype,state) values('T101-H21',2,'04','01');

insert into ticket(seatno,bno,stype,state) values('T101-M16',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-M17',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-M18',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-M19',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-M20',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-M21',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-N16',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-N17',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-N18',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-N19',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-N20',2,'05','01');
insert into ticket(seatno,bno,stype,state) values('T101-N21',2,'05','01');













insert into ticket(seatno,bno,stype,state) values('K102-A16',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-A17',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-A18',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-A19',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-A20',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-A21',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-B16',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-B17',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-B18',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-B19',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-B20',3,'01','01');
insert into ticket(seatno,bno,stype,state) values('K102-B21',3,'01','01');


insert into ticket(seatno,bno,stype,state) values('K102-C16',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-C17',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-C18',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-C19',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-C20',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-C21',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-D16',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-D17',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-D18',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-D19',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-D20',3,'02','01');
insert into ticket(seatno,bno,stype,state) values('K102-D21',3,'02','01');


insert into ticket(seatno,bno,stype,state) values('K102-E16',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-E17',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-E18',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-E19',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-E20',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-E21',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-F16',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-F17',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-F18',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-F19',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-F20',3,'03','01');
insert into ticket(seatno,bno,stype,state) values('K102-F21',3,'03','01');


insert into ticket(seatno,bno,stype,state) values('K102-G16',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-G17',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-G18',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-G19',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-G20',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-G21',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-H16',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-H17',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-H18',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-H19',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-H20',3,'04','01');
insert into ticket(seatno,bno,stype,state) values('K102-H21',3,'04','01');

insert into ticket(seatno,bno,stype,state) values('K102-M16',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-M17',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-M18',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-M19',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-M20',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-M21',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-N16',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-N17',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-N18',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-N19',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-N20',3,'05','01');
insert into ticket(seatno,bno,stype,state) values('K102-N21',3,'05','01');



insert into tuser values('admin','123');
insert into tuser values('tom','123');



















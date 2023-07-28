create database BetCompany


use BetCompany

create table Manager
(
ManagerID int primary key,
ManagerName varchar(20),
ManagerAddress varchar(20),
Phone int,
);

use BetCompany

create table CompanyBranch
(
BranchNumber int primary key,
BranchName varchar(20),
BranchAddress varchar(20),
NumberOfWorkers int,
ManagerID int foreign key references Manager(ManagerID),
);

use BetCompany

create table SecurityCompany
(
CompanyName Varchar(20),
CompanyNumber int primary key,
NumberOfWorkers int,
Phone int,
BranchNumber int foreign key references CompanyBranch(BranchNumber),
);

use BetCompany

create table Department
(
DepartmentNumber int primary key,
DepartmentType varchar(20),
NumberOfWorkers int,
BranchNumber int foreign key references CompanyBranch(BranchNumber),
);

use BetCompany

create table Worker
(
WorkerID int primary key,
WorkerName varchar(20),
Phone int,
DepartmentNumber int foreign key references Department(DepartmentNumber),
);

use BetCompany

create table Subscription
(
SubscriptionName varchar(20),
SubscriptionNumber int primary key,
SubscriptionPlan varchar(20),
Price int,
);

use BetCompany

create table Client
(
ClientID int primary key,
ClientName varchar(20),
ClinetAddress varchar(20),
SubscriptionNumber int foreign key references Subscription(SubscriptionNumber),
);

use BetCompany

create table Registration
(
RegistrationNumber int primary key,
RegistrationType varchar(20),
RegistrationDate date,
RegistrationPrice int,
);

use BetCompany

create table Sell
(
WorkerID int foreign key references Worker(WorkerID),
ClientID int foreign key references Client(ClientID),
RegistrationNumber int foreign key references Registration(RegistrationNumber),
RegistrationDate date,
);

use BetCompany

create table Category
(
CategoryNumber int primary key,
CategoryType varchar(20),
LimitOfParticipants int,
PercentageOfInterest int,
);

use BetCompany

create table Offer
(
RegistrationNumber int foreign key references Registration(RegistrationNumber),
CategoryNumber int foreign key references Category(CategoryNumber),
RegistrationPrice int,
RegistrationDate date,
);

use BetCompany

create table BettingEvent
(
EventNumber int primary key,
EventDate date,
EventPrize int,
CategoryNumber int foreign key references Category(CategoryNumber),
);


insert into Manager values(219547529,'John','Afula',0549351757)
insert into Manager values(202924751,'Max','Tell Aviv',0505475120)
insert into Manager values(202187623,'Aleina','Megido',0546831472)
insert into Manager values(303911057,'Ron','Hertsilea',0558200199)
insert into Manager values(292187625,'Matilda','Haifa',0502579510)

insert into CompanyBranch values(351485,'UCCA Limited','Ntania',470,219547529)
insert into CompanyBranch values(382000,'Betting Zone','Tell Aviv',920,202924751)
insert into CompanyBranch values(639107,'Money World','Rmat Sharon',680,202187623)
insert into CompanyBranch values(825496,'Spend To Win','Rmat Gan',594,303911057)
insert into CompanyBranch values(282736,'Betting House','Bat Yam',1235,292187625)

insert into SecurityCompany values('Security For You',2210030,2500,04621748,351485)
insert into SecurityCompany values('Protect Your Company',3932142,480,04715482,382000)
insert into SecurityCompany values('Sector Safe',2547215,690,04521368,639107)
insert into SecurityCompany values('IBW Secure',2020310,4200,04687236,825496)
insert into SecurityCompany values('VIP Safety',6942710,120,04963000,282736)

insert into Department values(2013014,'Sports',77,351485)
insert into Department values(8742100,'Races',88,382000)
insert into Department values(3038157,'Table Games',248,639107)
insert into Department values(1079046,'Electronic Games',136,825496)
insert into Department values(3318000,'Tv Shows',12,282736)

insert into Worker values(297001587,'Alex',0593001854,2013014)
insert into Worker values(292100378,'Joana',0548016972,8742100)
insert into Worker values(303218000,'James',0504171390,3038157)
insert into Worker values(100239206,'Norah',0596104753,1079046)
insert into Worker values(330710058,'Luna',0522710610,3318000)

insert into Subscription values('Standard Edition',2541856,'6 Months',60)
insert into Subscription values('Delux Edition',3524751,'1 Year',110)
insert into Subscription values('Gold Edition',2001548,'2 Years',205)
insert into Subscription values('Ultimate Edition',2016872,'4 Years',400)
insert into Subscription values('VIP Edition',2011980,'Unlimited',1500)

insert into Client values(210384204,'Dave','Megido',2541856)
insert into Client values(202319213,'Morty','Ntania',3524751)
insert into Client values(312009874,'Joanha','Tell Aviv',2001548)
insert into Client values(900157548,'Ronald','Haifa',2016872)
insert into Client values(313208751,'Noah','Afeka',2011980)

insert into Registration values(12054,'Race','2020-1-11',50)
insert into Registration values(10575,'Game','2019-11-12',100)
insert into Registration values(33102,'Game','2020-2-25',100)
insert into Registration values(91700,'Electronic Game','2019-12-17',10)
insert into Registration values(79523,'Sports','2020-6-15',1000)

insert into Sell values (297001587,210384204,12054,'2020-1-11')
insert into Sell values (292100378,202319213,10575,'2019-11-12')
insert into Sell values (303218000,312009874,33102,'2020-2-25')
insert into Sell values (100239206,900157548,91700,'2019-12-17')
insert into Sell values (330710058,313208751,79523,'2020-6-15')

insert into Category values(2018647,'Sports',50000,10)
insert into Category values(9021700,'Races',25000,5)
insert into Category values(3312555,'Table Games',80000,2)
insert into Category values(1012027,'Electronic Games',3000,20)
insert into Category values(3310210,'Tv Shows',5000,50)

insert into Offer values(12054,2018647,50,'2020-1-11')
insert into Offer values(10575,9021700,100,'2019-11-12')
insert into Offer values(33102,3312555,100,'2020-2-25')
insert into Offer values(91700,1012027,10,'2019-12-17')
insert into Offer values(79523,3310210,1000,'2020-6-15')

insert into BettingEvent values(202135,'2020-2-2',10000,2018647)
insert into BettingEvent values(900146,'2020-1-3',2500,9021700)
insert into BettingEvent values(201414,'2020-5-5',120000,3312555)
insert into BettingEvent values(301202,'2019-12-30',1000,1012027)
insert into BettingEvent values(331250,'2020-7-10',200000,3310210)

select * from Manager
select * from CompanyBranch
select * from SecurityCompany
select * from Department
select * from Worker
select * from Subscription
select * from Client
select * from Registration
select * from Sell
select * from Category
select * from Offer
select * from BettingEvent







alter table Department
add Phone int;

alter table BettingEvent
add EventDuration int;

alter table CompanyBranch
add Phone int;

alter table SecurityCompany
add YearsOfService int;

update Department
set Phone=973462721
where DepartmentNumber=2013014;
update Department
set Phone=972549000
where DepartmentNumber=8742100;
update Department
set Phone=673009222
where DepartmentNumber=3038157;
update Department
set Phone=672229888
where DepartmentNumber=1079046;
update Department
set Phone=276663130
where DepartmentNumber=3318000;

update BettingEvent
set EventDuration=3
where EventNumber=202135;
update BettingEvent
set EventDuration=1
where EventNumber=900146;
update BettingEvent
set EventDuration=4
where EventNumber=201414;
update BettingEvent
set EventDuration=1
where EventNumber=301202;
update BettingEvent
set EventDuration=5
where EventNumber=331250;

update CompanyBranch
set Phone=97246390
where BranchNumber=351485;
update CompanyBranch
set Phone=67222931
where BranchNumber=382000;
update CompanyBranch
set Phone=87261652
where BranchNumber=639107;
update CompanyBranch
set Phone=57241316
where BranchNumber=825496;
update CompanyBranch
set Phone=47209039
where BranchNumber=282736;

update SecurityCompany
set YearsOfService=19
where CompanyNumber=2210030;
update SecurityCompany
set YearsOfService=13
where CompanyNumber=3932142;
update SecurityCompany
set YearsOfService=7
where CompanyNumber=2547215;
update SecurityCompany
set YearsOfService=23
where CompanyNumber=2020310;
update SecurityCompany
set YearsOfService=1
where CompanyNumber=6942710;







alter table Manager
add DateOfBirth date;

alter table Category
add DateOfBirthAllowed date;

alter table Client
add DateOfBirth date;

alter table Worker
add DateOfBirth date;

update Manager
set DateOfBirth='1972-12-12'
where ManagerID=219547529;
update Manager
set DateOfBirth='1979-3-24'
where ManagerID=202924751;
update Manager
set DateOfBirth='1970-1-3'
where ManagerID=202187623;
update Manager
set DateOfBirth='1978-9-15'
where ManagerID=303911057;
update Manager
set DateOfBirth='1985-6-23'
where ManagerID=292187625;

update Category
set DateOfBirthAllowed='1999-1-1'
where CategoryNumber=2018647;
update Category
set DateOfBirthAllowed='1995-1-1'
where CategoryNumber=9021700;
update Category
set DateOfBirthAllowed='1996-12-30'
where CategoryNumber=3312555;
update Category
set DateOfBirthAllowed='1997-1-30'
where CategoryNumber=1012027;
update Category
set DateOfBirthAllowed='1998-1-15'
where CategoryNumber=3310210;

update Client
set DateOfBirth='1998-10-12'
where ClientID=210384204;
update Client
set DateOfBirth='1996-5-5'
where ClientID=202319213;
update Client
set DateOfBirth='1995-6-2'
where ClientID=312009874;
update Client
set DateOfBirth='1997-7-3'
where ClientID=900157548;
update Client
set DateOfBirth='1974-6-4'
where ClientID=313208751;

update Worker
set DateOfBirth='1990-5-12'
where WorkerID=297001587;
update Worker
set DateOfBirth='1999-6-13'
where WorkerID=292100378;
update Worker
set DateOfBirth='1985-7-22'
where WorkerID=303218000;
update Worker
set DateOfBirth='1980-12-12'
where WorkerID=100239206;
update Worker
set DateOfBirth='1991-5-22'
where WorkerID=330710058;








select avg(NumberOfWorkers)
from CompanyBranch

select sum(NumberOfWorkers)
from SecurityCompany

select max(LimitOfParticipants)
from Category

select count(NumberOfWorkers)
from Department

select avg(NumberOfWorkers)
from CompanyBranch
group by NumberOfWorkers

select sum(NumberOfWorkers)
from SecurityCompany
group by NumberOfWorkers

select max(LimitOfParticipants)
from Category
group by LimitOfParticipants

select count(NumberOfWorkers)
from Department
group by NumberOfWorkers








select * from SecurityCompany
where YearsOfService>18 and NumberOfWorkers=2500;

select * from SecurityCompany
where NumberOfWorkers<490 and YearsOfService>=1;

select * from SecurityCompany
where NumberOfWorkers<=690 or YearsOfService<14;

select * from SecurityCompany
where NumberOfWorkers>121 or YearsOfService<0;

select sum(NumberOfWorkers)
from CompanyBranch
group by NumberOfWorkers
having (NumberOfWorkers)>594;

select sum(NumberOfWorkers)
from CompanyBranch
group by NumberOfWorkers
having (NumberOfWorkers)<595;

select sum(NumberOfWorkers)
from CompanyBranch
group by NumberOfWorkers
having (NumberOfWorkers)=1235;

select sum(NumberOfWorkers)
from CompanyBranch
group by NumberOfWorkers
having (NumberOfWorkers)>=680;
/* in this question we used the function select with sum because we want the value of the column (NumberOfWorkers) and we wrote the  table
that the column is attached to which is (CompanyBranch) in ordered the table by using group by and used the function having to set a limit 
that we decided in every select we wrote */







select datediff(YY,DateOfBirth,getdate()) as [Age]
from Manager
group by DateOfBirth


select datediff(YY,DateOfBirthAllowed,getdate()) as [Age]
from Category
group by DateOfBirthAllowed

select datediff(YY,DateOfBirth,getdate()) as [Age]
from Client
group by DateOfBirth

select datediff(YY,DateOfBirth,getdate()) as [Age]
from Worker
group by DateOfBirth







select Department.DepartmentNumber,CompanyBranch.BranchName,Department.DepartmentType
from Department
inner join CompanyBranch on Department.BranchNumber=CompanyBranch.BranchNumber


select Client.ClientID,Subscription.SubscriptionPlan,Subscription.Price,Client.ClientName
from Client
inner join Subscription on Client.SubscriptionNumber=Subscription.SubscriptionNumber

select worker.WorkerID,Department.DepartmentType,Department.NumberOfWorkers,Worker.WorkerName
from Worker
inner join Department on Worker.DepartmentNumber=Department.DepartmentNumber

select BettingEvent.EventNumber,Category.CategoryType,Category.PercentageOfInterest,BettingEvent.EventPrize
from BettingEvent
inner join Category on BettingEvent.CategoryNumber=Category.CategoryNumber

/* אם רוצים לשלב או לחבר בין תכונות בין שתי טבלאות JOIN משתמשים בבדיקת  
   מחברים בין טבלת היחיד ובין טבלת הרבים ומגדרים שהמפטח בטבלת היחיד שווה למפטח בטבלת הרבים וזה נותן תכונות משוטפות בין שתי הטבלאות*/








select BranchName
from CompanyBranch
where exists(select DepartmentType from Department where Department.BranchNumber=CompanyBranch.BranchNumber and NumberOfWorkers>100)
group by BranchName;

select SubscriptionPlan
from Subscription
where exists(select ClientName from Client where Client.SubscriptionNumber=Subscription.SubscriptionNumber and Price<1400)
group by SubscriptionPlan;

select DepartmentType
from Department
where exists(select WorkerName from Worker where Worker.DepartmentNumber=Department.DepartmentNumber and Phone>0504171390)
group by DepartmentType

select LimitOfParticipants
from Category
where exists(select EventPrize from BettingEvent where BettingEvent.CategoryNumber=Category.CategoryNumber and EventPrize>=2500)
group by LimitOfParticipants

/* תכיל לבדוק אם יש מצב לתכונה להתקיים טבלה בתוך טבלה ויתן תכונה מסויימת עם תנאי מסויים exists הפקודה   */






drop table suser cascade constraints;
drop table uprofile cascade constraints;
drop table payment cascade constraints;
drop table paymentdetails cascade constraints;
drop table subscription cascade constraints;
drop table tvshow cascade constraints;
drop table tcast cascade constraints;
drop table director cascade constraints;
drop table starring cascade constraints;
drop table For_Tvshow cascade constraints;
drop table genre cascade constraints;


create table Suser
(
user_id int primary key,
email_id varchar(20),
dob date,
fname varchar(10),
mname varchar(10),
lname varchar(10),
address varchar(50),
gender char check(gender='M' or gender='F'),
phoneno number(10)
);
desc Suser;

create table Uprofile
(
user_name varchar(10) primary key,
country varchar(15),
password varchar(8),
about varchar(50),
u_user_id int references Suser(user_id)
);
desc Uprofile;

create table Payment
(
payment_code varchar(7) primary key,
payment_method varchar(20),
amount_paid number,
pay_date date,
u_id int references Suser(user_id)
);
desc Payment;

create table PaymentDetails
(
card_no number(16) primary key,
card_type varchar(20),
exp_date varchar(10),-- mm/yy
payment_method varchar(20),
u_name varchar(10) references Uprofile(user_name),
ppayment_code varchar(7) references Payment(payment_code)
);
desc PaymentDetails;

create table Subscription
(
subscription_id varchar(6) primary key,
subscription_date date,
end_date date,
amount number,
subscription_type varchar(10) ,--montly yearly premium
pay_code varchar(7) references Payment(payment_code)
);
desc Subscription;

create table Tvshow
(
show_id int primary key,
title varchar(25),
ttype varchar(15),
Release_date date,
tlength number,
rating float,
constraint chk_rating check(rating>=1.0 and rating<=5.0)
);
desc Tvshow;

create table Tcast
(
actor_id int primary key, 
tfname varchar(10),
tlname varchar(10),
gender char check(gender='M' or gender='F'),
dob date
);
desc Tcast;

create table Director
(
director_id int primary key,
dfname varchar(10),
dlname	varchar(10),
sho_id_d int references Tvshow(show_id), 
dob date
);
desc Director;

create table Starring
(
showid int references TVSHOW(Show_id),
act_id int references Tcast(actor_id),
crole varchar(20)   
);
desc Starring;

create table For_Tvshow
(
subid varchar(6) references Subscription(subscription_id),
shid int references Tvshow(show_id)
);
desc For_Tvshow;

create table Genre
(
sho_id int references Tvshow (show_id),
genre varchar(15)
);
desc Genre;


insert into suser values(1,'farhans@gmail.com','02-dec-1999','farhan','Muhammad','Shaikh','CannaughtPlace,NewDelhi','M',8653536673);
insert into suser values(2,'norac@yahoo.in','27-mar-2000','norac','David','Casay','Haleys Apartment','F',9253415237);
insert into suser values(3,'robertb@gmail.com','18-jul-2001','robert','George','Bobby','Southway road','M',7113944741);
insert into suser values(4,'janlong@gmail.com','15-nov-1999','janice','Arturo','Longbottom','hannah street','F',9998764537);
insert into suser values(5,'caelam12@gmail.com','22-jan-1992','caela','Harry','Murphy','Simburg colony','F',9887263881);
insert into suser values(6,'chandlerb@gmail.com','23-apr-1990','chandler','Ronald','Bing','Lilywood street','M',9233435553);
insert into suser values(7,'richardg@gmail.com','25-may-1978','richard','Garry','Green','Ralph Apartment','M',8897334569);
insert into suser values(8,'sushil@gmail.com','22-aug-2002','sushil','M','Rawat','Keshwapur cross,Hubli','M',8789234567);
insert into suser values(9,'Bernadine@gmail.com','10-sep-2002','Bernadine','J','Wadley','4098  Abner Road,Eau Claire','F',6362284959);
insert into suser values(10,'Gregory@gmail.com','22-jun-2005','Gregory','J','Luton','Doctors Drive,Los Angeles','M',2564784485);
insert into suser values(11,'Vail@gmail.com','17-dec-2000','Vail','V','Miche','Berkendreef 384,Ellikom','M',2496547832);
insert into suser values(12,'Zexian@gmail.com','01-sep-2001','Zexian','A','Zheng','Singapore,N/A','F',8984899971);
insert into suser values(13,'bavana@gmail.com','11-jan-1992','bavana','T','prasad','Rruga Sul Misiri, Nr. 98,Elbasan','F',5973145620);
insert into suser values(14,'vidya@gmail.com','09-sep-2002','vidya','N','navaguddi','RK nagar,koppel','F',7346821560);
insert into suser values(15,'vani@gmail.com','05-feb-1999','vani','R','varadar','rani nagar,belgum','F',8621486422);
insert into suser values(16,'soundarya@gmail.com','02-sep-2002','soundarya','K','karani','ganesh nagar','F',0314779632);
insert into suser values(17,'naveen@gmail.com','29-jun-1997','naveen','S','konidala','maha nagar,bellary','M',6321478569);
insert into suser values(18,'akshata@gmail.com','02-apr-1979','akshata','V','jain','housing bord,hospet','F',7412369850);
insert into suser values(19,'deepak@gmail.com','19-sep-2002','deepak','B','rajeesh','nava nagar,hubli','M',5632147896);
insert into suser values(20,'anoop@gmail.com','04-mar-1978','anoop','T','rawat','northway road,toronto','M',8412684379);
insert into suser values(21,'shivprasad@gmail.com','26-apr-1988','shivprasad','M','tummala','rajeev gandi nagar,bagalore','M',5369874255);  
insert into suser values(22,'sanjana@gmail.com','12-jan-1998','sanjana','A','bagawat','maninagar,ahmedabad','F',4236852014);
insert into suser values(23,'aamir@gmail.com','20-jan-1977','aamir','V','bachchan','N/A singapore','M',4129874220);
insert into suser values(24,'bijoy@gmail.com','01-dec-1992','bijoy','A','joshi','keyser ridge road, greensboro','M',6324856942);
insert into suser values(25,'chandana@gmail.com','19-feb-1989','chandana','T','jain','kuvempu nagar,darwad','M',9632485564);
insert into suser values(26,'daniyal@gmail.com','11-nov-2001','daniyal','S','bing','ambedkar nagar,koppel','M',7530148655);
insert into suser values(27,'bishan@gmail.com','29-mar-1999','bishan','R','lyer','kamal nagar,bellari','M',9632147506);
insert into suser values(28,'aarthi@gmail.com','03-sep-1984','aarthi','B','choudhury','balaji nagar,hubli','M',9632147752);
insert into suser values(29,'damodar@gmail.com','18-apr-1999','damodar','N','joshi','vinayak nagar,belagavi','M',3014569875);
insert into suser values(30,'dileep@gmail.com','22-oct-1987','dileep','H','korrapati','dollers colony,koppel','M',6874123695);
insert into suser values(31,'fatima@gmail.com','06-may-1977','fatima','G','sultana','agadi layout,gadag','M',8452369874);
insert into suser values(32,'ganesh@gmail.com','10-aug-1981','ganesh','I','benerjee','kalyan nagar,udipi','M',8741098506);
insert into suser values(33,'indira@gmail.com','29-jun-1991','indira','L','gupta','bagya nagar,raichur','M',1236547852);
insert into suser values(34,'jashwant@gmail.com','14-jul-1971','jashwant','N','kulkarni','teachers colony,mysor','M',5896321470);
insert into suser values(35,'nayan@gmail.com','07-feb-1992','nayan','B','mishra','NGOs colony,koppel','M',8632147856);
insert into suser values(36,'eshwar@gmail.com','21-mar-2002','eshwar','D','patil','sai nagar,bellari','M',3574196215);
insert into suser values(37,'ritu@gmail.com','08-dec-1984','ritu','M','tamboli','sheshadri nagar,hospet','M',4569814376);
insert into suser values(38,'gayathri@gmail.com','15-mar-1977','gayathri','T','sharma','gandhi nagar,hydrabad','M',6547896212);
insert into suser values(39,'mohith@gmail.com','10-nov-1992','mohith','G','nagarkar','gavicon colony,koppel','M',8630890658);
insert into suser values(40,'deepthi@gmail.com','22-jun-2000','dipthi','S','niba','jublly hills,hydrabad','M',7563048852);
insert into suser values(41,'chandan@gmail.com','05-oct-1991','chandan','K','kulkarni','deepa nagar,hospet','M',4478963251);
insert into suser values(42,'geetha@gmail.com','30-nov-1998','geetha','R','maduri','shri sai nagar,vijayawada','M',0698741255);
insert into suser values(43,'jyothi@gmail.com','23-mar-1988','jyothi','A','choudary','bharat colony,','M',8631482066);
insert into suser values(44,'gita@gmail.com','05-sep-1981','gita','kumari','pogat','rajaji nagar,','M',7563201590);
insert into suser values(45,'mahesh@gmail.com','20-may-1989','mahesh','N','korrapati','vijaya nagar','M',9214863250);
insert into suser values(46,'rahul@gmail.com','12-oct-1978','rahul','kumar','mhasalkar','kuramangala','M',5236987410);
insert into suser values(47,'chaithan@gmail.com','09-jan-1982','chaithan','V','narang','washington,amarica','M',6321478962);
insert into suser values(48,'pawan@gmail.com','21-feb-1971','pawan','kumar','boyapadu','thungabadra nagara udupi','M',6541837209);
insert into suser values(49,'hari@gmail.com','14-jun-1999','hari','prasad','tummala','jai nagara raichur','M',9630144852);
insert into suser values(50,'kirti@gmail.com','07-dec-2000','kirti','R','vemul','yeshwanthpura bengalore','M',8510069842);
insert into suser values(51,'karthik@gmail.com','21-nov-1999','karthik','varma','konakanchi','KR nagara hospet','M',9620147852);
insert into suser values(52,'soumya@gmail.com','15-apr-1977','soumya','V','choudary','babusa palliya bengalore','M',7530148952);
insert into suser values(53,'swaroopa@gmail.com','28-jul-1989','swaroopa','T','kalava','banaasvadi bengalore','M',6874105963);
insert into suser values(54,'harsha@gmail.com','30-aug-1991','harsha','K','reddy','gurugunta badiya raichur','M',6200147520);
insert into suser values(55,'kiran@gmail.com','19-dec-2001','kiran','S','shabadi','maleshwaram bengalore','M',6201475398);
insert into suser values(56,'anil@gmail.com','24-oct-1984','anil','N','ravipudi','nelamangala bengalore','M',6201475369);
insert into suser values(57,'maya@gmail.com','28-jan-1979','maya','rao','kakarla','peenya,bengalore','M',410589630);
insert into suser values(58,'varsha@gmail.com','19-mar-1985','varsha','M','gavigatti','magadi,koppel','M',9520753852);
insert into suser values(59,'shiva@gmail.com','10-sep-1993','shiva','shankar','guptha','ashok nagar,udupi','M',9987126972);
insert into suser values(60,'lakshmi@gmail.com','04-aug-1995','lakshmi','T','shetty','banjara hill,hydrabad','M',8876314890);
insert into suser values(61,'vemapatil@gmail.com','25-jul-1994','Vema','V','Patil','Manewal Pada Rd, Mumbai','F',5443047529);
insert into suser values(62,'ArtEkshian@gmail.com','09-jun-1994','Artzouig','P','Ekshian','Tigran Metsi Ave. 20,Yerevan','F',8541337950);
insert into suser values(63,'Badri@gmail.com','22-aug-1995','Badri','T','Pandit','New Baneshwor Kathmandu','M',6324853210);
insert into suser values(64,'Yahsi@gmail.com','14-jan-1977','Yahsi','M','Karabulut','Siteler,Ankara','M',6317525422);
insert into suser values(65,'ThomasL@gmail.com','02-nov-1988','Thomas','L','Edwards','Strass,Lower Austria','M',9871245710);
insert into suser values(66,'DiegoC@gmail.com','23-may-1985','Diego','C','Alves','Queimados,Brazil','M',7765531489);
insert into suser values(67,'Gaudenzia@gmail.com','12-oct-1996','Gaudenzia','N','Loggia','Castelluccio,Salerno','M',8876745385);
insert into suser values(68,'Tiago@gmail.com','27-sep-1975','Tiago','O','Carrasquil','Casalarreina,La Rioja','M',9621420258);
insert into suser values(69,'BasilNabi@gmail.com','01-may-1997','Basil','T','Nabi','185 Lalchand Road, Chawkbazar,Chittagong','M',7456314202);
insert into suser values(70,'Redimeh@gmail.com','06-feb-1983','Redimeh','P','Pastakia','Motahari St., Tehran','F',8742436984);
insert into suser values(71,'Shi_Qiao@gmail.com','17-aug-1971','Shi','T','Qiao','29/31 Dalhousie Lane, 209691','M',7410583654);
insert into suser values(72,'DFernández@gmail.com','13-nov-1983','Daniel','V','Fernández','Alamar, Havana','M',5410258539);
insert into suser values(73,'Chandra@gmail.com','21-jan-1995','Chandra','S','Sarin','Chennai, Tamil Nadu','M',4102589635);
insert into suser values(74,'Honovi_A@gmail.com','03-may-1977','Honovi','A','Algonquin','Nuevo Leon,Monterrey','M',8742014631);
insert into suser values(75,'JHernández@gmail.com','22-jun-1979','Javier','J','Hernández','Vedado,Havana','M',6317025886);
insert into suser values(76,'Sun-Heng@gmail.com','15-oct-1985','Sun','B','Heng','Ang Eng (St. 13),Phnom Penh','M',3214568720);
insert into suser values(77,'Angela@gmail.com','07-aug-1988','Angela','J','Eskridge','Armbrester Drive,Lomita','F',7410654852);
insert into suser values(78,'ShaKermali@gmail.com','24-dec-1991','Shakar','K','NA','02 route nationale Es-Senia,Oran','M',9365411289);
insert into suser values(79,'Xalomgarza@gmail.com','08-mar-1999','Xalome','D','Garza','Pedro Bernardo,Ávila','F',8527336871);
insert into suser values(80,'LansaSelim@gmail.com','10-aug-2000','Lanasa','S','Selimi','Perballe Shkolles Harry Fultz,Tirana','F',5631475058);


insert into uprofile values('farhan','India','letsdoit','Bella Ciao',1);
insert into uprofile values('norac','London','applepie','Eat-Sleep-Watch-Repeat',2);
insert into uprofile values('robert','London','mypassw7','Sci-fi lover',3);
insert into uprofile values('janice','Colorado','asdfg3@','Horror movies are my favorite',4);
insert into uprofile values('caela','Toronto','jerlemon','Marvel Fan',5);
insert into uprofile values('chandler','Yemen','cherry#8','Netflix and Chill',6);
insert into uprofile values('richard','Sydney','chocmilk','I love Romantic-Comedies',7);
insert into uprofile values('sushil','India','hellothr','I am an autodiadact',8);
insert into uprofile values('Bernadine','Wisconsin','dahti@12','I am an avengers lover',9);
insert into uprofile values('Gregory','California','fased@23','Rockect singh',10);
insert into uprofile values('mega','Africa','dasrt@34','Wall-And-Street',11);
insert into uprofile values('shreya','London','hytri#65','TVF-Pitchers',12);
insert into uprofile values('bavana','Albania','hatui@56','Infiniaty war',13);
insert into uprofile values('vidya','Japan','tyhar$21','Hakuna-Matata',14);
insert into uprofile values('vani','India','ghyt@345','Amozon prime and chill',15);
insert into uprofile values('soundarya','India','fertu@43','Eat-Sleep-Watch-Repeat',16);
insert into uprofile values('naveen','India','fhtyf#23','thrialler movies',17);
insert into uprofile values('akshata','India','gtifr!56','Sci-fi lover',18);
insert into uprofile values('deepak','India','hyer#456','Friendship realted movies are favorite ',19);
insert into uprofile values('anoop','India','deki@123','exclusive short serires',20);
insert into uprofile values('shivprasad','India','shiv@97','life style shows',21);
insert into uprofile values('sanjana','India','sanju#9','Tom And Jerry',22);
insert into uprofile values('aamir','India','aamir@55','Eat-Sleep-Watch-Repeat',23);
insert into uprofile values('bijoy','India','bijoy@8','I am an avengers lover',24);
insert into uprofile values('chandana','India','chandu#1','Marvel Fan',25);
insert into uprofile values('daniyal','India','daniy#88','Tom And Jerry',26);
insert into uprofile values('bishan','India','bishan@7','Tom And Jerry',27);
insert into uprofile values('aarthi','India','aarthi@6','Hakuna-Matata',28);
insert into uprofile values('damodar','India','damod@11','Tom And Jerry',29);
insert into uprofile values('dileep','India','deepu@8','Tom And Jerry',30);
insert into uprofile values('fatima','India','fatima#4','I am an avengers lover',31);
insert into uprofile values('ganesh','India','ganesh@1','Tom And Jerry',32);
insert into uprofile values('indira','India','indu@1','Tom And Jerry',33);
insert into uprofile values('jashwant','India','deki@567','Marvel Fan',34);
insert into uprofile values('nayan','India','nayan@65','Sci-fi lover',35);
insert into uprofile values('eshwar','India','eshwar@1','Tom And Jerry',36);
insert into uprofile values('ritu','India','ritu@9','Tom And Jerry',37);
insert into uprofile values('gayathri','India','gtri@82','I am an autodiadact',38);
insert into uprofile values('mohith','India','mvp@1234','I am an avengers lover',39);
insert into uprofile values('deepthi','India','deepu@66','Tom And Jerry',40);
insert into uprofile values('chandan','India','channa@1','Tom And Jerry',41);
insert into uprofile values('geetha','India','geeta@1','Tom And Jerry',42);
insert into uprofile values('jyothi','India','jyothi@8','Marvel Fan',43);
insert into uprofile values('gita','India','gita#1','Tom And Jerry',44);
insert into uprofile values('mahesh','India','mahi#22','Tom And Jerry',45);
insert into uprofile values('rahul','India','rahul#1','Eat-Sleep-Watch-Repeat',46);
insert into uprofile values('chaithan','India','chaitu@9','I am an avengers lover',47);
insert into uprofile values('pawan','India','pawan@8','Tom And Jerry',48);
insert into uprofile values('hari','India','harikk@1','Marvel Fan',49);
insert into uprofile values('keerthi','India','keti@88','Tom And Jerry',50);
insert into uprofile values('karthik','India','karthi@9','Sci-fi lover',51);
insert into uprofile values('soumya','India','soumya#1','I am an autodiadact',52);
insert into uprofile values('swaroopa','India','swar#12','Tom And Jerry',53);
insert into uprofile values('harsha','India','harsh#89','Tom And Jerry',54);
insert into uprofile values('kiran','India','kiran@12','Sci-fi lover',55);
insert into uprofile values('anil','India','anil@11','I am an avengers lover',56);
insert into uprofile values('maya','India','mayaP@55','Tom And Jerry',57);
insert into uprofile values('varsha','India','varsh@33','I am an autodiadact',58);
insert into uprofile values('shiva','India','shiva@99','Marvel Fan',59);
insert into uprofile values('lakshmi','India','lak@123','Eat-Sleep-Watch-Repeat',60);
insert into uprofile values('Vema','India','lak@123','Horror movies are my favorite',61);
insert into uprofile values('Artzouig','Armenia','Artz@199','Bella Ciao',62);
insert into uprofile values('Badri','Nepal','badri@1','life style shows',63);
insert into uprofile values('Yahsi','Turkey','yahsi@9','Eat-Sleep-Watch-Repeat',64);
insert into uprofile values('Thomas','Austria','Thomas@3','Horror movies are my favorite',65);
insert into uprofile values('Diego','Brazil','Diego@5','thrialler movies',66);
insert into uprofile values('Gaudenzia','Italy','GRR@123','life style shows',67);
insert into uprofile values('Tiago','Spain','Tiago@1','Eat-Sleep-Watch-Repeat',68);
insert into uprofile values('Basil','Bangladesh','Basil@3','Bella Ciao',69);
insert into uprofile values('Redimeh','Iran','RR@11','thrialler movies',70);
insert into uprofile values('Shi','Singapore','Shi@123','life style shows',71);
insert into uprofile values('Daniel','Cuba','Daniel','Eat-Sleep-Watch-Repeat',72);
insert into uprofile values('Chandra','India','chandu@1','I am an avengers lover',73);
insert into uprofile values('Honovi','México','Honovi@7','Horror movies are my favorite',74);
insert into uprofile values('Javier','Cuba','Javier@5','Sci-fi lover',75);
insert into uprofile values('Sun','Cambodia','sun@66','I am an autodiadact',76);
insert into uprofile values('Angela','California','Angel@33','Eat-Sleep-Watch-Repeat',77);
insert into uprofile values('Shakar','Algeria','SS@123','love to watch series',78);
insert into uprofile values('Xalome','Spain','Xalome@2','Marvel Fan',79);
insert into uprofile values('Lanasa','Albania','Lanasa','movie lover',80);


insert into payment values('#po456','Credit Card',499,'4-apr-2020',1);
insert into payment values('#vjkt67','Debit Card',649,'8-apr-2020',2);
insert into payment values('#dery67','Credit Card',799,'6-jul-2020',3);
insert into payment values('#jhvc69','Credit Card',499,'8-sep-2020',4);
insert into payment values('#sle34','Debit Card',649,'22-oct-2020',5);
insert into payment values('#jwml32','Debit Card',799,'9-may-2020',6);
insert into payment values('#moxll2','Credit Card',499,'10-may-2020',7);
insert into payment values('#nxrw12','Debit Card',649,'25-apr-2020',8);
insert into payment values('#34rth','Debit Card',799,'22-may-2020',9);
insert into payment values('#nvrrw','credit Card',799,'11-apr-2020',10);
insert into payment values('#poiuyr','Debit Card',799,'25-apr-2020',11);
insert into payment values('#fghj','Debit Card',799,'20-dec-2020',12);
insert into payment values('#dfghj','Debit Card',799,'12-jun-2020',13);
insert into payment values('#dfgh','Debit Card',799,'25-apr-2020',14);
insert into payment values('#fgwhj','Debit Card',799,'25-jul-2020',15);
insert into payment values('#nxrw','Debit Card',799,'2-apr-2020',16);
insert into payment values('#fghjk','Debit Card',799,'22-may-2020',17);
insert into payment values('#nyu','Debit Card',799,'25-apr-2020',18);
insert into payment values('#nrtyui','Debit Card',799,'25-apr-2020',19);
insert into payment values('#bvc','Debit Card',649,'25-apr-2020',20);
insert into payment values('#jhgf','Credit card',649,'3-may-2020',21);
insert into payment values('#kjgf','Credit card',649,'4-jun-2020',22);
insert into payment values('#hgfdf','Credit card',649,'9-jun-2020',23);
insert into payment values('#dfghr','Debit card',749,'10-jul-2020',24);
insert into payment values('#poiu','Debit card',649,'10-jun-2020',25);
insert into payment values('#hgfds','Debit card',649,'11-apr-2020',26);
insert into payment values('#gdfvh','Debit card',649,'12-apr-2020',27);
insert into payment values('#gkjj','Credit card',749,'13-apr-2020',28);
insert into payment values('#lkjh','Credit card',749,'14-apr-2020',29);
insert into payment values('#kjhg','Credit card',749,'13-apr-2020',30);
insert into payment values('#sdfgh','Debit card',649,'14-apr-2020',31);
insert into payment values('#ijhb','Credit card',749,'15-apr-2020',32);
insert into payment values('#werty','Debit card',649,'16-apr-2020',33);
insert into payment values('#asdfgh','Debit card',649,'17-apr-2020',34);
insert into payment values('#sdfgio','Credit card',749,'18-apr-2020',35);
insert into payment values('#tfcygv','Credit card',749,'19-apr-2020',36);
insert into payment values('#ygvtf','Debit card',649,'20-apr-2020',37);
insert into payment values('#rdxtf','Credit card',649,'21-apr-2020',38);
insert into payment values('#esxtg','Debit card',749,'22-apr-2020',39);
insert into payment values('#weoijh','Credit card',549,'23-apr-2020',40);
insert into payment values('#uhbn','Credit card',649,'24-apr-2020',41);
insert into payment values('#wertoi','Debit card',549,'26-apr-2020',42);
insert into payment values('#bvcx','Debit card',549,'25-apr-2020',43);
insert into payment values('#iuh','Credit card',549,'26-apr-2020',44);
insert into payment values('#uhb','Debit card',549,'27-apr-2020',45);
insert into payment values('#iuyt','Credit card',549,'28-apr-2020',46);
insert into payment values('#wghs09','Debit card',549,'23-apr-2020',47);
insert into payment values('#wnyfd','Credit card',649,'24-apr-2020',48);
insert into payment values('#fhjocj','Debit card',749,'25-apr-2020',49);
insert into payment values('#hciuhc','Debit card',649,'26-apr-2020',50);
insert into payment values('#asdfv','Debit card',649,'27-apr-2020',51);
insert into payment values('#hsedt','Debit card',649,'28-apr-2020',52);
insert into payment values('#ghrze','Debit card',649,'29-apr-2020',53);
insert into payment values('#hdxrd','Debit card',649,'30-apr-2020',54);
insert into payment values('#hxwa','Debit card',649,'1-jun-2020',55);
insert into payment values('#hysk','Debit card',649,'2-jun-2020',56);
insert into payment values('#gcrs','Debit card',649,'3-jun-2020',57);
insert into payment values('#sess','Debit card',649,'4-jun-2020',58);
insert into payment values('#res4','Debit card',649,'5-jun-2020',59);
insert into payment values('#hawd','Debit card',649,'6-jun-2020',60);
insert into payment values('@hfer','Debit card',649,'19-jun-2020',61);
insert into payment values('$juel','Debit card',749,'09-jun-2020',62);
insert into payment values('#ueli','Debit card',649,'10-nov-2020',63);
insert into payment values('@ght2','Debit card',749,'20-jun-2020',64);
insert into payment values('$dfty','Debit card',649,'12-jun-2020',65);
insert into payment values('@hjut','Debit card',749,'13-jun-2020',66);
insert into payment values('4drhy','Debit card',649,'14-jun-2020',67);
insert into payment values('$jqlo','Debit card',749,'15-jun-2020',68);
insert into payment values('#uied','Debit card',649,'16-jun-2020',69);
insert into payment values('@juvv','Debit card',749,'18-jun-2020',70);
insert into payment values('@ftih','Debit card',649,'14-jun-2020',71);
insert into payment values('#hath','Debit card',749,'22-jun-2020',72);
insert into payment values('$hatt','Credit card',549,'15-jun-2020',73);
insert into payment values('@gakc','Credit card',649,'19-jun-2020',74);
insert into payment values('#jadf','Credit card',749,'26-jun-2020',75);
insert into payment values('@jasv','Credit card',549,'29-jun-2020',76);
insert into payment values('$asvv','Credit card',749,'30-jun-2020',77);
insert into payment values('$usal','Credit card',549,'30-jun-2020',78);
insert into payment values('#wlay','Debit card',649,'12-jun-2020',79);


insert into paymentdetails values(3456737865123897,'Mastercard','aug-2022','Debit Card','farhan','#po456');
insert into paymentdetails values(2356748976345673,'visa','oct-2023','Credit Card','norac','#vjkt67');
insert into paymentdetails values(4562378956348976,'Capital One','jan-2021','Debit Card','robert','#dery67');
insert into paymentdetails values(3526754789453672,'Visa','feb-2022','Credit Card','janice','#jhvc69');
insert into paymentdetails values(1328396540866547,'Mastercard','mar-2023','Debit Card','caela','#sle34');
insert into paymentdetails values(4305673456287659,'Capital One','apr-2024','Credit Card','chandler','#jwml32');
insert into paymentdetails values(4527645556437892,'Visa','may-2021','Debit Card','richard','#moxll2');
insert into paymentdetails values(6734536790003453,'Mastercard','jun-2022','Credit Card','sushil','#nxrw12');
insert into paymentdetails values(9865783765120748,'Visa','jul-2023','Debit Card','Bernadine','#34rth');
insert into paymentdetails values(6754389642387654,'Capital One','aug-2022','Credit Card','Gregory','#nvrrw');
insert into paymentdetails values(1653897666542237,'Mastercard','sep-2021','Debit Card','mega','#poiuyr');
insert into paymentdetails values(6389452316788534,'Visa','oct-2022','Credit Card','shreya','#hawd');
insert into paymentdetails values(1325634786566678,'Capital One','nov-2023','Debit Card','bavana','#fghj');
insert into paymentdetails values(1234000034561236,'Visa','nov-2020','Credit Card','vidya','#dfghj');
insert into paymentdetails values(9845234123456723,'Mastercard','sep-2021','Debit Card','vani','#dfgh');
insert into paymentdetails values(5437823428913425,'Capital One','dec-2022','Credit Card','soundarya','#fgwhj');
insert into paymentdetails values(2143765489653421,'Visa','jan-2024',' Debit Card','naveen','#nxrw');
insert into paymentdetails values(3245367423517685,'Mastercard','jul-2023',' Credit Card','akshata','#fghjk');
insert into paymentdetails values(7645664233176543,'Capital One','aug-2024','Debit Card','deepak','#nyu');
insert into paymentdetails values(8653427812345623,'Visa','sep-2025','Credit Card','anoop','#nrtyui');
insert into paymentdetails values(8953245532214564,'Matercard','oct-2023','Debit Card','shivprasad','#bvc');
insert into paymentdetails values(5643216743896654,'Capital One','sep-2021','Credit Card','sanjana','#jhgf');
insert into paymentdetails values(4321675543278653,'Visa','feb-2026','Debit Card','aamir','#kjgf');
insert into paymentdetails values(2431563376552287,'Mastercard','dec-2026',' Credit Card','bijoy','#hgfdf');
insert into paymentdetails values(6534897654312348,'Capital One','nov-2022','Credit Card','chandana','#dfghr');
insert into paymentdetails values(5327899965423331,'Visa','oct-2023','Debit Card','daniyal','#poiu');
insert into paymentdetails values(4453123278563427,'Mastercard','-2021',' Credit Card','bishan','#hgfds');
insert into paymentdetails values(6542136743589563,'Capital One','may-2024','Debit Card','aarthi','#gdfvh');
insert into paymentdetails values(4326712785367430,'Visa','jun-2022','Credit Card','damodar','#gkjj');
insert into paymentdetails values(7645321789654327,'Mastercard','sep-2021',' Debit Card','dileep','#lkjh');
insert into paymentdetails values(2352893456721098,'Chase','dec-2020','Debit Card','fatima','#kjhg');
insert into paymentdetails values(2341567438967452,'Capital One','oct-2022',' Debit Card','ganesh','#sdfgh');
insert into paymentdetails values(8954312456785436,'Visa','may-2021','Credit Card','indira','#ijhb');
insert into paymentdetails values(5431278643562389,'Mastercard','jun-2022',' Debit Card','jashwant','#werty');
insert into paymentdetails values(2345678523412356,'Capital One','may-2023',' Credit Card','nayan','#asdfgh');
insert into paymentdetails values(5623416723452346,'Visa','mar-2020',' Debit Card','eshwar','#sdfgio');
insert into paymentdetails values(6743221345678543,'Mastercard','apr-2021',' Credit Card','ritu','#tfcygv');
insert into paymentdetails values(7856432456438951,'Capital One','jun-2025',' Debit Card','gayathri','#ygvtf');
insert into paymentdetails values(8976543217648900,'Mastercard','jul-2022',' Credit Card','mohith','#rdxtf');
insert into paymentdetails values(1239087600775536,'Visa','aug-2023',' Debit Card','deepthi','#esxtg');
insert into paymentdetails values(7890654312345608,'Capital One','sep-2022',' Credit Card','chandan','#weoijh');
insert into paymentdetails values(9203123467891209,'Mastercard','jan-2021','Credit Card','geetha','#uhbn');
insert into paymentdetails values(6755443377889922,'Mastercard','oct-2021',' Debit Card','jyothi','#wertoi');
insert into paymentdetails values(7864123906745656,'Visa','nov-2023',' Credit Card','gita','#bvcx');
insert into paymentdetails values(7890000765321178,'Capital One','dec-2024',' Debit Card','mahesh','#iuh');
insert into paymentdetails values(7785525591011123,'Mastercard','jan-2020',' Credit Card','rahul','#uhb');
insert into paymentdetails values(7891456230163825,'Visa','feb-2022',' Debit Card','chaithan','#iuyt');
insert into paymentdetails values(4554536776221893,'Capital One','mar-2021',' Credit Card','pawan','#wghs09');
insert into paymentdetails values(7890651234567035,'Mastercard','apr-2022',' Debit Card','hari','#wnyfd');
insert into paymentdetails values(8899007766554411,'Visa','may-2023',' Credit Card','keerthi','#fhjocj');
insert into paymentdetails values(6644778833981234,'Capital One','jun -2020',' Debit Card','karthik','#hciuhc');
insert into paymentdetails values(1000023455771228,'Mastercard','jul-2021',' Credit Card','soumya','#asdfv');
insert into paymentdetails values(7001245637856489,'Visa','aug-2022',' Debit Card','swaroopa','#hsedt');
insert into paymentdetails values(6621678543789209,'Capital One','oct-2023',' Credit Card','harsha','#ghrze');
insert into paymentdetails values(7722664453789109,'Visa','nov-2022',' Debit Card','kiran','#hdxrd');
insert into paymentdetails values(8833125674329010,'Mastercard','dec-2023',' Credit Card','anil','#hxwa');
insert into paymentdetails values(1234000034561239,'Visa','nov-2020','Credit Card','maya','#hysk');
insert into paymentdetails values(3453456789001234,'Mastercard','dec-2020','Debit Card','varsha','#gcrs');
insert into paymentdetails values(2356453212678900,'Mastercard','jan-2021','Credit Crad','shiva','#sess');
insert into paymentdetails values(2367689234517890,'Visa','feb-2021','Credit Card','lakshmi','#res4');
insert into paymentdetails values(6755443377889922,'Mastercard','oct-2021',' Debit Card','Vema','@hfer');
insert into paymentdetails values(7864123906745656,'Visa','nov-2023','Credit Card','Artzouig','$juel');
insert into paymentdetails values(7890000765321178,'Capital One','dec-2024',' Debit Card','Badri','#ueli');
insert into paymentdetails values(7785525591011123,'Mastercard','jan-2020',' Credit Card','Yahsi','@ght2');
insert into paymentdetails values(7891456230163825,'Visa','feb-2022',' Debit Card','Thomas','$dfty');
insert into paymentdetails values(4554536776221893,'Capital One','mar-2021',' Credit Card','Diego','@hjut');
insert into paymentdetails values(7890651234567035,'Mastercard','apr-2022',' Debit Card','Gaudenzia','4drhy');
insert into paymentdetails values(8899007766554411,'Visa','may-2023',' Credit Card','Tiago','$jqlo');
insert into paymentdetails values(6644778833981234,'Capital One','jun -2020',' Debit Card','Basil','#uied');
insert into paymentdetails values(1000023455771228,'Mastercard','jul-2021',' Credit Card','Redimeh','@juvv');
insert into paymentdetails values(7001245637856489,'Visa','aug-2022',' Debit Card','Shi','@ftih');
insert into paymentdetails values(6621678543789209,'Capital One','oct-2023',' Credit Card','Daniel','#hath');
insert into paymentdetails values(7722664453789109,'Visa','nov-2022',' Debit Card','Chandra','$hatt');
insert into paymentdetails values(8833125674329010,'Mastercard','dec-2020',' Credit Card','Honovi','@gakc');
insert into paymentdetails values(6742901177300002,'Capital One','jan-2021',' Debit Card','Javier','#jadf');
insert into paymentdetails values(7776664422891146,'Mastercard','feb-2020',' Credit Card','Sun','@jasv');
insert into paymentdetails values(6611990022774893,'Visa','mar-2021',' Debit Card','Angela','$asvv');
insert into paymentdetails values(1230965478546729,'Mastercard','apr-2023',' Credit Card','Shakar','$usal');
insert into paymentdetails values(7722551005536778,'Capital One','may-2021',' Debit Card','Xalome','#wlay');
insert into paymentdetails values(1122885556637832,'Mastercard','jun-2022',' Credit Card','Lanasa','#fryu');


insert into subscription values('01ab','4-apr-2020','4-may-2020',499,'Basic','#po456');
insert into subscription values('02cd','8-apr-2020','8-may-2020',649,'Standard','#vjkt67');
insert into subscription values('03ef','6-jul-2020','6-aug-2020',799,'Premium','#dery67');
insert into subscription values('04gh','8-sep-2020','8-oct-2020',499,'Basic','#jhvc69');
insert into subscription values('05ij','22-oct-2020','22-nov-2020',649,'Standard','#sle34');
insert into subscription values('06er','9-may-2020','12-jun-2020',799,'Premium','#jwml32');
insert into subscription values('07ty','10-may-2020','15-jun-2020',499,'Basic','#moxll2');
insert into subscription values('08yu','25-apr-2020','18-may-2020',649,'Standard','#nxrw12');
insert into subscription values('09xj','22-may-2020','22-july-2020',649,'Standard','#34rth');
insert into subscription values('10vu','11-apr-2020','18-may-2020',649,'basic','#nvrrw');
insert into subscription values('11fgjk','25-apr-2020','18-may-2020',799,'premium','#poiuyr');
insert into subscription values('12sdfg','20-dec-2020','18-apr-2021',649,'Standard','#fghj');
insert into subscription values('13iuy','12-jun-2020','18-may-2021',1999,'Standard','#dfghj');
insert into subscription values('14sdhj','25-apr-2020','18-may-2020',649,'basic','#dfgh');
insert into subscription values('15oiuf','25-jul-2020','18-aug-2020',799,'Standard','#fgwhj');
insert into subscription values('16xcv','2-apr-2020','18-may-2020',649,'premium','#nxrw');
insert into subscription values('17bgfd','22-may-2020','18-jul-2020',649,'Standard','#fghjk');
insert into subscription values('18jhgf','25-apr-2020','29-may-2020',649,'Standard','#nyu');
insert into subscription values('19hgfd','25-apr-2020','14-may-2020',649,'Standard','#nrtyui');
insert into subscription values('20asdf','25-apr-2020','14-may-2020',649,'Standard','#bvc');
insert into subscription values('21asd','3-may-2020','15-jul-2020',649,'basic','#jhgf');
insert into subscription values('22kjfd','4-jun-2020','16-jul-2020',649,'premium','#kjgf');
insert into subscription values('23hgf','9-jun-2020','17-jul-2020',649,'basic','#hgfdf');
insert into subscription values('24wert','10-jul-2020','18-sep-2020',749,'standard','#dfghr');
insert into subscription values('25asdf','10-jun-2020','19-jul-2020',649,'basic','#poiu');
insert into subscription values('26dsfs','11-apr-2020','30-may-2020',649,'Standard','#hgfds');
insert into subscription values('27fghj','12-apr-2020','31-may-2020',649,'Standard','#gdfvh');
insert into subscription values('28gkjh','13-apr-2020','1-may-2020',749,'premium','#gkjj');
insert into subscription values('29lkjh','14-apr-2020','2-may-2020',749,'premium','#lkjh');
insert into subscription values('30gkjh','13-apr-2020','8-may-2020',749,'premium','#kjhg');
insert into subscription values('31oiuh','14-apr-2020','6-may-2020',649,'standard','#sdfgh');
insert into subscription values('32lkm','15-apr-2020','7-may-2020',749,'basic','#ijhb');
insert into subscription values('33dsz','16-apr-2020','8-may-2020',649,'premium','#werty');
insert into subscription values('34dcv','17-apr-2020','9-may-2020',649,'standard','#asdfgh');
insert into subscription values('35jnyh','18-apr-2020','10-may-2020',749,'premium','#sdfgio');
insert into subscription values('36','19-apr-2020','11-may-2020',749,'standard','#tfcygv');
insert into subscription values('37kmij','20-apr-2020','12-may-2020',649,'basic','#ygvtf');
insert into subscription values('38ztf','21-apr-2020','13-may-2020',649,'premium','#rdxtf');
insert into subscription values('39azsx','22-apr-2020','14-may-2020',749,'standard','#esxtg');
insert into subscription values('40iuy','23-apr-2020','15-may-2020',549,'premium','#weoijh');
insert into subscription values('41tyu','24-apr-2020','16-may-2020',649,'basic','#uhbn');
insert into subscription values('42iuy','26-apr-2020','17-may-2020',549,'premium','#wertoi');
insert into subscription values('43iuy','25-apr-2020','18-may-2020',549,'premium','#bvcx');
insert into subscription values('44iuy','26-apr-2020','19-may-2020',549,'basic','#iuh');
insert into subscription values('45iuw4','27-apr-2020','20-may-2020',549,'premium','#uhb');
insert into subscription values('46iuy','28-apr-2020','21-may-2020',549,'basic','#iuyt');
insert into subscription values('47iuy','23-apr-2020','15-may-2020',549,'premium','#wghs09');
insert into subscription values('48iuy','24-apr-2020','16-may-2020',649,'basic','#wnyfd');
insert into subscription values('49iuy','25-apr-2020','17-may-2020',749,'standard','#fhjocj');
insert into subscription values('50iuy','26-apr-2020','18-may-2020',649,'basic','#hciuhc');
insert into subscription values('51iuy','27-apr-2020','19-may-2020',649,'basic','#asdfv');
insert into subscription values('52uy','28-apr-2020','19-may-2020',649,'basic','#hsedt');
insert into subscription values('53iu4','29-apr-2020','20-may-2020',649,'premium','#ghrze');
insert into subscription values('54iuy','30-apr-2020','21-may-2020',649,'basic','#hdxrd');
insert into subscription values('55iuy','1-jun-2020','15-jul-2020',649,'premium','#hxwa');
insert into subscription values('56iuy','2-jun-2020','16-jul-2020',649,'basic','#hysk');
insert into subscription values('57iuy','3-jun-2020','17-jul-2020',649,'standard','#gcrs');
insert into subscription values('58iuy','4-jun-2020','18-jul-2020',649,'basic','#sess');
insert into subscription values('59iuy','5-jun-2020','19-jul-2020',649,'basic','#res4');
insert into subscription values('60iuy','6-jun-2020','20-jul-2020',649,'basic','#hawd');
insert into subscription values('61iuy','19-jun-2020','17-jul-2020',649,'basic','@hfer');
insert into subscription values('62iuy','09-jun-2020','07-jul-2020',749,'standard','$juel');
insert into subscription values('63iuy','10-nov-2020','30-jul-2020',649,'premium','#ueli');
insert into subscription values('64iuy','20-jun-2020','18-jul-2020',749,'basic','@ght2');
insert into subscription values('65iuy','30-mar-2019','20-apr-2019',649,'standard','#fryu');
insert into subscription values('66iuy','12-jun-2020','10-jul-2020',649,'standard','$dfty');
insert into subscription values('67iuy','13-jun-2020','11-jul-2020',749,'basic','@hjut');
insert into subscription values('68iuy','14-jun-2020','12-jul-2020',649,'premium','4drhy');
insert into subscription values('69iuy','15-jun-2020','13-jul-2020',749,'basic','$jqlo');
insert into subscription values('70iuy','16-jun-2020','14-jul-2020',649,'standard','#uied');
insert into subscription values('71iuy','18-jun-2020','16-jul-2020',749,'basic','@juvv');
insert into subscription values('72iuy','16-jun-2020','14-jul-2020',649,'standard','@ftih');
insert into subscription values('73iuy','22-jun-2020','20-jul-2020',749,'premium','#hath');
insert into subscription values('74iuy','15-jun-2020','13-jul-2020',549,'standard','$hatt');
insert into subscription values('75iuy','19-jun-2020','17-jul-2020',649,'basic','@gakc');
insert into subscription values('76iuy','26-jun-2020','24-jul-2020',749,'premium','#jadf');
insert into subscription values('77iuy','29-jun-2020','27-jul-2020',549,'standard','@jasv');
insert into subscription values('78iuy','30-jun-2020','28-jul-2020',749,'premium','$asvv');
insert into subscription values('79iuy','30-jun-2020','29-jul-2020',549,'basic','$usal');
insert into subscription values('80iuy','12-jun-2020','10-jul-2020',649,'standard','#wlay');


insert into tvshow values(10,'Stranger Things','Tv Series','6-nov-2018',90,4.6);
insert into tvshow values(20,'Chernobyl Diaries','Movie','19-jan-2019',120,4.8);
insert into tvshow values(30,'Friends','Tv Series','12-feb-1994',150,4.9);
insert into tvshow values(40,'Money heist','Tv Series','4-mar-2019',120,4.7);
insert into tvshow values(50,'Big Bang theory','Tv Series','6-mar-1998',90,3.8);
insert into tvshow values(60,'Haunted','Tv Series','9-feb-2000',180,4.0);
insert into tvshow values(70,'How I Met your Mother','Tv Series','16-apr-2001',120,4.2);
insert into tvshow values(80,'Bhoot','Movie','13-apr-2003',120,2.7);
insert into tvshow values(90,'Game of thrones','Tv Series','12-sep-2002',90,4.6);
insert into tvshow values(100,'Marriage Story','Movie','21-may-2004',120,3.9);
insert into tvshow values(110,'The Matrix','Movie','31-Mar-1999',150,4.5);
insert into tvshow values(120,'Black Mirror','Tv Series','4-Dec-2011',120,4.3);
insert into tvshow values(130,'Ozark','Tv Series','21-Jul-2017',150,3.4);
insert into tvshow values(140,'Money Hiest','Tv Series','17-Jan-2016',110,4.5);
insert into tvshow values(150,'Mirzapur','Tv Series','01-Jun-2015',105,3.4);
insert into tvshow values(160,'Tom and Jerry','Movie','23-apr-2017',180,4.4);
insert into tvshow values(170,' Family Man','Tv Series','28-Jun-2015',150,3.6);
insert into tvshow values(180,' Hostel Days','Tv Series','21-feb-2011',180,4.6);
insert into tvshow values(190,' Ae dil hai mushkil','Movie','20-mar-2016',150,3.3);
insert into tvshow values(200,' Robert','Movie','30-apr-2017',130,3.9);
insert into tvshow values(210,' Kong skull Island','Tv Series','12-may-2012',120,3.4);
insert into tvshow values(220,' Shukra','Movie','18-Jun-1998',120,2.7);
insert into tvshow values(230,' Nizhal','Tv Series','05-Jul-2015',170,4.6);
insert into tvshow values(240,' Paatal Lok','Movie','30-apr-2019',190,3.8);
insert into tvshow values(250,' Panchayat','Tv Series','09-Jun-2013',160,3.6);
insert into tvshow values(260,' Aanandam','Movie','19-Jul-2014',170,4.6);
insert into tvshow values(270,' Pushpavalli','Tv Series','08-aug-2015',130,4.6);
insert into tvshow values(280,' The Forgotten Aramy','Movie','18-sep-2018',120,4.6);
insert into tvshow values(290,' The Last Hour','Tv Series','07-oct-2016',110,4.6);
insert into tvshow values(300,'  Under Ground Rail Road','Movie','17-nov-2014',190,4.4);
insert into tvshow values(310,' Panic','Tv Series','06-dec-2013',160,4.2);
insert into tvshow values(320,' Katha Sangama','Movie','16-Jan-2011',170,4.7);
insert into tvshow values(330,' Four More Shots Please','Tv Series','05-feb-2010',180,3.9);
insert into tvshow values(340,'Ribbon','Movie','04-mar-2010',180,3.7);
insert into tvshow values(350,' The Lie','Tv Series','14-apr-2011',140,4.6);
insert into tvshow values(360,' Reign','Movie','03-may-2017',130,4.6);
insert into tvshow values(370,' Another Round','Tv Series','13-Jun-2018',110,4.7);
insert into tvshow values(380,' Chemical Hearts','Movie','02-Jul-1998',120,4.5);
insert into tvshow values(390,' Photograph','Tv Series','12-aug-2017',170,4.2);
insert into tvshow values(400,' Summer Camp','Movie','01-sep-2002',180,4.9);
insert into tvshow values(410,' Dont Breathe','Tv Series','10-oct-1987',110,4.6);
insert into tvshow values(420,' Minari','Movie','11-nov-1978',120,4.6);
insert into tvshow values(430,' Just Add Magic','Tv Series','13-dec-1984',130,4.4);
insert into tvshow values(440,'Solos ','Movie','12-Jan-2018',140,4.9);
insert into tvshow values(450,' Pink','Tv Series','14-feb-2015',150,4.2);
insert into tvshow values(460,' The Last Ship','Movie','15-mar-2016',160,4.7);
insert into tvshow values(470,' The Boy From Medellian','Tv Series','16-apr-2018',170,3.9);
insert into tvshow values(480,' Two Broke Girls','Movie','18-may-2019',180,4.5);
insert into tvshow values(490,' What If','Tv Series','17-Jun-2010',190,4.5);
insert into tvshow values(500,' Godzilla','Movie','22-Jul-2017',110,4.8);
insert into tvshow values(510,' Godzilla','Tv Series','23-aug-2018',100,4.8);
insert into tvshow values(520,' Tenet','Movie','29-sep-2019',120,3.8);
insert into tvshow values(530,' Harry Potter','Tv Series','23-oct-2020',170,3.9);
insert into tvshow values(540,' The Flash','Movie','20-nov-2021',190,4.7);
insert into tvshow values(550,' Sound Of Metal','Tv Series','26-dec-2010',160,4.9);
insert into tvshow values(560,' Gladiator','Movie','12-Jan-2011',150,3.5);
insert into tvshow values(570,' The Truman Show','Tv Series','15-Jul-2012',140,4.8);
insert into tvshow values(580,' The Mentalist','Movie','13-aug-2013',120,4.8);
insert into tvshow values(590,' Good News','Tv Series','11-sep-2010',130,4.8);
insert into tvshow values(600,' War','Movies','10-oct-2015',150,3.8);
insert into tvshow values(610,' Hum Hai Players','Tv Series','13-nov-2017',140,3.8);
insert into tvshow values(620,' Theeran','Movie','19-dec-2018',120,4.8);
insert into tvshow values(630,' One Day','Movie','21-Jan-2014',130,4.8);
insert into tvshow values(640,' Wazir','Tv Series','22-feb-2012',110,4.8);
insert into tvshow values(650,' Chakde','Movie','27-mar-2016',180,4.5);
insert into tvshow values(660,' Veer Zaara','Tv Series','18-apr-2013',190,4.3);
insert into tvshow values(670,' Band Baaja Baaut','Movie','15-may-2011',150,4.5);
insert into tvshow values(680,' Jab Tak Hai Jaan','Tv Series','19-Jun-2012',160,3.5);
insert into tvshow values(690,' Sholay','Movie','26-Jul-2013',170,4.5);
insert into tvshow values(700,' Hum Tum','Tv Series','27-sep-2014',180,4.6);
insert into tvshow values(710,' Penguin','Movie','01-oct-2015',190,4.8);
insert into tvshow values(720,' Mm Df','Tv Series','05-nov-2018',180,4.8);
insert into tvshow values(730,' Love Mocktail','Movie','19-dec-2013',170,4.8);
insert into tvshow values(740,' Birbal','Tv Series','20-jan-2017',160,3.8);
insert into tvshow values(750,' Rathaavara','Movie','28-feb-2018',150,4.7);
insert into tvshow values(760,' Mahira','Tv Series','29-apr-2014',140,4.5);
insert into tvshow values(770,' Gatham','Movie','30-may-2015',170,4.9);
insert into tvshow values(780,' Kgf','Tv Series','30-jun-2010',130,3.6);
insert into tvshow values(790,' Bakrid','Movie','16-Jul-2016',190,4.5);
insert into tvshow values(800,' Mithai','Tv Series','17-jan-2012',140,4.6);


insert into tcast values(1001,'Millie','Brown','F','3-feb-2001');
insert into tcast values(1002,'David','Schwimmer','M','6-mar-1986');
insert into tcast values(1003,'Matthew','Perry','M','14-apr-1987');
insert into tcast values(1004,'Courtney','Cox','F','16-feb-1984');
insert into tcast values(1005,'Jennifer','Aniston','F','12-may-1982');
insert into tcast values(1006,'Sophie','Turner','F','14-sep-1992');
insert into tcast values(1007,'Rose','Leslie','F','14-oct-1994');
insert into tcast values(1008,'Cobie','Smulders','F','12-jan-1976');
insert into tcast values(1009,'Neil','Harris','M','12-jan-1976');
insert into tcast values(1010,'Jim','Parsons','M','13-apr-1982');
insert into tcast values(1011,'Finn','Wolfhard','M','12-mar-2000');
insert into tcast values(1012,'Ajay','Devgan','M','13-mar-1969');
insert into tcast values(1013,'Urmila','MatondKar','F','16-jun-1982');
insert into tcast values(1014,'Matt','LeBlanc','M','18-feb-1972');
insert into tcast values(1015,'Lisa','Kudrow','F','23-jan-1981');
insert into tcast values(1016,'Laura','Linney','F','05-feb-1964'); 
insert into tcast values(1017,'Skylar','Gaertner','M','17-dec-2004');
insert into tcast values(1018,'Michaela','Coel','F','01-oct-1987');
insert into tcast values(1019,'Keanu','Reeves','F','02-sep-1964');
insert into tcast values(1020,'Monica','Bellucci','F','30-sep-1964');
insert into tcast values(1021,'Scarlett','Johansson','F','22-nov-1984');
insert into tcast values(1022,'Adam','Driver','M','19-nov-1983');
insert into tcast values(1023,'Mike','Kenvar','M','13-nov-1981'); 
insert into tcast values(1024,'Will','Denvar','M','10-sep-1987');
insert into tcast values(1025,'Lucas','Intar','M','05-jul-2004');
insert into tcast values(1026,'Madmax','gillay','F','04-jan-2001');
insert into tcast values(1027,'Joies','Masti','F','11-may-2008');
insert into tcast values(1028,'Dustin','sutin','M','06-jan-1991');
insert into tcast values(1029,'Noah','Schnapp','M','07-jul-1982');
insert into tcast values(1030,'Natalia','Dyer','F','02-mar-1981');
insert into tcast values(1031,'Gaten','Matarazzo','M','18-apr-2002');
insert into tcast values(1032,'Winona','Ryder','F','01-may-1985');
insert into tcast values(1033,'Cabel','Mclaughlin','M','05-jun-1987');
insert into tcast values(1034,'Sadie','Sink','F','11-oct-2006');
insert into tcast values(1035,'Charlie','Hoten','M','06-apr-1984');
insert into tcast values(1036,'Maya','Hawke','F','09-may-1986');
insert into tcast values(1037,'Joe','Keery','M','16-aug-1983');
insert into tcast values(1038,'Cara','Buono','F','19-feb-1997');
insert into tcast values(1039,'Dacre','Montgomery','M','15-sep-1989');
insert into tcast values(1040,'Priah','Ferguson','F','07-jul-1876');
insert into tcast values(1041,'Matthew','Modien','M','30-aug-1856');
insert into tcast values(1042,'Shannon','Purser','F','03-Nov-1987');
insert into tcast values(1043,'Paul','Resier','M','12-oct-1893');
insert into tcast values(1044,'Linnea','Berthelsen','F','01-jul-2001');
insert into tcast values(1045,'Joseph','Quinn','M','15-jan-2001');
insert into tcast values(1046,'Francesca','Reale','F','15-aug-1998');
insert into tcast values(1047,'Jake','Busey','M','15-dec-2001');
insert into tcast values(1048,'Aimee','Mullins','F','21-oct-1998');
insert into tcast values(1049,'Matthew','Cardarople','M','18-feb-2004');
insert into tcast values(1050,'Finn','Wolfhard','F','04-may-2006');
insert into tcast values(1051,'Robert','Englund','M','16-feb-1984');
insert into tcast values(1052,'Gabriella','Pizzalo','F','05-sep-2006');
insert into tcast values(1053,'Andrey','Ivchenko','M','19-oct-1986');
insert into tcast values(1054,'Catherine','Curtin','F','10-Nov-1982');
insert into tcast values(1055,'Michael','Park','M','01-jun-1894');
insert into tcast values(1056,'Madelyn','Cline','F','15-feb-1845');
insert into tcast values(1057,'Alec','Utgoff','M','06-apr-1986');
insert into tcast values(1058,'Mark','Steger','F','14-mar-1897');
insert into tcast values(1059,'Randy','Haves','M','27-may-1999');
insert into tcast values(1060,'Davin','Harbour','F','28-jul-1893');
insert into tcast values(1061,'Ursual','Corbero','M','15-jun-1956');
insert into tcast values(1062,'Alvaro','Morte','F','05-jan-1785');
insert into tcast values(1063,'Itzir','Ituno','M','09-feb-1896');
insert into tcast values(1064,'Jaime','Lorente','F','17-jul-1789');
insert into tcast values(1065,'Miguel','Herran','M','14-feb-1892');
insert into tcast values(1066,'Pedor','Alonso','F','18-may-1975');
insert into tcast values(1067,'Alba','Flores','M','28-jun-1978');
insert into tcast values(1068,'Esther','Acebo','F','26-jul-1879');
insert into tcast values(1069,'Darko','peric','M','22-jan-1987');
insert into tcast values(1070,'Najwa','Nimri','F','25-aug-2000');
insert into tcast values(1071,'Urvi ','Singh','F','21-sep-2001');
insert into tcast values(1072,'Jitendra','Kumar','M','20-oct-2005');
insert into tcast values(1073,'Revathi','Pillai','F','18-nov-2004');
insert into tcast values(1074,'Ahsaas','Channa','M','16-dec-2000');
insert into tcast values(1075,'Mayur','More','F','29-jun-2006');
insert into tcast values(1076,'Alam','Khan','M','25-aug-2008');
insert into tcast values(1077,'Shivan','Singh','F','23-feb-1987');
insert into tcast values(1078,'Sameer','Saxena','M','18-aug-1967');
insert into tcast values(1079,'Saurabh','Khanna','F','20-jun-2000');
insert into tcast values(1080,'Deepa','Simwal','F','15-jul-1998');


insert into director values(101,'Shawn','Levy',10,'12-feb-1982');
insert into director values(102,'Johan','Renck',20,'13-apr-1971');
insert into director values(103,'James','Burrows',30,'13-apr-1971');
insert into director values(104,'Alex','Pina',40,'13-jun-1974');
insert into director values(105,'Mark','Cendrowski',50,'13-apr-1983');
insert into director values(106,'Vikram','Bhatt',60,'14-mar-1965');
insert into director values(107,'Pamela','Fryman',70,'15-feb-1991');
insert into director values(108,'Aditya','Chakrborty',80,'21-jan-1986');
insert into director values(109,'David','Benioff',90,'24-nov-1987');
insert into director values(110,'Guy','Baumbach',100,'25-dec-1980');
insert into director values(111,'Lana','Wachowski',110,'26-Jan-1979');
insert into director values(112,'Charlie','Brooker',120,'3-Mar-1971');
insert into director values(113,'Jason','Bateman',130,'14-Jan-1969');
insert into director values(114,'Shawn','Levy',140,'08-feb-1982');
insert into director values(115,'Johan','Renck',150,'23-apr-1971');
insert into director values(116,'James','Burrows',160,'03-apr-1971');
insert into director values(117,'Alex','Pina',170,'10-jun-1974');
insert into director values(118,'Mark','Cendrowski',180,'23-apr-1983');
insert into director values(119,'Vikram','Bhatt',190,'16-mar-1965');
insert into director values(120,'Pamela','Fryman',200,'05-feb-1991');
insert into director values(121,'Aditya','Chakrborty',210,'11-jan-1986');
insert into director values(122,'David','Benioff',220,'14-nov-1987');
insert into director values(123,'Guy','Baumbach',230,'05-dec-1980');
insert into director values(124,'Lana','Wachowski',240,'06-Jan-1979');
insert into director values(125,'Charlie','Brooker',250,'13-Mar-1971');
insert into director values(126,'Jason','Bateman',260,'19-Jan-1969');
insert into director values(127,'Shawn','Levy',270,'11-feb-1982');
insert into director values(128,'Johan','Renck',280,'18-apr-1971');
insert into director values(129,'James','Burrows',290,'08-apr-1971');
insert into director values(130,'Alex','Pina',300,'22-jun-1974');
insert into director values(131,'Mark','Cendrowski',310,'11-apr-1983');
insert into director values(132,'Vikram','Bhatt',320,'18-mar-1965');
insert into director values(133,'Pamela','Fryman',330,'01-feb-1991');
insert into director values(134,'Aditya','Chakrborty',340,'24-jan-1986');
insert into director values(135,'David','Benioff',350,'29-nov-1987');
insert into director values(136,'Guy','Baumbach',360,'02-dec-1980');
insert into director values(137,'Lana','Wachowski',370,'29-Jan-1979');
insert into director values(138,'Charlie','Brooker',380,'03-Mar-1971');
insert into director values(139,'Jason','Bateman',390,'04-Jan-1969');
insert into director values(140,'Shawn','Levy',400,'02-feb-1982');
insert into director values(141,'Johan','Renck',410,'23-apr-1971');
insert into director values(142,'James','Burrows',420,'13-apr-1971');
insert into director values(143,'Alex','Pina',430,'11-jun-1974');
insert into director values(144,'Mark','Cendrowski',440,'19-apr-1983');
insert into director values(145,'Vikram','Bhatt',450,'09-mar-1965');
insert into director values(146,'Pamela','Fryman',460,'13-feb-1991');
insert into director values(147,'James','Burrows',470,'09-jan-1986');
insert into director values(148,'Johan','Renck',480,'23-jan-1986');
insert into director values(149,'Aditya','Chakrborty',490,'11-jan-1986');
insert into director values(150,'David','Benioff',500,'22-nov-1987');
insert into director values(151,'Edelmira','Farías',510,'13-dec-1988');
insert into director values(152,'Sunniva','Johnsen',520,'17-jun-1997');
insert into director values(153,'Teana','Taylor',530,'11-apr-1988');
insert into director values(154,'Kyle','Rabanti',540,'25-aug-1985');
insert into director values(155,'Damali','Solal',550,'28-jul-1977');
insert into director values(156,'Derek','Menendez',560,'04-oct-1972');
insert into director values(157,'Tikva','Gadi',570,'27-nov-1979');
insert into director values(158,'Jaden','Aarnoutse',580,'23-jan-1981');
insert into director values(159,'Nirveli','Moquelumna',590,'12-mar-1991');
insert into director values(160,'Timothy','Stewart',600,'13-feb-1981');
insert into director values(161,'Niall','O',610,'19-nov-1987');
insert into director values(162,'Parphullat','Jauhal',620,'24-may-1988');
insert into director values(163,'Melissa','DeRose',630,'14-jun-1982');
insert into director values(164,'Apash','Choctaw',640,'11-jan-1978');
insert into director values(165,'Thorsten','Gersten',650,'17-aug-1977');
insert into director values(166,'Avizheh','Namazi',660,'22-nov-1981');
insert into director values(167,'Ferdi','Nabi',670,'26-dec-1989');
insert into director values(168,'Ajaya','Shergill',680,'10-feb-1987');
insert into director values(169,'Vairocana','kaushal',690,'07-apr-1992');
insert into director values(170,'Josha','Sarkar',700,'03-jun-1975');
insert into director values(171,'Chandra','Raut',710,'15-sep-1999');
insert into director values(172,'Nitesh','Sachdeva',720,'22-oct-1973');
insert into director values(173,'Vinata','Mulge',730,'25-sep-1984');
insert into director values(174,'Satya','Kohli',740,'02-jun-1985');
insert into director values(175,'Sahir','Memon',750,'29-mar-1972');
insert into director values(176,'Nisha','Chetri',760,'09-may-1969');
insert into director values(177,'Vilas','Lodi',770,'13-dec-1962');
insert into director values(178,'Bhaga','Arya',780,'09-nov-1988');
insert into director values(179,'Neema','Mann',790,'19-oct-1971');
insert into director values(180,'Jivanta','Khalsa',800,'21-aug-1970');


insert into starring values(10,1001,'Robin Scherbat');
insert into starring values(20,1002,'Barney Stinson');
insert into starring values(30,1003,'Sheldon');
insert into starring values(40,1004,'Eleven');
insert into starring values(50,1005,'Ross');
insert into starring values(60,1006,'Mike');
insert into starring values(70,1007,'Chandler');
insert into starring values(80,1008,'Monica');
insert into starring values(90,1009,'Rachel');
insert into starring values(100,1010,'Joey');
insert into starring values(110,1011,'Phoebe');
insert into starring values(120,1012,'Sansa');
insert into starring values(130,1013,'Ygritte');
insert into starring values(140,1014,'Wendy Byrde');
insert into starring values(150,1015,'Jonah Byrde');
insert into starring values(160,1016,'Airline Stewardess');
insert into starring values(170,1017,'Neo');
insert into starring values(180,1018,'Persephone');
insert into starring values(190,1019,'Nicole Barber');
insert into starring values(200,1020,'Charlie Barber');
insert into starring values(210,1021,'Dr.Ryan stone');
insert into starring values(220,1022,'Hugh glass');
insert into starring values(230,1023,'Morpheus');
insert into starring values(240,1024,'Bryan mills');
insert into starring values(250,1025,'Sarah');
insert into starring values(260,1026,'Lee');
insert into starring values(270,1027,'Nikolai');
insert into starring values(280,1028,'Anton chigurh');
insert into starring values(290,1029,'John McClane');
insert into starring values(300,1030,'Jason Bourne');
insert into starring values(310,1031,'John Rambo');
insert into starring values(320,1032,'Sulley');
insert into starring values(330,1033,'Jesse James');
insert into starring values(340,1034,'King Leonidas');
insert into starring values(350,1035,'Edward');
insert into starring values(360,1036,'Airline Stewardess');
insert into starring values(370,1037,'Neo');
insert into starring values(380,1038,'Persephone');
insert into starring values(390,1039,'Nicole Barber');
insert into starring values(400,1040,'Charlie Barber');
insert into starring values(410,1041,'Theo');
insert into starring values(420,1042,'Queen Elizabeth');
insert into starring values(430,1043,'Ben Stone');
insert into starring values(440,1044,'Larry Gopnik');
insert into starring values(450,1045,'Kim Jong il');
insert into starring values(460,1046,'Richard Nixon');
insert into starring values(470,1047,'Wilson');
insert into starring values(480,1048,'Shaun');
insert into starring values(490,1049,'KYM');
insert into starring values(500,1050,'Penny Lane');
insert into starring values(510,1051,'Nick Naylor');
insert into starring values(520,1052,'sita');
insert into starring values(530,1053,'luke');
insert into starring values(540,1054,'ace ventura');
insert into starring values(550,1055,'beatrix');
insert into starring values(560,1056,'anakin');
insert into starring values(570,1057,'bane');
insert into starring values(580,1058,'marge');
insert into starring values(590,1059,'james');
insert into starring values(600,1060,'sarah');
insert into starring values(610,1061,'ellen');
insert into starring values(620,1062,'randle');
insert into starring values(630,1063,'inigo');
insert into starring values(640,1064,'hicks');
insert into starring values(650,1065,'groot');
insert into starring values(660,1066,'edna mode');
insert into starring values(670,1067,'randle');
insert into starring values(680,1068,'optimus prime');
insert into starring values(690,1069,'norman');
insert into starring values(700,1070,'beatrix');
insert into starring values(710,1071,'Jhon wick');
insert into starring values(720,1072,'dutch');
insert into starring values(730,1073,'frank lucas');
insert into starring values(740,1074,'tommy');
insert into starring values(750,1075,'james bond');
insert into starring values(760,1076,'marv');
insert into starring values(770,1077,'luke hobbs');
insert into starring values(780,1078,'alex honnold');
insert into starring values(790,1079,'ethan hunt');
insert into starring values(800,1080,'indiana jones');


insert into For_Tvshow values('01ab',10);
insert into For_Tvshow values('02cd',20);
insert into For_Tvshow values('03ef',30);
insert into For_Tvshow values('04gh',40);
insert into For_Tvshow values('05ij',50);
insert into For_Tvshow values('06er',60);
insert into For_Tvshow values('07ty',70);
insert into For_Tvshow values('08yu',80);
insert into For_Tvshow values('09xj',90);
insert into For_Tvshow values('10vu',100);
insert into For_Tvshow values('11fgjk',110);
insert into For_Tvshow values('12sdfg',120);
insert into For_Tvshow values('13iuy',130);
insert into For_Tvshow values('14sdhj',140);
insert into For_Tvshow values('15oiuf',150);
insert into For_Tvshow values('16xcv',160);
insert into For_Tvshow values('17bgfd',170);
insert into For_Tvshow values('18jhgf',180);
insert into For_Tvshow values('19hgfd',190);
insert into For_Tvshow values('20asdf',200);
insert into For_Tvshow values('21asd',210);
insert into For_Tvshow values('22kjfd',220);
insert into For_Tvshow values('23hgf',230);
insert into For_Tvshow values('24wert',240);
insert into For_Tvshow values('25asdf',250);
insert into For_Tvshow values('26dsfs',260);
insert into For_Tvshow values('27fghj',270);
insert into For_Tvshow values('28gkjh',280);
insert into For_Tvshow values('29lkjh',290);
insert into For_Tvshow values('30gkjh',300);
insert into For_Tvshow values('31oiuh',310);
insert into For_Tvshow values('32lkm',320);
insert into For_Tvshow values('33dsz',330);
insert into For_Tvshow values('34dcv',340);
insert into For_Tvshow values('35jnyh',350);
insert into For_Tvshow values('36grf',360);
insert into For_Tvshow values('37kmi',370);
insert into For_Tvshow values('38ztf',380);
insert into For_Tvshow values('39azs',390);
insert into For_Tvshow values('40iuy',400);
insert into For_Tvshow values('41tyu',410);
insert into For_Tvshow values('42iuy',420);
insert into For_Tvshow values('43iuy',430);
insert into For_Tvshow values('44iuy',440);
insert into For_Tvshow values('45iuw',450);
insert into For_Tvshow values('46iuy',460);
insert into For_Tvshow values('47iuy',470);
insert into For_Tvshow values('48iuy',480);
insert into For_Tvshow values('49iuy',490);
insert into For_Tvshow values('50iuy',500);
insert into For_Tvshow values('51iuy',510);
insert into For_Tvshow values('52uy',520);
insert into For_Tvshow values('53iu4',530);
insert into For_Tvshow values('54iuy',540);
insert into For_Tvshow values('55iuy',550);
insert into For_Tvshow values('56iuy',560);
insert into For_Tvshow values('57iuy',570);
insert into For_Tvshow values('58iuy',580);
insert into For_Tvshow values('59iuy',590);
insert into For_Tvshow values('60iuy',600);
insert into For_Tvshow values('61iuy',610);
insert into For_Tvshow values('62iuy',620);
insert into For_Tvshow values('63iuy',630);
insert into For_Tvshow values('64iuy',640);
insert into For_Tvshow values('65iuy',650);
insert into For_Tvshow values('66iuy',660);
insert into For_Tvshow values('67iuy',670);
insert into For_Tvshow values('68iuy',680);
insert into For_Tvshow values('69iuy',690);
insert into For_Tvshow values('70iuy',700);
insert into For_Tvshow values('71iuy',710);
insert into For_Tvshow values('72iuy',720);
insert into For_Tvshow values('73iuy',730);
insert into For_Tvshow values('74iuy',740);
insert into For_Tvshow values('75iuy',750);
insert into For_Tvshow values('76iuy',760);
insert into For_Tvshow values('77iuy',770);
insert into For_Tvshow values('78iuy',780);
insert into For_Tvshow values('79iuy',790);
insert into For_Tvshow values('80iuy',800);


insert into genre values(10,'Horror');
insert into genre values(20,'Thriller');
insert into genre values(30,'Rom-com');
insert into genre values(40,'Suspense');
insert into genre values(50,'Rom-com');
insert into genre values(60,'Horror');
insert into genre values(70,'Rom-com');
insert into genre values(80,'Horror');
insert into genre values(90,'Drama');
insert into genre values(100,'Drama');
insert into genre values(110,'Sci-fi');
insert into genre values(120,'Drama');
insert into genre values(130,'Thriller');
insert into genre values(140,'Horror');
insert into genre values(150,'Thriller');
insert into genre values(160,'Rom-com');
insert into genre values(170,'Suspense');
insert into genre values(180,'Rom-com');
insert into genre values(190,'Horror');
insert into genre values(200,'Rom-com');
insert into genre values(210,'Horror');
insert into genre values(220,'Drama');
insert into genre values(230,'Drama');
insert into genre values(240,'Sci-fi');
insert into genre values(250,'Drama');
insert into genre values(260,'Thriller');
insert into genre values(270,'Horror');
insert into genre values(280,'Thriller');
insert into genre values(290,'Rom-com');
insert into genre values(300,'Suspense');
insert into genre values(310,'Rom-com');
insert into genre values(320,'Horror');
insert into genre values(330,'Rom-com');
insert into genre values(340,'Horror');
insert into genre values(350,'Drama');
insert into genre values(360,'Drama');
insert into genre values(370,'Sci-fi');
insert into genre values(380,'Drama');
insert into genre values(390,'Thriller');
insert into genre values(400,'Horror');
insert into genre values(410,'Thriller');
insert into genre values(420,'Rom-com');
insert into genre values(430,'Suspense');
insert into genre values(440,'Rom-com');
insert into genre values(450,'Horror');
insert into genre values(460,'Rom-com');
insert into genre values(470,'Horror');
insert into genre values(480,'Drama');
insert into genre values(490,'Drama');
insert into genre values(500,'Sci-fi');
insert into genre values(510,'Sci-fi');
insert into genre values(520,'Thriller');
insert into genre values(530,'Suspence');
insert into genre values(540,'Comedy');
insert into genre values(550,'Sci-fi');
insert into genre values(560,'Action');
insert into genre values(570,'Drama');
insert into genre values(580,'Comic');
insert into genre values(590,'Horror');
insert into genre values(600,'Adventurous');
insert into genre values(610,'Suspence');
insert into genre values(620,'Action');
insert into genre values(630,'Sci-fi');
insert into genre values(640,'Rom-Com');
insert into genre values(650,'Adventurous');
insert into genre values(660,'Comedy');
insert into genre values(670,'Comedy');
insert into genre values(680,'Sci-fi');
insert into genre values(690,'Action');
insert into genre values(700,'Rom-Com');
insert into genre values(710,'Drama');
insert into genre values(720,'Adventurous');
insert into genre values(730,'Horror');
insert into genre values(740,'Suspence');
insert into genre values(750,'Sci-fi');
insert into genre values(760,'Thriller');
insert into genre values(770,'Rom-Com');
insert into genre values(780,'Action');
insert into genre values(790,'Comedy');
insert into genre values(800,'Adventurous');


select count(*) from Suser;
select count(*) from Uprofile;
select count(*) from Payment;
select count(*) from PaymentDetails;
select count(*) from Subscription;
select count(*) from Tvshow;
select count(*)  from Tcast;
select count(*) from Director;
select count(*) from Starring;
select count(*) from For_Tvshow;
select count(*) from Genre;


--QUERIES:

--Aggregate Queries:

--1. Retrieve the show_id, tile and rating of all the tv shows whose rating is greater than the average rating of all the tv shows.
select show_id,title,rating
from tvshow 
where rating>(select avg(rating) from tvshow);

--2. Retrieve the tfname,tlname of the cast and title of the the corresponding tv show where the length of the show is lesser than the average length of all the tv shows.
select tfname,tlname,title
from tcast,tvshow,starring
where show_id=showid and act_id=actor_id and tlength<(select avg(tlength) from tvshow);

--3.List all the users who have subscribed in the month of May.
select user_id,Fname,Mname,Lname
from Suser,Payment
where user_id=u_id and extract(month from pay_date)=5;

--4.Average amount earned by the company in the month of april.
select avg(amount_paid)
from payment
where extract(month from pay_date)=4;

--5.Write a sql query to list all the tvshows whose net subscribed amount is greater than the average subscribed amount.
select show_id,title,amount
from tvshow , subscription,for_tvshow
where subscription_id = subid and amount>(select avg(amount) from subscription);


--Basic Queries:

--1.Retrieve the subscription_id,amount where the type of Subscription is 'Premium'.
select subscription_id,amount
from subscription 
where  subscription_type='Premium';

--2.Retrieve fname,lname,email_id,address of the user and subscription_date,end_date of the subscription that the user has made.
select fname,lname,email_id,address,subscription_date,end_date
from subscription,payment,suser
where pay_code=payment_code and u_id=user_id;

--3.Retrieve the title,ttype of a tv show and their correspoding genres.
select title,ttype,genre
from genre,tvshow
where sho_id=show_id;

--4.Retrieve the title,dfname of the tvshow and dlname of the corresponding director.
select title,dfname,dlname
from director,tvshow
where show_id=sho_id_d;


--Logical Queries:

--1.Retrieve the payment details of all users who have paid from date 10th of May to 25th of July.
select * from Payment
where pay_date between '10-May-2020' and '25-Jul-2020';

--2.Retrieve the details of users whose age is greater than 25.
select * from Suser
where (sysdate-dob)/365>25;

--3.write a sql query to list all the actors who are also subscribers.
select fname,mname,user_id,lname,tfname,tlname,actor_id
from suser,tcast
where fname = tfname and lname = tlname;

--4.Retrieve the details of the cast starred in Friends Tv show.
select actor_id,tfname,tlname,crole
from tcast,tvshow,starring
where show_id=showid and actor_id=act_id and title='Friends';

--5.write a sql query to list all the directors who have directed tv series whose rating is greater than 4.5
select show_id , title , director_id , rating
from tvshow,director
where rating > 4.5 and sho_id_d  = show_id and ttype = 'Tv Series';


--View Queries:

--1.
Create view tv_show as
select title, dfname, dlname
from director,tvshow
where show_id=sho_id_d;

--2.
Create view S_user as
select fname,lname,email_id,address,subscription_date,end_date
from subscription,payment,suser
where pay_code=payment_code and u_id=user_id;

--3.
Create view s_tarring as
select actor_id,tfname,tlname,(sysdate-dob)/365 as age
from tcast,tvshow,starring
where show_id=showid and actor_id=act_id and title='Ozark';

--4.
Create view u_profile as
select user_id,fname,mname,lname,subscription_type,payment_code 
from suser,payment,subscription
where user_id = u_id and payment_code = pay_code  and  subscription_type = 'Standard';

--5.
Create view subs_cription as
select show_id,title,amount
from tvshow , subscription,for_tvshow
where subscription_id = subid and amount>(select avg(amount) from subscription);


--Having Clause Queries:

--1.Display the actors who are playing more than one cast.
select tfname,tlname, count(*)
from tcast
group by tfname,tlname
having count(*)>1;

--2.Display the subscribers whose subscription is more than one.
select subscription_id, count(*)
from subscription
group by subscription_id
having count(*)>1;

--3.Display the roles performed by actors whose count is greater than or equal to two.
select crole,count(*)
from starring
group by crole
having count(*)>=2;

--4.Display director's name who directed more than one tvshow.
select dfname,dlname,count(*)
from director
group by dfname,dlname
having count(*)>1;

--5.Display genre of tvshow whose count is greater than two.
select genre,count(*)
from genre
group by genre
having count(*)>2;


--Group by And Order by Queries:

--1.Retrieve the show_id,title,ttype,release_date ordered by their length in hour.
select show_id,title,ttype,tlength/60 as Length_in_hour
from tvshow 
order by Length_in_hour;

--2.List the Tv shows in ascending order with respect to their year of release.
select show_id,Title,ttype,extract(year from release_date) as Syear
from Tvshow
order by Syear asc;

--3.List the top five tv shows with respect to number of users watching it currently.
select show_id,title,cnt as Viewers
from(select count(subid) as cnt,show_id,title
from Tvshow,For_Tvshow
where show_id=shid
group by show_id,title
order by count(subid) desc)
where rownum<=5 ;

--4.List the second most watched Tv show.
select show_id,title,cnt as Viewers
from(select count(subid) as cnt,show_id,title,rank() over(order by count(subid) desc) as row_rank
from Tvshow,For_Tvshow
where show_id=shid
group by show_id,title)
where row_rank=2 ;

--5.List the third highest rated Tv show.
select show_id,title,rating
from(select show_id,title,rating,rank() over(order by rating desc) as row_rank
from Tvshow)
where row_rank=3;


--Aggregate functions, Group by, And Having clause:

--1.List the month having highest number of users subscribed.
Select extract(month from Subscription_date) as month,count(*) as No_of_users
from Subscription
group by extract(month from subscription_date)
having count(*)=(select max(counts)
from(select count(*) as counts
from subscription
group by extract(month from subscription_date)));

--2.For each genre retrieve the total number of users who have subscribed.
select count(distinct user_id) as no_of_users,genre
from Suser,Payment,Subscription,For_Tvshow,Tvshow,Genre
where user_id=u_id and payment_code=pay_code and subscription_id=subid and show_id=shid and show_id=sho_id
group by genre;

--3.Which genre is being watched most currently?
select genre,cnt as Viewers
from(select genre,count(subid) as cnt,rank() over(order by count(subid) desc) as row_rank
from Tvshow,Genre,For_Tvshow
where show_id=sho_id and show_id=shid
group by genre)
where row_rank=1;

--4.List the Tvshows in ascending order with respect to the number of subscriptions made for each so far.
select show_id,Title,count(subid)
from Tvshow,For_Tvshow
where show_id=shid
group by show_id,Title
order by count(subid) asc;

--5.List the Tvshows in descending order with resepect to the number of subscriptions made so far.
select show_id,Title,count(subid) as subscriptions
from Tvshow,For_Tvshow
where show_id=shid
group by show_id,Title
order by count(subid) desc;

--6.List the least watched show/shows details.
select count(subid),show_id,title
from Tvshow,For_Tvshow
where show_id=shid
group by show_id,title
having count(subid)=(select min(counts)
from (select count(subid) as counts
from Tvshow,For_Tvshow
where show_id=shid
group by show_id,title));


--Mutliple Row and Corellated operations:

--1.list the tv show whose rating is greater than the avg rating of all the shows of its own genre.
select show_id,title
from Tvshow,Genre e
where show_id=e.sho_id and rating>(select avg(rating)
from Tvshow,Genre g
where show_id= g.sho_id and e.genre=g.genre);

--2.Retrieve the subscription details of each user who has paid yesterday.
Select * from Subscription
where pay_code=(select payment_code
from payment where trunc(pay_date)=trunc(sysdate-1));

--3.Retrieve each user details and number of users who belong to his country.
select user_id,u1.user_name,fname,mname,lname,country,(select
count(*) from Uprofile u2
where u1.country=u2.country) as no_of_users
from Uprofile u1,Suser
where user_id=u_user_id;

--4.Write a sql query to list all the users who have subscribed to an standard subscription.
SELECT user_id,fname,mname,lname,subscription_type,payment_code 
from suser,payment,subscription
where user_id = u_id and payment_code = pay_code  and  subscription_type = 'Standard';

--5.Write a sql query to list the no of  subscription for each gerne.
create view genre_stat AS
select genre ,show_id,subid
from genre
left join tvshow
on sho_id=show_id
left join for_tvshow
on show_id=shid;
select genre,count(subid)
from genre_stat
group by genre;


--Set Theory and Logical Operators And Equi Join Operations:

--1.List the show/show details which have 0 viewers.
select * from Tvshow
where show_id not in(select shid
from For_Tvshow);

--2.List the most watched show/shows details.
select show_id,title,cnt as Viewers
from(select count(subid) as cnt,show_id,title,rank() over(order by count(subid) desc) as row_rank
from Tvshow,For_Tvshow
where show_id=shid
group by show_id,title)
where row_rank=1;

--3.Retrieve the details of the latest released Tv show.
select show_id,title,ttype,release_date
from Tvshow
where release_date=(select max(release_date)
from Tvshow);

--4.Retrieve the details of the oldest released Tv show.
select show_id,title,ttype,release_date
from Tvshow
where release_date=(select min(release_date)
from Tvshow);

--5.Write a sql query to list all the tvshows whose net subscribed amount is greater than the average subscribed amount.
select show_id,title,amount
from tvshow , subscription
where subscription_id = sub_id and amount>( select avg(amount) from subscription);

--6.Retrieve the details of all the youngest actors appeared in each Tvshow streaming now.
select t.title,actor_id,tfname,tlname,(sysdate-dob)/365
from tcast,tvshow t,starring
where t.show_id=showid and actor_id=act_id and 
(sysdate-dob)/365=(select min (sysdate-dob)/365
from tcast,tvshow s,starring
where s.show_id=showid and actor_id=act_id and t.show_id=s.show_id)
group by title,actor_id,tfname,tlname,(sysdate-dob)/365;

--7.Retrieve the details of all the most senior actors appeared in each Tvshow streaming now.
select t.title,actor_id,tfname,tlname,(sysdate-dob)/365 as age
from tcast,tvshow t,starring
where t.show_id=showid and actor_id=act_id and 
(sysdate-dob)/365=(select max((sysdate-dob)/365)
from tcast,tvshow s,starring
where s.show_id=showid and actor_id=act_id and t.show_id=s.show_id)
group by title,actor_id,tfname,tlname,(sysdate-dob)/365;


commit;


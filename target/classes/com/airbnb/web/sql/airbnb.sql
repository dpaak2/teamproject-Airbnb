CREATE TABLE 
member
(
   member_id varchar(30) not null PRIMARY KEY,
   member_password varchar(10) not null,
   name varchar(10),
   regdate datetime,
   birthdate varchar (20),
   member_role varchar(6)
);


insert into member (
 member_id,
 member_password ,
 name,
 regdate,
 birthdate,
 member_role
 )values(
 'admin',
 '1',
 'admin',
 now(),
 '1993-01-01',
 'admin');

 insert into member (
 member_id,
 member_password ,
 name,
 regdate,
 birthdate,
 member_role
 )values(
 'hong',
 '1',
 '홍길동',
 now(),
 '1993-01-02',
 null);
 
 
CREATE TABLE 
guest
(
  member_id varchar(30) not null,
  primary key (member_id)
);

CREATE TABLE 
host
(
  member_id varchar(30) not null,
  primary key (member_id)
);

CREATE TABLE 
reservation
(
   rsv_seq varchar(12) not null,
   checkin datetime not null,
   checkout datetime not null,
   regdate datetime not null,
   adult int(2),
   teen int(2),
   child int(2),
   solddays int(2) null,
   host_serial varchar(10) not null,
   member_id varchar(30) not null,
   res_price int(11),
   primary key (rsv_seq)
);




CREATE TABLE 
residence
(   
   host_serial varchar(10)primary key not null ,
   member_id varchar(30)not null,
   residence_name varchar(50) not null,
   price int(7) not null,
   zipcode int(10) not null,
   addr varchar(100),
   limit_no varchar(2),
   detail_img varchar(150),
   info_img varchar(200),
   resi_content varchar(3000)

);


CREATE TABLE 
resiopt
(
   host_serial varchar(10) primary key,
   wifi varchar(1),
   bed_num varchar(2),
   pet varchar(1),
   essential_item varchar(1),
   parking varchar(1),
   bathroom_num varchar(2),
   tv varchar(2),
   washing_mac varchar(2),
   air_condi varchar(2),
   kitchen varchar(2)
);


CREATE TABLE 
admin
(
  member_id varchar(30) not null,
  primary key (member_id)
);

CREATE TABLE 
board
(
  board_seq varchar(12),
  board_title varchar(1000),
  board_content varchar(5000),
  board_regdate date,
  member_id varchar(30),
  primary key (board_seq)
);

CREATE TABLE 
boardcate
(
   cate_seq char(5),
   board_seq varchar(12),
   cate_name varchar(30),
   cate_level char(4),
   primary key (cate_seq)
);

CREATE TABLE 
reviewboard
(
   board_seq varchar(12) primary key,
   review_star int(1),
   host_serial varchar(10) 
);

CREATE TABLE 
accumulate
(
  date varchar(10) primary key,
  sale int(11),
  gender  varchar(1)
);

create view vboard as (
  select b.board_seq, b.board_title, b.board_content, b.board_regdate, b.member_id
       , c.cate_seq, c.cate_name, c.cate_level
  from board b
  inner join boardcate c
  on b.board_seq = c.board_seq
  WHERE b.board_seq like 'bo%'
  ORDER BY b.board_regdate DESC
);

/*dummy value*/
/*residence*/
insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'leejung@gmail.com'
  ,'1'
  ,'이정우'
  ,now()
  ,'1990-03-15'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no) 
values('leejung@gmail.com','홍대 복층 펜트하우스 (가든뷰)','58623','04210','kosu111192','https://a0.muscache.com/im/pictures/58b10245-061d-4927-91b7-f9e72d84abb7.jpg?aki_policy=xx_large','홍대 복층 펜트하우스 (가든뷰) 홍대, 합정, 명동, 신촌, 이대, 동대문, 여의도 * 주차 1대 가능합니다 :)','서울특별시 마포구 마포대로10길 22','https://a0.muscache.com/im/pictures/d27e8f25-11a5-4e27-b0ca-5d7d55693591.jpg?aki_policy=x_large','4');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111192'
  ,'Y'
  ,'3'
  ,'N'
  ,'Y' 
  ,'Y'
  ,'2'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'pjk@gmail.com'
  ,'1'
  ,'박정관'
  ,now()
  ,'1972-04-11'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('pjk@gmail.com','*OPEN SALE*30s from HongikUniv station(WiFi EGG)#2','55241','04143','kosu111199','https://a0.muscache.com/im/pictures/bd962e8e-c05a-4de5-95b3-7068da52217d.jpg?aki_policy=xx_large','1) 30sec from station to house 2) Good night view 3) The Nearest to Hongdae 4) The Nearest to Gyeongui Line Forest Park 5) Making a delivery of Korean food instead of you 6) Perfectly security and safe neighborhood 7) Lots of the fancy restaurants and cafes nearby - * 3 Queen size beds * FREE WIFI * WIFI EGG(Pocket WIFI) - (If you pay very little, you can use it while traveling) * Cook possible (include utensil) * Hair dryers * Towels','서울특별시 마포구 마포대로 137','https://a0.muscache.com/im/pictures/bfe7e8cc-f278-4e95-97c1-07f2c83b0d17.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111199'
  ,'Y'
  ,'3'
  ,'N'
  ,'Y'
  ,'Y'
  ,'3'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'parji@gmail.com'
  ,'1'
  ,'박지운'
  ,now()
  ,'1986-07-18'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('parji@gmail.com','★OPEN SALE★ Hongik Univ stn 3min. COZY HOUSE #2-2','39458','04207','kosu111114','https://a0.muscache.com/im/pictures/d928b040-924a-4ee7-b9e9-e44c61de2828.jpg?aki_policy=xx_large','★THE BEST TRIP LOCATION IN SEOUL。 ★MODERN, CLEAN, COZY, CALM AND NEW APT。 ★1MIN FROM CONVENIENCE STORE。 ★3MIN FROM HONGIK UNIV. STN / YEONTRAL PARK。 ★5MIN FROM HONGIK UNIV MAINSTREET。 ★FREE WIFI。','서울특별시 마포구 마포대로 186-5','https://a0.muscache.com/im/pictures/1357dcc0-e4a2-4c40-b682-f439f06df56f.jpg?aki_policy=x_large','9');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111114'
  ,'Y'
  ,'3'
  ,'N'
  ,'Y'
  ,'Y'
  ,'3'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'parjin@gmail.com'
  ,'1'
  ,'박진형'
  ,now()
  ,'1986-08-08'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('parjin@gmail.com','Serene Stay @Private 1 @Queen Bed','22547','04213','kosu111115','https://a0.muscache.com/im/pictures/67cfc7b8-9204-47b0-a401-eda08e517253.jpg?aki_policy=xx_large','Gday mate, my name is Kuan. I opened Serene Stay to provide a place where guests can stay and be well rested while they re traveling. In 2014, I went on a working holiday in Melbourne, Australia, and the name Serene Stay was suggested by my best Aussie mate. Just like the vibe I felt in Australia, the atmosphere of Serene Stay is cosy and laid back. I welcome you to unwind at Serene Stay while making great memories in South Korea.','서울특별시 마포구 마포대로 108-1','https://a0.muscache.com/im/pictures/faf76ec7-0e44-4f98-9ecf-69c0b358600d.jpg?aki_policy=x_large','9');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111115'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'minchong@gmail.com'
  ,'1'
  ,'민충근'
  ,now()
  ,'1986-11-30'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('minchong@gmail.com','★New Open SALE★ BHAUS at Hongdae stn. AREX 3min!','52986','04143','kosu111116','https://a0.muscache.com/im/pictures/a58b3f02-8052-487f-aa86-5bfd1cc9b391.jpg?aki_policy=xx_large','★ Open Sale! All new! (Real Designers house in Korea) ★ Hongdae AREX stn. 3 min (airport subway line 6 Gate) ★ 24hours Convenience store 1min. by walk ★ Do not smoke and party (If it happened, guest must payed guarantees) ★ Very quite and safe main streets in HongDae area ★ Special park walk by 1 min. Gyeong-ui-seon book street park. ★ 24hours security guard ★ Maximum 4 people accommodate ★ Room wifi for free','서울특별시 마포구 마포대로 143','https://a0.muscache.com/im/pictures/ad372a41-03d6-4b59-b96a-e3c7cb0c1b82.jpg?aki_policy=x_large','7');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111116'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'kimsam@gmail.com'
  ,'1'
  ,'김삼순'
  ,now()
  ,'1989-10-25'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('kimsam@gmail.com','A★Helloworld House★역에서 단 3분거리!싱글침대@다인실@클럽7분!','11274','04211','kosu111117','https://a0.muscache.com/im/pictures/0487e029-50d3-477a-bc32-63933d5bae95.jpg?aki_policy=xx_large','헬로월드!ㅎㅎ 홍대입구역 2번출구에서 3분거리에 가까이 위치한 집이지만 9번 출구와는 다르게 차분하고 조용한 곳에서 쉬실 수 있는 집입니다. 종로 창덕궁 근처에서 100일 동안 게스트하우스 스텝으로 일한 경험이 사람들에 대한 그리움으로 이어져 시작한 집입니다. 20대 남자인 제가 함께 사는하는 집이다 보니 호텔처럼 화장실을 깨끗하게 관리하지 못 할때도 있고, 문고리가 고장나서 고치느라 낑낑대는 때도 있습니다. 그래도 맨날 열심히 쓸고 닦고 문지르고 기름칠도 하고.. 그냥 그렇게 제가 여행자들과 함께 살고 있는 집입니다. 외국인들이 많이 찾아오는 집. 아주 조그만 게스트하우스. 오셔서 다같이 친구해요.','서울특별시 마포구 마포대로10길 9','https://a0.muscache.com/im/pictures/6c1fb51a-7c80-473e-a418-1d4ce06dacaa.jpg?aki_policy=x_large','10');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111117'
  ,'Y'
  ,'4'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'kimdu@gmail.com'
  ,'1'
  ,'김두현'
  ,now()
  ,'1986-07-26'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('kimdu@gmail.com','OPEN BIG SALE#1min*HONGDAE*COZY*single room','34948','04211','kosu111118','https://a0.muscache.com/im/pictures/611e75d7-f4e8-4bc5-bf90-1c67e911aefa.jpg?aki_policy=xx_large','Are you looking for an interesting place? If you are, our place is perfect for you and is full of energy and fun. Our place is very unique, comfortable and easy to access subway stations to Hongdae within only 1min by walking.','서울특별시 마포구 마포대로10길 16','https://a0.muscache.com/im/pictures/8717d741-f771-4637-a1a7-6dd10af828ba.jpg?aki_policy=x_large','8');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111118'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'sunzhong@gmail.com'
  ,'1'
  ,'선종찬'
  ,now()
  ,'1986-07-26'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('sunzhong@gmail.com','NEW OPEN! #HANRIVERVIEW# 5mins to Hongik Station','78916','04210','kosu111194','https://a0.muscache.com/im/pictures/86d85e5a-f2b0-40ad-af01-14794fd8b1ab.jpg?aki_policy=xx_large','Located just seconds away from Hapjeong Station and 2 mins to Hongdae Station! There is a Home plus also connected to Hapjeong station and plenty of shopping, restaurants, pubs, bars, clubs, cafes. It is conveniently situated on 2 major subway lines, and very close to airport rail. You’ll love my place because of comfy bed and relaxing atmosphere after long day of sightseeing. Our building is brand new with a spectacular view of Han River.','서울특별시 마포구 마포대로10길 22','https://a0.muscache.com/im/pictures/f1a8c06e-4a72-4ab8-bfe1-933ab739bf5e.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111194'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'yangtae@gmail.com'
  ,'1'
  ,'양태진'
  ,now()
  ,'1986-10-08'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no) 
values('yangtae@gmail.com','Open BiGgggg Sale! Clean house:)','33821','04211','kosu111101','https://a0.muscache.com/im/pictures/d988d7ea-4530-40e1-af8a-f4c9f71ec285.jpg?aki_policy=xx_large','*** New open on BIG sale! *** - whole house, Use the bath room, the kitchen only you. - Very quite and safe main streets in HongDae area - 24hours check-in - AREX (airport subway line) and Airport bus no.6002 bus stop - Connected to subway station exit 3. - Fully equipped comfortable apartment - Maximum 2 people accommodate - Room Free wifi - Lots of restaurant and cafe near by house','서울특별시 마포구 마포대로10길 15','https://a0.muscache.com/im/pictures/972082b3-9762-4c1d-957b-1ca4e8f32e35.jpg?aki_policy=x_large','7');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111101'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'sonsu@gmail.com'
  ,'1'
  ,'손수범'
  ,now()
  ,'1986-04-30'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('sonsu@gmail.com','A modern,clean and safe, lovely woman house','36076','04143','kosu111102','https://a0.muscache.com/im/pictures/e67acea5-a186-4e20-8775-f00b77454ce8.jpg?aki_policy=xx_large','My place is cozy,clean and safe woman house Location is easy to get to center of Seoul short walk to Mang-won station so that you can visit Hanglk university and Hapjeon station Close to popular tourist attractions such as Gyeondbokgung,ltaewon,insadong.4min from Han-River 10min Seoul would cup stadium. 10minutes Hongdae by bus Namsan Tower Myeong-dong by bus ,subway 30minutes','서울특별시 마포구 마포대로 137','https://a0.muscache.com/im/pictures/1372e741-afe9-44b3-8555-d86714c51e45.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111102'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'noyoung@gmail.com'
  ,'1'
  ,'노용현'
  ,now()
  ,'1986-07-18'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('noyoung@gmail.com','Hong Dae Stn./ Sunnys Cozy Studio B, New open!','59750','04213','kosu111103','https://a0.muscache.com/im/pictures/6a2b8e47-37ce-4f57-9cc7-8e29ae557eca.jpg?aki_policy=xx_large','♡BEST Location, 1min from Hongik Univ. Station Exit 3/ 마포구 홍대입구역 3번출구 연결/New Open☆最好的位置','서울특별시 마포구 마포대로 108-1','https://a0.muscache.com/im/pictures/0efb9103-99f3-4ca8-81fd-49c73d9efe9e.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111103'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'kimjin@gmail.com'
  ,'1'
  ,'김진호'
  ,now()
  ,'1986-09-21'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('kimjin@gmail.com','Sho’s cozy & modern house','60878','04213','kosu111104','https://a0.muscache.com/im/pictures/05f5f75c-d2de-4876-8581-c4f59882b9cb.jpg?aki_policy=xx_large','My house is very cozy and warm atmosphere place. And it is located in middle of Yeonnam dong very closed to Hongdae subway station(takes 10min. by walk) and famous restaurant, 24hrs CVS, coffee shope etc. Nice to meet you at here and Thank you for interesting my place.','서울특별시 마포구 마포대로 114','https://a0.muscache.com/im/pictures/9dc119ff-2936-4b2b-ba5f-89fd9202bc02.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111104'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host14@gmail.com'
  ,'1'
  ,'정인수'
  ,now()
  ,'1986-09-01'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host14@gmail.com','VESTEL#2 Keep luggage@Hongik Univ Stn 30 sec','39458','04207','kosu111105','https://a0.muscache.com/im/pictures/af2f40e9-b88a-4dde-a2ca-6f1f533c9888.jpg?aki_policy=xx_large','We promise to provide the cleanest room and comfort house like your home stay. With hottest location in Seoul city, Wherever you want to go in Seoul, you will reach in 40 minutes by Subway where is just 5m from guest house. Free wifi egg is provided','서울특별시 마포구 마포대로 174','https://a0.muscache.com/im/pictures/3dfb3491-ed04-4e46-82d4-59a2b8a5ee8c.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111105'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host15@gmail.com'
  ,'1'
  ,'김성진'
  ,now()
  ,'1986-04-26'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host15@gmail.com','[SC201] Viators Modern Hongdae! Super Happy!','52986','04144','kosu111106','https://a0.muscache.com/im/pictures/3102919e-1f70-443a-ab09-9f90bc922ce7.jpg?aki_policy=xx_large','It takes only 5 minutes from subway station(홍대입구역exit#8) by walk. Room interior is very modern and Cozy. every furniture is new IKEA brand. there is wooden table as well. it is located in fashion street of hongdae. Stay at my place and make your trip happy! you can go to most of attractions such as itaewon, myongdong, dongdaemoon..etc in 25minutes by subway!','서울특별시 마포구 마포대로 119','https://a0.muscache.com/im/pictures/6d6e3cad-d342-4dff-8c92-a40165b2aed1.jpg?aki_policy=x_large','10');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111106'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host16@gmail.com'
  ,'1'
  ,'이문수'
  ,now()
  ,'1987-07-26'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no) 
values('host16@gmail.com','(A1) ladies only mayfly guest house - 2ppls room','14656','04143','kosu111107','https://a0.muscache.com/im/pictures/82229fba-a1fa-4fa0-8604-0cb3b7183a6f.jpg?aki_policy=x_large','Mayfly guest House is for ** ladies only ** and located in center of Hongdae. You will be sharing with another girl if someone else book too. If you want to use this space alone please book below as well. https://www.airbnb.co.kr/rooms/14310594 Easy access to Incheon(AREX 45min) and Gimpo (AREX 15min) airport. Close to popular tourists attractions such as Dongdaemoon(25min), Myeongdong(25min), Gangnam(40min), Itaewon(15min), Insadong(25min), etc.','서울특별시 마포구 마포대로 155','https://a0.muscache.com/im/pictures/cb02b85e-a64a-452b-bf90-396b1607ae9c.jpg?aki_policy=x_large','8');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111107'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host18@gmail.com'
  ,'1'
  ,'오경환'
  ,now()
  ,'1986-01-05'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host18@gmail.com','30Sec HongDae STN / Open D/C #3','24802','04207','kosu111109','https://a0.muscache.com/im/pictures/2b884696-02de-4e02-b2b5-5c6671e9b749.jpg?aki_policy=xx_large','Location, Price, Clean and completely solely cozy room get ready in Wonjins house. ? 50 minutes from ICN airport by Arex without transfer. ? 30Secs away from HongDae station on foot. ? Easily get to everywhere HongDae & Shinchon. ? Fantastic accessibility, also very peaceful atmosphere ? Lovely hospitality','서울특별시 마포구 마포대로 188','https://a0.muscache.com/im/pictures/20f93b29-7a97-4b10-9b1e-d1651d69c8a5.jpg?aki_policy=x_large','7');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111109'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y' 
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host19@gmail.com'
  ,'1'
  ,'김윤석'
  ,now()
  ,'1986-07-26'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host19@gmail.com','★OPEN SALE★ Hongik Univ stn 3min. COZY HOUSE #1-2','39458','04207','kosu111121','https://a0.muscache.com/im/pictures/ec3bdf4f-52e3-4a0f-9350-e96b9e2b2ef3.jpg?aki_policy=xx_large','★THE BEST TRIP LOCATION IN SEOUL ★MODERN, CLEAN, COZY, CALM AND NEW APT ★1MIN FROM CONVENIENCE STORE ★3MIN FROM HONGIK UNIV. STN YEONTRAL PARK ★5MIN FROM HONGIK UNIV MAINSTREET ★FREE WIFI','서울특별시 마포구 마포대로 190','https://a0.muscache.com/im/pictures/9d78baa5-0f55-426c-9e5a-2f1c2bc2e299.jpg?aki_policy=x_large','4');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111121'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host21@gmail.com'
  ,'1'
  ,'김인범'
  ,now()
  ,'1977-05-30'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host21@gmail.com','NEW open sale Black House!','57496','04142','kosu111122','https://a0.muscache.com/im/pictures/2fe670a8-bf98-4b38-8af6-ed32c82224cb.jpg?aki_policy=x_large','- 숙소는 홍대 3번출구에서 5분에서 10분 가량 걸려요! - 숙소 전체를 여유롭게 사용하실수 있고요~ - 에어콘과 온수 그리고 난방이 언제든지 작동하려고 준비하고 있어요^^ - 넉넉하게 많은 수건과 샴푸, 바디워셔가 준비되어 있구요~ - 간단하게 요리해먹을수 있는 도구들과 주방이 있습니다!! - 편의점까지 걸어서 5분! 저는 2분이면 가지요 ㅎㅎ 홍대거리에 위치하고 있어 쇼핑, 클럽, 술집들이 근처에 많아, 여행후 밤에 여독을 풀고 쉬시다, 들어와서 쉬시기 좋아요~ 문은 도어락으로 열리고 예약하시면 바로 알수 있습니다.','서울특별시 마포구 마포대로11길 17','https://a0.muscache.com/im/pictures/90715859-46a1-4832-b411-66d66c1cd332.jpg?aki_policy=x_large','10');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111122'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host20@gmail.com'
  ,'1'
  ,'박형식'
  ,now()
  ,'1994-05-11'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host20@gmail.com','Green bunk bed room of hong dae exit3 only 3 min','28184','04207','kosu111120','https://a0.muscache.com/im/pictures/1a1dfaec-c1fa-4149-92bd-773a48424bc5.jpg?aki_policy=x_large','There is one bunk bed so can use until 2 person that place is a little small but enough for 2 lugguges as you can see the pictures I set up the added lights and the huge mirror And about the location you will be satisfied because there is only 3 min far away from exit3 hong dae station thanks','서울특별시 마포구 마포대로 180-7','https://a0.muscache.com/im/pictures/bccb6a01-fe3f-4644-87c4-2dd6886c26e7.jpg?aki_policy=xx_large','4');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111120'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host22@gmail.com'
  ,'1'
  ,'박현진'
  ,now()
  ,'1977-03-28'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no) 
values('host22@gmail.com','30Sec HongDae STN / Open D/C #1','30439','04142','kosu111123','https://a0.muscache.com/im/pictures/7100f9cb-4570-4196-982d-c926958b636a.jpg?aki_policy=xx_large','Welcome to my YOLO Dormitory! I hope you have an amazing time and make unique memories while staying in my accommodation! I hope to see you soon in Seoul!','서울특별시 마포구 마포대로11길 25-7','https://a0.muscache.com/im/pictures/9d3c3cc7-5811-4034-abf4-d720210c188f.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111123'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host23@gmail.com'
  ,'1'
  ,'변용주'
  ,now()
  ,'1977-03-28'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host23@gmail.com','E★DREMAER★도미토리#픽업가능#화장실2개#여성전용#퀸사이즈침대#오픈세일','12401','04142','kosu111124','https://a0.muscache.com/im/pictures/802d144e-858e-45d5-bc83-bdf69d26b491.jpg?aki_policy=xx_large','저희집은 홍대역 2 번 출구에서 도보 7 분 거리에 있어요! 9번출구와 달리, 조용하고 차분한 분위기의 집이구요 :) 저는 서울역에서 480km를 걸어서 해남 땅끝마을까지를 여행이라는 무모한 도전을 할 수있을 정도로 여행하는 것을 좋아해요! 그리고 저는 여행하면서 새로운친구를 사귀는것도 굉장히 좋아해요! 그래서 그런 계기로 게스트하우스를 시작하게 된거구요! 그리고 가끔은 관리를 못할때도 있어요.. 숙소 물건이 망가져서 낑낑대면서 고칠때도있고.. 그래도 최대한 노력하고 여행자들과 함께 제가 생활하고 있는 집이에요! 언제든지 놀러오시면 편하고 재밌게 친구하고 재밌는 얘기 나눌수있어요!! 언제든지 놀러오세요 :)','서울특별시 마포구 마포대로11길 43','https://a0.muscache.com/im/pictures/56f2ee87-b153-4ef6-92f6-8e26e431a617.jpg?aki_policy=x_large','8');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111124'
  ,'Y'
  ,'4'
  ,'N'
  ,'Y'
  ,'Y'
  ,'2'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host24@gmail.com'
  ,'1'
  ,'조연주'
  ,now()
  ,'1977-03-14'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host24@gmail.com','#5 Ellys HOUSE #Dormitory room #only female room','11274','04141','kosu111125','https://a0.muscache.com/im/pictures/d7865d6f-12f8-4677-8194-718b7e600d64.jpg?aki_policy=xx_large','지하철 OK! 버스도 OK! 대중교통 이용이 수월해 어디로든 이동이 편리합니다.주택가에 위치해 늦은 시간에도 안심하세요! 편의점은 물론 맛집과 카페가 곳곳에 있답니다. 홍대 클럽거리, 연남동, 합정, 상수까지! 서울의 핫플레이스를 즐겨보세요~ 여성전용 개인룸, 도미토리룸','서울특별시 마포구 마포대로11길 75','https://a0.muscache.com/im/pictures/c306160b-a558-4342-b03d-0cc7c5c88b52.jpg?aki_policy=x_large','9');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111125'
  ,'Y'
  ,'3'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host25@gmail.com'
  ,'1'
  ,'노지혜'
  ,now()
  ,'1987-01-21'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host25@gmail.com','Great Location: 3 min Hongdae Junes Galaxy Room','32694','04141','kosu111126','https://a0.muscache.com/im/pictures/72583cc3-6c4a-4641-b339-12c717e5cb23.jpg?aki_policy=xx_large','Junes House #R2 [Galaxy Double Rm, 3 Min Hongdae Station] Have a delightful stay at Junes House! Very unique, comfortable place and easy access from Incheon Intl Airport by direct airport railroad, only 3 minutes walk from Hongik Univ. subway station. You can unpack your luggage and start your journey right away. This district is known as hot place, you can browse fancy restaurants and cafes. Bed type : Double bed This room can accommodate up to 2 people.','서울특별시 마포구 마포대로11길 73','https://a0.muscache.com/im/pictures/2c0498a6-b12e-4455-b652-7bafa9fed4e3.jpg?aki_policy=x_large','10');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111126'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host26@gmail.com'
  ,'1'
  ,'정은혜'
  ,now()
  ,'1978-06-07'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host26@gmail.com','[violet]SEOUL vintage Hongdae&Mangwon&Hanriver','24802','04142','kosu111127','https://a0.muscache.com/im/pictures/98b8c353-0936-4718-b7ce-3a9617986340.jpg?aki_policy=x_large','Korean vintage house *** 각종 촬영 문의는 메시지 부탁 드립니다 :) shooting inquiries are welcomed(films, snaps, shopping mall and so on)','서울특별시 마포구 마포대로11길 7-8','https://a0.muscache.com/im/pictures/f64398fc-496d-4644-8831-ad6d6ad7d9ae.jpg?aki_policy=x_large','8');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111127'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host27@gmail.com'
  ,'1'
  ,'이세진'
  ,now()
  ,'1988-02-20'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host27@gmail.com','#4A# Jacobs apartment (2번출구에서 7분)','34948','04142','kosu111128','https://a0.muscache.com/im/pictures/52a682c4-4445-4f35-aa26-94032b67980b.jpg?aki_policy=xx_large','홍대에는 카페, 쇼핑할 곳, 레스토랑 및 클럽이 많아 한국인은 물론 외국인에게도 유명한 곳입니다. 저희 숙소는 홍대의 가장 중심지에 위치하였지만 조용하여 여행객들에게 적합한 곳입니다','서울특별시 마포구 마포대로11길 25-2','https://a0.muscache.com/im/pictures/e654d674-b003-4dda-9a5d-ab0bc824d562.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111128'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host28@gmail.com'
  ,'1'
  ,'진유라'
  ,now()
  ,'1987-12-11'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host28@gmail.com','#3★Dorm for Female★ April OPEN SALE!!','13528','04142','kosu111129','https://a0.muscache.com/im/pictures/6dd273a5-c916-48e7-8f16-b332e45dc75a.jpg?aki_policy=xx_large','Hello Im a newbie but Devoted host of ★Real Questhouse★, Hun! my girlfriend Shin is also co-hosting this house We want to help traveler more comfortable and feel funny in SEOUL So you can see the things what we provide in description','서울특별시 마포구 마포대로11길 21','https://a0.muscache.com/im/pictures/88830c03-63cf-4652-8cdc-4406e6ed444f.jpg?aki_policy=x_large','4');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111129'
  ,'Y'
  ,'4'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host29@gmail.com'
  ,'1'
  ,'김소미'
  ,now()
  ,'1987-12-12'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host29@gmail.com','Hongdae Epicenter M1! Best Location! Top Floor!!!','20293','04142','kosu111130','https://a0.muscache.com/im/pictures/f0226352-9a11-4d3e-bce5-aae96a6722c1.jpg?aki_policy=xx_large','Enjoy a great view of Namsan Tower and Hongik University from the top floor of one of the most popular buildings for AirBnB in Korea! Our building is RIGHT ABOVE Hongdae Station for easy access to the Subway, Bus and the Airport Train! Our room has all amenities: 32" Samsung TV, Wifi and portable Pocket Wifi. Our linens are all machine dried so your sheets are always disinfected and your towels will be soft. NEED 2 ROOMS? Hongdae Epicenter M2 is the room next door. BOOK NOW!','서울특별시 마포구 마포대로11길 15-5','https://a0.muscache.com/im/pictures/b67388d9-90e5-47a8-8d70-48086608caa7.jpg?aki_policy=x_large','6');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111130'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y' 
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host30@gmail.com'
  ,'1'
  ,'정미선'
  ,now()
  ,'1992-04-01'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no) 
values('host30@gmail.com','dorm3 ladies only mayfly guest house','11274','04232','kosu111131','https://a0.muscache.com/im/pictures/ed0c808c-3fe5-46c2-968a-3e5b314f8982.jpg?aki_policy=xx_large','Mayfly guest House is for ladies only and located in center of Hongdae. Easy access to Incheon(AREX 45min) and Gimpo (AREX 15min) airport. Close to popular tourists attractions such as Dongdaemoon(25min), Myeongdong(25min), Gangnam(40min), Itaewon(15min), Insadong(25min), etc.','서울특별시 마포구 마포대로11길 44-9','https://a0.muscache.com/im/pictures/e2d7e10f-8855-436d-b0c0-161e9984b410.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111131'
  ,'Y'
  ,'6'
  ,'N'
  ,'Y'
  ,'Y'
  ,'2'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host31@gmail.com'
  ,'1'
  ,'김보연'
  ,now()
  ,'1989-03-31'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host31@gmail.com','[Open Hongdae/홍대] 1 min by walk from hongik stn#B1','50732','04211','kosu111132','https://a0.muscache.com/im/pictures/92a8d7fc-9dc6-417d-ae4b-13aa9f09228d.jpg?aki_policy=xx_large','무료 예약 취소 예약 후 48시간 이내에 취소하면 전액이 환불됩니다. 이 호스트는 엄격 환불 정책을 시행합니다 체크인 30일 전까지 예약을 취소하면 전액 환불받을 수 있습니다. 30일이 남지 않은 시점에서 취소하면 1박 요금의 50%와 수수료 전액을 환불받을 수 있습니다.','서울특별시 마포구 마포대로10길 12','https://a0.muscache.com/im/pictures/5e610db8-a29a-4706-9ecb-8e8e3d4b4621.jpg?aki_policy=x_large','4');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111132'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host32@gmail.com'
  ,'1'
  ,'윤혜영'
  ,now()
  ,'1990-09-02'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host32@gmail.com','[NEW] Seoul,Mangwon/modern and clean, lovely house','24802','04211','kosu111133','https://a0.muscache.com/im/pictures/aeced7e9-4b6f-492a-8e6e-af3252fbd968.jpg?aki_policy=x_large','WELCOME! We are located in near Hapjeong and Hongik University street area, one of Seouls interesting and totally fun neighborhoods! Various cafes, nice restaurants and local markets are all just 10-20 minutes distance by walk. At our place youre going to get a Korean local style experience, not a hotel or typical tourist experience. Hope you to enjoy your trip at our place.','서울특별시 마포구 마포대로10길 11','https://a0.muscache.com/im/pictures/1f81700f-4e0b-446f-8b06-dce342851719.jpg?aki_policy=x_large','4');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111133'
  ,'Y'
  ,'1'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host33@gmail.com'
  ,'1'
  ,'한연수'
  ,now()
  ,'1982-11-28'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host33@gmail.com','★Helloworld House5R★역에서1분! 퀸침대','24802','04211','kosu111134','https://a0.muscache.com/im/pictures/ee361bea-5b32-4f14-a96b-0b28623acab3.jpg?aki_policy=xx_large','5번출구에서 단1분거리(나와서 우회전,1분직진후끝)인 이 곳은, 외관은 오래 된 주택이지만 집안은 제가 하나부터 열까지 모두 손수 고친 겉과속이 다른 반전매력을 가진 집입니다. 조명을 좋아하는 저의 빛의 향연에 초대합니다.','서울특별시 마포구 마포대로10길 8','https://a0.muscache.com/im/pictures/583a27d8-fa6f-403f-9ae1-fe4cab7bff33.jpg?aki_policy=x_large','7');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111134'
  ,'Y'
  ,'3'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host34@gmail.com'
  ,'1'
  ,'김성환'
  ,now()
  ,'1972-03-28'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no) 
values('host34@gmail.com','Deep Seoul guest house (Roof Top Suit Room)','30439','04211','kosu111135','https://a0.muscache.com/im/pictures/80011f6a-50c5-420f-8951-5f8c94840d3f.jpg?aki_policy=xx_large','Best Location - 50mins from ICN airport by subway - 1min from Hongik univ station exit 3 on foot - Nearby beautiful park for pinic - Nearby many stylish restaurants and cafes','서울특별시 마포구 마포대로10길 13','https://a0.muscache.com/im/pictures/508e9726-64c1-4cd2-bbdc-4f1873b76da0.jpg?aki_policy=x_large','5');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111135'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host35@gmail.com'
  ,'1'
  ,'최종용'
  ,now()
  ,'1967-03-28'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host35@gmail.com','#2 yeonnam dong 6- domitory (roof top)','14656','04210','kosu111136','https://a0.muscache.com/im/pictures/1f2c22fd-9c7d-4116-bb1c-73bf073f361c.jpg?aki_policy=xx_large','저희집은 가장 모던하고 깔끔한 집이며 옥상을 단독으로 사용 할수있으며 호스트와 함께 옥상파티를 할수있는곳 입니다!','서울특별시 마포구 마포대로10길 20','https://a0.muscache.com/im/pictures/e199cc69-f219-40d3-a01a-47ca83a49969.jpg?aki_policy=x_large','9');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111136'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host36@gmail.com'
  ,'1'
  ,'김상민'
  ,now()
  ,'1957-04-06'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no) values('host36@gmail.com','Best location! Hongdae area! Free egg and 1min stn','50732','04207','kosu111137','https://a0.muscache.com/im/pictures/7d2853b4-6040-4149-9e1c-e926dfa8d373.jpg?aki_policy=x_large','체크인 24시간 전까지 취소하면 전액이 환불됩니다. 체크인까지 24시간이 남지 않은 시점에 취소하면 첫 1박 요금은 환불되지 않습니다.','서울특별시 마포구 마포대로14가길 6','https://a0.muscache.com/im/pictures/855d3450-97ab-4123-813e-19a7cc1aac33.jpg?aki_policy=x_large','8');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111137'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host37@gmail.com'
  ,'1'
  ,'윤여규'
  ,now()
  ,'1965-08-28'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host37@gmail.com','홍대 중심에 위치한 감각적인 복층 스튜디오 #3','40585','04207','kosu111138','https://a0.muscache.com/im/pictures/c68d685e-6b13-4e69-82cc-94bccf15ad3d.jpg?aki_policy=x_large','심플하고 편안한 인테리어의 복층 스튜디오 입니다. 한국에서 가장 흥미로운 지역 중 하나인 홍대의 중심에 위치해 있습니다. 지하철과 가깝고 스튜디오 근처에 감각적인 식당, 카페, 상점 등이 아주 많습니다.','서울특별시 마포구 마포대로14가길 14-8','https://a0.muscache.com/im/pictures/c733c66b-d5a5-4006-b42a-773421656206.jpg?aki_policy=x_large','7');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111138'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host38@gmail.com'
  ,'1'
  ,'최재훈'
  ,now()
  ,'1972-01-09'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host38@gmail.com','YOLO Dorm Connect Hongdae Station (Female Only) #6','14656','04207','kosu111139','https://a0.muscache.com/im/pictures/d20ca4d0-640d-4d86-97ab-93ac2ff4db9a.jpg?aki_policy=xx_large','Welcome to my YOLO Dormitory! I hope you have an amazing time and make unique memories while staying in my accommodation! I hope to see you soon in Seoul!','서울특별시 마포구 마포대로14가길 14-16','https://a0.muscache.com/im/pictures/2843d61a-fd1b-4954-a61e-3146377b49c6.jpg?aki_policy=x_large','6');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111139'
  ,'Y'
  ,'4'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);

insert into member (
   member_id
  ,member_password
  ,name
  ,regdate
  ,birthdate
) VALUES (
   'host39@gmail.com'
  ,'1'
  ,'현상태'
  ,now()
  ,'1985-07-15'
);

insert into residence (
member_id,
residence_name,
price,
zipcode,
host_serial,
detail_img,
resi_content,
addr,
info_img,
limit_no
) values('host39@gmail.com',
'홍대, 연남동, 성산동 게스트하우스Hongdae, Yeonamdong guesthouse',
'83425','04207','kosu111140',
'https://a0.muscache.com/im/pictures/c7377b75-29be-4b01-a565-9e4d2742f7d0.jpg?aki_policy=xx_large',
'Welcome! We are Wink & Link house in Korea. We are located in Mapo-gu, Seoul which is nearby Hongik University and central park of Korea. You can relax in our house that is a very comfortable and cozy and cool. In our house, we bet you will get unforgettable memory during your trip in Korea. Join us and enjoy your life with us!','서울특별시 마포구 마포대로 186-9',
'https://a0.muscache.com/im/pictures/9365addb-609c-4060-9f44-41830148c98e.jpg?aki_policy=x_large','8');

insert into resiopt (
   host_serial
  ,wifi
  ,bed_num
  ,pet
  ,essential_item
  ,parking
  ,bathroom_num
  ,tv
  ,washing_mac
  ,Air_condi
  ,kitchen
) VALUES (
   'kosu111140'
  ,'Y'
  ,'2'
  ,'N'
  ,'Y'
  ,'Y'
  ,'1'
  ,'Y'
  ,'Y'
  ,'Y'
  ,'Y'
);



/*accumulate*/
insert into accumulate (`date`, sale ,gender) VALUES ('2015-01-01', 3000 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-02-01', 5200 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-03-01', 7050 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-04-01', 10700 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-05-01', 12500 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-06-01', 15200 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-07-01', 13070 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-08-01', 13500 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-09-01', 14100 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-10-01', 15700 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-11-01', 9000 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2015-12-01', 8200 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-01-01', 4700 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-02-01', 6200 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-03-01', 8950 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-04-01', 11700 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-05-01', 13800 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-06-01', 17900 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-07-01', 15070 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-08-01', 15500 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-09-01', 18100 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-10-01', 14700 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-11-01', 8600 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2016-12-01', 7200 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2017-01-01', 8800 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2017-02-01', 7900 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2017-03-01', 9050 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2017-04-01', 12010 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2017-05-01', 14050 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2017-06-01', 14800 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2017-07-01', 15500 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2017-08-01', 16600 ,'');
insert into accumulate (`date`, sale ,gender) VALUES ('2017-09-01', 18050 ,'');


/*member*/
/*2016*/
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest1@gmail.com', '1', 'gest1', date_add(now(), interval -1 year), '1992-06-02', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest6@gmail.com', '1', 'gest6', date_add(now(), interval -1 year), '1993-07-21', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest7@gmail.com', '1', 'gest7', date_add(now(), interval -1 year), '1994-08-11', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest8@gmail.com', '1', 'gest8', date_add(now(), interval -1 year), '1995-09-30', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest9@gmail.com', '1', 'gest9', date_add(now(), interval -1 year), '1996-10-20', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest10@gmail.com', '1', 'gest10', date_add(now(), interval -1 year), '1981-01-14', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest11@gmail.com', '1', 'gest11', date_add(now(), interval -1 year), '1982-02-15', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest12@gmail.com', '1', 'gest12', date_add(now(), interval -1 year), '1983-03-23', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest13@gmail.com', '1', 'gest13', date_add(now(), interval -1 year), '1984-04-24', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest14@gmail.com', '1', 'gest14', date_add(now(), interval -1 year), '1985-05-25', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest15@gmail.com', '1', 'gest15', date_add(now(), interval -1 year), '1986-06-26', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest16@gmail.com', '1', 'gest16', date_add(now(), interval -1 year), '1987-07-27', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest17@gmail.com', '1', 'gest17', date_add(now(), interval -1 year), '1988-08-28', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest18@gmail.com', '1', 'gest18', date_add(now(), interval -1 year), '1991-09-29', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest19@gmail.com', '1', 'gest19', date_add(now(), interval -1 year), '1991-10-11', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest20@gmail.com', '1', 'gest20', date_add(now(), interval -1 year), '1991-11-21', null);


/*2015*/
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest2@gmail.com', '1', 'gest2', date_add(now(), interval -2 year), '1995-08-11', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest21@gmail.com', '1', 'gest21', date_add(now(), interval -2 year), '1996-07-21', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_roe) 
VALUES ('gest22@gmail.com', '1', 'gest22', date_add(now(), interval -2 year), '1997-06-15', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest23@gmail.com', '1', 'gest23', date_add(now(), interval -2 year), '1991-05-16', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest24@gmail.com', '1', 'gest24', date_add(now(), interval -2 year), '1992-04-17', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest25@gmail.com', '1', 'gest25', date_add(now(), interval -2 year), '1993-03-11', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest26@gmail.com', '1', 'gest26', date_add(now(), interval -2 year), '1994-02-21', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest27@gmail.com', '1', 'gest27', date_add(now(), interval -2 year), '1995-01-31', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest28@gmail.com', '1', 'gest28', date_add(now(), interval -2 year), '1986-09-11', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest29@gmail.com', '1', 'gest29', date_add(now(), interval -2 year), '1989-10-01', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest30@gmail.com', '1', 'gest30', date_add(now(), interval -2 year), '1985-11-05', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest31gmail.com', '1', 'gest31', date_add(now(), interval -2 year), '1987-12-17', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest32@gmail.com', '1', 'gest32', date_add(now(), interval -2 year), '1988-08-13', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest33@gmail.com', '1', 'gest33', date_add(now(), interval -2 year), '1985-08-24', null);


/*2014*/
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest3@gmail.com', '1', 'gest3', date_add(now(), interval -3 year), '1987-06-21', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest34@gmail.com', '1', 'gest34', date_add(now(), interval -3 year), '1977-05-24', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest35@gmail.com', '1', 'gest35', date_add(now(), interval -3 year), '1987-07-26', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest36@gmail.com', '1', 'gest36', date_add(now(), interval -3 year), '1967-08-22', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest37@gmail.com', '1', 'gest37', date_add(now(), interval -3 year), '1988-11-30', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest38@gmail.com', '1', 'gest38', date_add(now(), interval -3 year), '1989-12-21', null);

/*2013*/
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest4@gmail.com', '1', 'gest4', date_add(now(), interval -4 year), '1982-05-30', null);
insert into member(member_id, member_password, name, regdate, birthdate, member_role) 
VALUES ('gest5@gmail.com', '1', 'gest5', date_add(now(), interval -4 year), '1972-10-03', null);


/*board cate*/
insert into boardcate (cate_seq, board_seq, cate_name, cate_level)
value(10001, 0, '예약', '1001');
insert into boardcate (cate_seq, board_seq, cate_name, cate_level)
value(10002, 0, '여행', '1002');
insert into boardcate (cate_seq, board_seq, cate_name, cate_level)
value(10003, 0, '숙박', '1003');


/*board*/
insert into board(board_seq, board_content,board_regdate,member_id) values('rw451112006','A wonderful location, away from everything. We enjoyed the outdoor shower and fire. A great outdoorsy experience!',sysdate(),'d213233@naver.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw997781555','A cozy, private, intimate nook that took our breath away each day. Rain or shine, my partner and I enjoyed this place so much. ',sysdate(),'d454551233@naver.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw245871554','Magical little hut surrounded by trees, it was the perfect getaway even for one night. We didnt see the charcoal or the fire starters as they were in a basket pushed far under the bed so we had to start a fire the old',sysdate(),'b332cd@naver.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw245455210','So many amazing things to say about our stay! It was perfect for a few days away to escape the hustle and bustle of work',sysdate(),'cdef@naver.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw666125512','We would be back in a heart beat and would not hesitate to recommend this hidden gem to anyone else!',sysdate(),'cho@nate.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw547124166','Wifi per instructions didnt work, but we utilized the repeater and it worked great! Only downside was the toilet, but again, that was something I didt pay attention to in the original posting. Even so, we had an amazing experience!',sysdate(),'cho@nate.com');




/*REVIEW board*/

insert into board(board_seq, board_content,board_regdate,member_id) values('rw451112006','A wonderful location, away from everything. We enjoyed the outdoor shower and fire. A great outdoorsy experience!',sysdate(),'d213233@naver.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw997781555','A cozy, private, intimate nook that took our breath away each day. Rain or shine, my partner and I enjoyed this place so much. ',sysdate(),'d454551233@naver.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw245871554','Magical little hut surrounded by trees, it was the perfect getaway even for one night. We didnt see the charcoal or the fire starters as they were in a basket pushed far under the bed so we had to start a fire the old',sysdate(),'b332cd@naver.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw245455210','So many amazing things to say about our stay! It was perfect for a few days away to escape the hustle and bustle of work',sysdate(),'cdef@naver.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw666125512','We would be back in a heart beat and would not hesitate to recommend this hidden gem to anyone else!',sysdate(),'cho@nate.com');
insert into board(board_seq, board_content,board_regdate,member_id) values('rw547124166','Wifi per instructions didnt work, but we utilized the repeater and it worked great! Only downside was the toilet, but again, that was something I didt pay attention to in the original posting. Even so, we had an amazing experience!',sysdate(),'cho@nate.com');

 


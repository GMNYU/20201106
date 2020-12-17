/* 로그인  DB */

create table tbl_account(
userid varchar(20) not null,
userpw varchar(20) not null,
username varchar(20) not null,
regdate date default sysdate
);

create table tbl_authorities(
	username varchar2(50) not null,
	authority varchar2(50) not null,
	constraint fk_tbl_authorities_users foreign key(username) references users(username));
	
create unique index ix_auth_username on authorities (username, authority);

insert into users (username, password) values ('user00', 'pw00');
insert into users (username, password) values ('member00', 'pw00');
insert into users (username, password) values ('admin00', 'pw00');

insert into authorities(username, authority) values ('user00', 'ROLE_USER');
insert into authorities(username, authority) values ('member00', 'ROLE_MANAGER');
insert into authorities(username, authority) values ('admin00', 'ROLE_MANAGER');
insert into authorities(username, authority) values ('admin00', 'ROLE_ADMIN');
commit;


select*from tbl_account;
select*from tbl_authorities;

/*  인증/권한   */
create table tbl_member(
	userid varchar2(50) not null primary key,
	userpw varchar2(100) not null,
	username varchar2(100) not null,
	regdate date default sysdate,
	updatedate date default sysdate,
	enabled char(1) default '1');
	
create table tbl_member_auth (
	userid varchar2(50) not null,
	auth varchar2(50) not null,
	constraint fk_member_auth foreign key(userid) 
		references tbl_member(userid)
	);
	
select * from tbl_member;
select * from tbl_member_auth;

select 
	

/* 게시판 DB */
create sequence seq_notice;  --게시글의 순번을 자동으로 등록하기위해 시퀀스 생성 및 설정

create table tbl_notice(
nno number not null, -- 데이터를 추가 할 때 INSERT INTO EX_TABLE(tbl_notice) VALUES(seq_notice.NEXTVAL); 
					  -- 이렇게 하면 순차적으로 숫자가 등록된다.
title varchar(200) not null,
content varchar(2000)not null,
writer varchar(50) not null,
regdate date default sysdate,  --현재시간을 자동 등록
updatedate date default sysdate
);
/* 이벤트 DB */
create sequence seq_event;  --게시글의 순번을 자동으로 등록하기위해 시퀀스 생성 및 설정

create table tbl_event(
eno number not null,-- 데이터를 추가 할 때 INSERT INTO EX_TABLE(tbl_notice) VALUES(seq_event.NEXTVAL); 
imgaddress char(100) not null,
title char(50) not null,
progress char(1), --database는 boolean이 없어서 char1로 지정
startdate date default sysdate, --이벤트 시작 일자
enddate date                    --이벤트 종료 일자
);

/* 메뉴  */
create table tbl_menu(
menuName varchar(20) not null,  --메뉴 이름
mainCategory varchar(20) not null,  --대분류 ( 예 : 음료, 푸드..)
subCategory varchar(20) not null,  --소분류( 예 : 콜드 브루 커피, 에스프레소...)
menuTbn char(100) --메뉴 이미지(경로)
);

select * from tbl_menu;

drop table tbl_menu;


create table coffee_member(
	userid varchar2(50) not null primary key,
	userpw varchar2(100) not null,
	username varchar2(100) not null,
	regdate date default sysdate,
	updatedate date default sysdate,
	enabled char(1) default '1');
	
create table coffee_member_auth (
	userid varchar2(50) not null,
	auth varchar2(50) not null,
	constraint mk_member_auth foreign key(userid) 
		references coffee_member(userid)
	);

select * from coffee_member;
select * from coffee_member_auth;


create table tbl_menu(
mno number not null primary key,
menuName varchar(20) not null,  --메뉴 이름
mainCategory varchar(20) not null,  --대분류 ( 예 : 음료, 푸드..)
subCategory varchar(20) not null,  --소분류( 예 : 콜드 브루 커피, 에스프레소...)
menuTbn char(100) --메뉴 이미지(경로)
);

create sequence seq_menu;

insert into tbl_menu values (seq_menu.NEXTVAL,'나이트로 바닐라 크림', 'bevrage','coldbrew','/resources/img/beverage/cold1');

select * from tbl_menu;


drop table tbl_menu;
drop sequence seq_menu;

create table tbl_menu(
mno number not null primary key,
menuName varchar2(35) not null,  --메뉴 이름
mainCategory varchar2(20) not null,  --대분류 ( 예 : 음료, 푸드..)
subCategory varchar2(20) not null,  --소분류( 예 : 콜드 브루 커피, 에스프레소...)
menuTbn varchar2(100) --메뉴 이미지(경로)
);
create sequence seq_menu;

select * from tbl_menu;

insert into tbl_menu values (seq_menu.NEXTVAL,'나이트로 바닐라 크림', 'beverage','coldbrew','/resources/img/beverage/cold1');
insert into tbl_menu values (seq_menu.NEXTVAL,'나이트로 쇼콜라 클라우드', 'beverage','coldbrew','/resources/img/beverage/cold2');
insert into tbl_menu values (seq_menu.NEXTVAL,'나이트로 콜드 브루', 'beverage','coldbrew','/resources/img/beverage/cold3');
insert into tbl_menu values (seq_menu.NEXTVAL,'돌체 코드 브루', 'beverage','coldbrew','/resources/img/beverage/cold4');
insert into tbl_menu values (seq_menu.NEXTVAL,'바닐라 크림 콜드 브루', 'beverage','coldbrew','/resources/img/beverage/cold5');
insert into tbl_menu values (seq_menu.NEXTVAL,'제주 비자림 콜드 브루', 'beverage','coldbrew','/resources/img/beverage/cold6');
insert into tbl_menu values (seq_menu.NEXTVAL,'콜드 브루', 'beverage','coldbrew','/resources/img/beverage/cold7');
insert into tbl_menu values (seq_menu.NEXTVAL,'콜드 브루 몰트', 'beverage','coldbrew','/resources/img/beverage/cold8');
insert into tbl_menu values (seq_menu.NEXTVAL,'에스프레소', 'beverage','espresso','/resources/img/beverage/es1');
insert into tbl_menu values (seq_menu.NEXTVAL,'에스프레소 마끼아또', 'beverage','espresso','/resources/img/beverage/es2');
insert into tbl_menu values (seq_menu.NEXTVAL,'카페 모카', 'beverage','espresso','/resources/img/beverage/es3');
insert into tbl_menu values (seq_menu.NEXTVAL,'아이스 카페 모카', 'beverage','espresso','/resources/img/beverage/es4');
insert into tbl_menu values (seq_menu.NEXTVAL,'카푸치노', 'beverage','espresso','/resources/img/beverage/es5');
insert into tbl_menu values (seq_menu.NEXTVAL,'아이스 카푸치노', 'beverage','espresso','/resources/img/beverage/es6');
insert into tbl_menu values (seq_menu.NEXTVAL,'카라멜 마끼아또', 'beverage','espresso','/resources/img/beverage/es7');
insert into tbl_menu values (seq_menu.NEXTVAL,'아이스 카라멜 마끼아또', 'beverage','espresso','/resources/img/beverage/es8');
insert into tbl_menu values (seq_menu.NEXTVAL,'바닐라 플랫 화이트', 'beverage','espresso','/resources/img/beverage/es9');
insert into tbl_menu values (seq_menu.NEXTVAL,'블론드 서머 라떼', 'beverage','espresso','/resources/img/beverage/es10');
insert into tbl_menu values (seq_menu.NEXTVAL,'딸기 요거트 블렌디드', 'beverage','blended','/resources/img/beverage/bld1');
insert into tbl_menu values (seq_menu.NEXTVAL,'망고 바나나 블렌디드', 'beverage','blended','/resources/img/beverage/bld2');
insert into tbl_menu values (seq_menu.NEXTVAL,'피치 & 레몬 블렌디드', 'beverage','blended','/resources/img/beverage/bld3');
insert into tbl_menu values (seq_menu.NEXTVAL,'자몽 셔벗 블렌디드', 'beverage','blended','/resources/img/beverage/bld4');
insert into tbl_menu values (seq_menu.NEXTVAL,'스위티 자몽 & 라임 블렌디드', 'beverage','blended','/resources/img/beverage/bld5');
insert into tbl_menu values (seq_menu.NEXTVAL,'스위트 멜론 블렌디드', 'beverage','blended','/resources/img/beverage/bld6');
insert into tbl_menu values (seq_menu.NEXTVAL,'익스트림 티 블렌디드', 'beverage','blended','/resources/img/beverage/bld7');
insert into tbl_menu values (seq_menu.NEXTVAL,'망고 패션 후르츠 블렌디드', 'beverage','blended','/resources/img/beverage/bld8');
insert into tbl_menu values (seq_menu.NEXTVAL,'제주 한라봉 티 블렌디드', 'beverage','blended','/resources/img/beverage/bld9');
insert into tbl_menu values (seq_menu.NEXTVAL,'매직 팝 스플래쉬 소다', 'beverage','soda','/resources/img/beverage/soda1');
insert into tbl_menu values (seq_menu.NEXTVAL,'블랙 티 레모네이드 소다', 'beverage','soda','/resources/img/beverage/soda2');
insert into tbl_menu values (seq_menu.NEXTVAL,'쿨 라임 소다', 'beverage','soda','/resources/img/beverage/soda3');
insert into tbl_menu values (seq_menu.NEXTVAL,'패션 탱고 티 레모네이드 소다', 'beverage','soda','/resources/img/beverage/soda4');
insert into tbl_menu values (seq_menu.NEXTVAL,'핑크 자몽 소다', 'beverage','soda','/resources/img/beverage/soda5');
insert into tbl_menu values (seq_menu.NEXTVAL,'제주 유기 녹차', 'beverage','tea','/resources/img/beverage/tea1');
insert into tbl_menu values (seq_menu.NEXTVAL,'차이 티', 'beverage','tea','/resources/img/beverage/tea2');
insert into tbl_menu values (seq_menu.NEXTVAL,'케모마일 블렌드 티', 'beverage','tea','/resources/img/beverage/tea3');
insert into tbl_menu values (seq_menu.NEXTVAL,'얼 그레이 티', 'beverage','tea','/resources/img/beverage/tea4');
insert into tbl_menu values (seq_menu.NEXTVAL,'아이스 얼 그레이 티', 'beverage','tea','/resources/img/beverage/tea5');
insert into tbl_menu values (seq_menu.NEXTVAL,'잉글리쉬 블랙퍼스트 티', 'beverage','tea','/resources/img/beverage/tea6');
insert into tbl_menu values (seq_menu.NEXTVAL,'아이스 잉글리쉬 블랙퍼스트 티', 'beverage','tea','/resources/img/beverage/tea7');
insert into tbl_menu values (seq_menu.NEXTVAL,'라임 패션 티', 'beverage','tea','/resources/img/beverage/tea8');
insert into tbl_menu values (seq_menu.NEXTVAL,'아이스 라임 패션 티', 'beverage','tea','/resources/img/beverage/tea9');
insert into tbl_menu values (seq_menu.NEXTVAL,'피치 젤리 핫 티', 'beverage','tea','/resources/img/beverage/tea10');
insert into tbl_menu values (seq_menu.NEXTVAL,'피치 젤리 아이스 티', 'beverage','tea','/resources/img/beverage/tea11');
insert into tbl_menu values (seq_menu.NEXTVAL,'우유', 'beverage','etc','/resources/img/beverage/etc1');
insert into tbl_menu values (seq_menu.NEXTVAL,'스팀 우유', 'beverage','etc','/resources/img/beverage/etc2');
insert into tbl_menu values (seq_menu.NEXTVAL,'시그니처 핫 초콜릿', 'beverage','etc','/resources/img/beverage/etc3');
insert into tbl_menu values (seq_menu.NEXTVAL,'아이스 오렌지 플로터', 'beverage','etc','/resources/img/beverage/etc4');
insert into tbl_menu values (seq_menu.NEXTVAL,'아이스 라임 플로터', 'beverage','etc','/resources/img/beverage/etc5');
insert into tbl_menu values (seq_menu.NEXTVAL,'제주 청보리 라떼', 'beverage','etc','/resources/img/beverage/etc6');

commit	

alter table sigungu add(sigungu_name varchar2(100) not null);
alter table ground add(status number default 0);
alter table insider add(status number default 0);

/******* 추가**********/
alter table ground drop column introduction;
alter table ground add(introduction clob default ' ' not null)
update ground set introduction='안녕하세요 모임 테스트중입니다. 인싸그라운드 대박입니다. 피날레 화이팅' where ground_no=1;
--회원테이블
drop table INSSA_MEMBER;
create table INSSA_MEMBER(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   name varchar2(100) not null,
   email varchar2(100) not null,
   status number default 1,
);
--회원권한 테이블
alter table inssa_member 
drop table MEMBER_AUTHORITY;
create table MEMBER_AUTHORITY(
   id varchar2(100),
   role varchar2(100),
   constraint fk_member_authority_id foreign key(id) references inssa_member(id),
   constraint pk_inssa_member primary key(id,role)
);
--이메일 인증 테이블
drop table EMAIL_KEY;
create table EMAIL_KEY(
   id varchar2(100) primary key,
   email_key varchar2(100),
   reg_date date default sysdate,
   constraint fk_emailKey_id foreign key(id) references INSSA_MEMBER(id)
);

--프로필 사진 테이블
drop table PROFILE_IMG;
create table PROFILE_IMG(
   id varchar2(100)   primary key,
   path varchar2(100),
   constraint fk_profile_id foreign key(id) references INSSA_MEMBER(id)
);



 
-- 취미
drop table hobby;
drop sequence hobby_seq;
create sequence hobby_seq nocache;
create table hobby(
   hobby_no number primary key,
   name varchar2(100) not null,
   hobby_category_no number,
   constraint fk_hobby_category_no foreign key(hobby_category_no) references hobby_category(hobby_category_no)
)
-- 취미 카테고리
drop table hobby_category;
create sequence hobby_category_seq nocache;
create table hobby_category(
   hobby_category_no number primary key,
   category varchar2(100) not null
)
-- 취미 특징
drop table hobby_feature;
create table hobby_feature(
   feature_no number,
   hobby_no   number,
   constraint fk_hobby_feature_no foreign key(feature_no) references feature,
   constraint fk_hobby_no foreign key(hobby_no) references hobby,
   constraint pk_hobby_feature primary key(feature_no,hobby_no)
)
-- 특징
drop table feature;
create sequence feature_seq nocache;
create table feature(
   feature_no number primary key,
   name varchar2(100) not null
) 
--
drop table ground;
create sequence ground_seq nocache;
-- 모임
create table ground(
   ground_no number primary key,
   max_personnel number default 0,
   introduction clob not null,
   ground_name varchar2(100) not null,
   master varchar2(100),
   hobby_no number,
   sigungu_no number,
   constraint fk_ground_sigungu_no foreign key(sigungu_no) references(sigungu_no),
   constraint fk_ground_id foreign key(master)  references inssa_member(id),
   constraint fk_ground_hobby_no foreign key(hobby_no) references hobby(hobby_no)
)
insert into INSSA_MEMBER values('thwjddnl','1234','소정','수내',1);
insert into MEMBER_AUTHORITY values('thwjddnl','ROLE_MEMBER');
insert into ground values(ground_seq.nextval,20,'첫 모임 개설 테스트중!!!ㅎㅎ 피날레 화이팅!','장소정 걔 모임?','thwjddnl',56,56,1)
select * from ground;
-- 일정
drop table schedule;
create sequence schedule_seq nocache;
create table schedule(
   schedule_no number primary key,
   start_date date default sysdate,
   end_date date default sysdate,
   title varchar2(100) not null,
   loc varchar2(100) not null,
   content clob not null,
   id varchar2(100),
   ground_no number,
   constraint fk_schedule_id foreign key(id,ground_no) references insider(id,ground_no)   
)
--회원 모임
drop table insider;
create table insider(
   id varchar2(100),
   ground_no number,
   attendance number default 0,
   constraint fk_insider_id foreign key(id) references inssa_member,
   constraint fk_insider_ground_no foreign key(ground_no) references ground,
   constraint pk_insider primary key(id,ground_no)
)

-- 게시판
drop table ground_post;
create sequence ground_post_seq nocache;
create table ground_post(
   post_no number primary key,
   time_posted date default sysdate,
   hits number default 0,
   content clob not null,
   title varchar2(100) not null,
   id varchar2(100),
   ground_no number,
   constraint fk_ground_post_id foreign key(id,ground_no) references insider(id,ground_no)
)
-- 게시판 사진
drop table post_img;
create sequence post_img_seq nocache;
create table post_img(
   img_no number primary key,
   img_name varchar2(100) not null,
   post_no number,
   constraint fk_post_img_post_no foreign key(post_no) references ground_post(post_no)
)
-- 불량모임 신고
drop table badground_report;
create sequence badground_report_seq nocache;
create table badground_report(
   report_no number primary key,
   content clob not null,
   title varchar2(100) not null,
   time_posted date default sysdate,
   id varchar2(100),
   ground_no number,
   constraint fk_badground_report_id foreign key(id) references inssa_member(id),
   constraint fk_badground_report_ground_no foreign key(ground_no) references ground(ground_no)
)
--해시태그
drop table hashtag;
create table hashtag(
   content varchar2(100) primary key
)
--모임해시태그
drop table ground_hashtag;
create table ground_hashtag(
   content varchar2(100),
   ground_no number,
   constraint fk_ground_hashtag_content foreign key(content) references hashtag(content),
   constraint fk_ground_hashtag_ground_no foreign key(ground_no) references ground(ground_no)
)
-- 일정 참여 회원
drop table participant;
create table participant(
   id varchar2(100),
   schedule_no number,
   ground_no number,
   constraint fk_participant_id foreign key(id) references inssa_member(id),
    constraint fk_participant_schedule_no foreign key(schedule_no) references schedule(schedule_no),
    constraint fk_participant_ground_no foreign key(ground_no) references ground(ground_no),
    constraint pk_participant primary key(schedule_no,ground_no)
)






 
--게임
-- 게임 카테고리 테이블
drop sequence GAME_CATEGORY_SEQ;
create sequence GAME_CATEGORY_SEQ nocache;

drop table GAME_CATEGORY;
create table GAME_CATEGORY(
   cg_no number primary key,
   name varchar2(100) not null
);

--게임 프로그램 테이블
drop sequence GAME_PROGRAM_seq;
create sequence GAME_PROGRAM_seq nocache;

drop table GAME_PROGRAM;
create table GAME_PROGRAM(
   program_no number primary key,
   title varchar2(100) not null,
   detail varchar2(50) not null
);

--공식게임 테이블
drop sequence OFFICIAL_GAME_seq;
create sequence OFFICIAL_GAME_seq nocache;

drop table OFFICIAL_GAME;
create table OFFICIAL_GAME(
   o_game_no number primary key,
   title varchar2(50) not null,
   min_personnel number default 0,
   max_parsonnel number default 1000,
   game_time number not null,
   materials varchar2(100) not null,
   content clob not null,
   cg_no number,
   constraint fk_GAME_CATEGORY_OFFICIAL foreign key(cg_no) references GAME_CATEGORY(cg_no)
);

--사용자게임 테이블
drop sequence CUSTOM_GAME_Seq;
create sequence CUSTOM_GAME_Seq nocache;

drop table CUSTOM_GAME;
create table CUSTOM_GAME(
   c_game_no varchar2(100) primary key,
   title varchar2(50) not null,
   min_personnel number default 0,
   max_personnel number default 1000,
   game_time number not null,
   materials varchar2(100) not null,
   content clob not null,
   recommendation number default 0,
   id varchar2(100) not null,
   cg_no number not null,
   constraint fk_INSSA_MEMBER_CUSTOM foreign key(id) references INSSA_MEMBER(id),
   constraint fk_GAME_CATEGORY_CUSTOM foreign key(cg_no) references GAME_CATEGORY(cg_no)
);

--프로그램 공식게임 관계테이블
drop table PROGRAM_OFFICIAL_GAME;
create table PROGRAM_OFFICIAL_GAME(
   program_no number,
   o_game_no number,
   game_order number,
   total_game number,
   constraint fk_GAME_PROGRAM1 foreign key(program_no) references GAME_PROGRAM,
   constraint fk_OFFICIAL_GAME1 foreign key(o_game_no) references OFFICIAL_GAME,
   constraint pk_PROGRAM_OFFICIAL_GAME1 primary key(program_no, o_game_no)
);

--프로그램 사용자게임 관계테이블
create table PROGRAM_CUSTOM_GAME()
create sequence sido_seq;
create table sido(
   sido_no number primary key,
   sido varchar2(100) not null
)
create table sigungu(
   sigungu_no number primary key,
   sido_no number,
   constraint fk_sigungu foreign key(sido_no) references(sido_no)
)



select * from inssa_member;



drop table INSSA_MEMBER; --20----------------------
drop table MEMBER_AUTHORITY;  --21---------------------
drop table EMAIL_KEY;   --1
drop table PROFILE_IMG; --2----------------------
drop table hobby; --19 ----------------------------
drop table hobby_category; --22 ---------------------
drop table hobby_feature; --3-----------------------
drop table feature;--4------------------------------
drop table ground; --18----------------------------
drop table schedule; --12---------------------
drop table insider; --17-----------------------
drop table ground_post; --13------------------
drop table post_img;  --5----------------------
drop table badground_report; --6----------------------
drop table hashtag; --8-----------------------
drop table ground_hashtag; --7--------------------------
drop table participant; --9-----------------------
drop table GAME_CATEGORY; --16-------------------
drop table GAME_PROGRAM; --14----------------------
drop table OFFICIAL_GAME; --15-----------------
drop table CUSTOM_GAME; --10-------------------
drop table PROGRAM_OFFICIAL_GAME; --11---------------
drop table sido;
drop table sigungu;
-----------------

drop sequence hobby_seq;
drop sequence hobby_category_seq;
drop sequence feature_seq;
drop sequence ground_seq;
drop sequence schedule_seq;
drop sequence ground_post_seq;
drop sequence post_img_seq;
drop sequence badground_report_seq;
drop sequence GAME_CATEGORY_SEQ;
drop sequence GAME_PROGRAM_seq;
drop sequence OFFICIAL_GAME_seq;
drop sequence CUSTOM_GAME_Seq;
drop sequence sido_seq;
drop sequence sigungu_seq;
---------------

create sequence hobby_seq nocache;
create sequence hobby_category_seq nocache;
create sequence feature_seq nocache;
create sequence ground_seq nocache;
create sequence schedule_seq nocache;
create sequence ground_post_seq nocache;
create sequence post_img_seq nocache;
create sequence badground_report_seq nocache;
create sequence GAME_CATEGORY_SEQ nocache;
create sequence GAME_PROGRAM_seq nocache;
create sequence OFFICIAL_GAME_seq nocache;
create sequence CUSTOM_GAME_Seq nocache;
create sequence sido_seq nocache;
create sequence sigungu_seq nocache;
-----------------

----------------순서
-- 1
create table hobby_category(
   hobby_category_no number primary key,
   category varchar2(100) not null
)

--2
create table INSSA_MEMBER(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   name varchar2(100) not null,
   email varchar2(100) not null,
   status number default 1
);
--3
create table MEMBER_AUTHORITY(
   id varchar2(100),
   role varchar2(100),
   constraint fk_member_authority_id foreign key(id) references inssa_member(id),
   constraint pk_inssa_member primary key(id,role)
);
--4
create table hobby(
   hobby_no number primary key,
   name varchar2(100) not null,
   hobby_category_no number,
   constraint fk_hobby_category_no foreign key(hobby_category_no) references hobby_category(hobby_category_no)
)
--5
create table sido(
   sido_no number primary key,
   sido varchar2(100) not null
)
--6
create table sigungu(
   sigungu_no number primary key,
   sido_no number,
   constraint fk_sigungu foreign key(sido_no) references sido(sido_no)
)
--7
create table ground(
   ground_no number primary key,
   max_personnel number default 0,
   introduction varchar2(100) not null,
   ground_name varchar2(100) not null,
   master varchar2(100),
   hobby_no number,
   sigungu_no number,
   constraint fk_ground_sigungu_no foreign key(sigungu_no) references sigungu(sigungu_no),
   constraint fk_ground_id foreign key(master)  references inssa_member(id),
   constraint fk_ground_hobby_no foreign key(hobby_no) references hobby(hobby_no)
)
--8
create table insider(
   id varchar2(100),
   ground_no number,
   attendance number default 0,
   constraint fk_insider_id foreign key(id) references inssa_member,
   constraint fk_insider_ground_no foreign key(ground_no) references ground,
   constraint pk_insider primary key(id,ground_no)
)
--9
create table GAME_CATEGORY(
   cg_no number primary key,
   name varchar2(100) not null
);
--10
create table OFFICIAL_GAME(
   o_game_no number primary key,
   title varchar2(50) not null,
   min_personnel number default 0,
   max_parsonnel number default 1000,
   game_time number not null,
   materials varchar2(100) not null,
   content clob not null,
   cg_no number,
   constraint fk_GAME_CATEGORY_OFFICIAL foreign key(cg_no) references GAME_CATEGORY(cg_no)
);
--11
create table GAME_PROGRAM(
   program_no number primary key,
   title varchar2(100) not null,
   detail varchar2(50) not null
);
--12
create table ground_post(
   post_no number primary key,
   time_posted date default sysdate,
   hits number default 0,
   content clob not null,
   title varchar2(100) not null,
   id varchar2(100),
   ground_no number,
   constraint fk_ground_post_id foreign key(id,ground_no) references insider(id,ground_no)
)
--13
create table schedule(
   schedule_no number primary key,
   start_date date default sysdate,
   end_date date default sysdate,
   title varchar2(100) not null,
   loc varchar2(100) not null,
   content clob not null,
   id varchar2(100),
   ground_no number,
   constraint fk_schedule_id foreign key(id,ground_no) references insider(id,ground_no)   
)
--14
create table PROGRAM_OFFICIAL_GAME(
   program_no number,
   o_game_no number,
   game_order number,
   total_game number,
   constraint fk_GAME_PROGRAM1 foreign key(program_no) references GAME_PROGRAM,
   constraint fk_OFFICIAL_GAME1 foreign key(o_game_no) references OFFICIAL_GAME,
   constraint pk_PROGRAM_OFFICIAL_GAME1 primary key(program_no, o_game_no)
);
--15
create table CUSTOM_GAME(
   c_game_no varchar2(100) primary key,
   title varchar2(50) not null,
   min_personnel number default 0,
   max_personnel number default 1000,
   game_time number not null,
   materials varchar2(100) not null,
   content clob not null,
   recommendation number default 0,
   id varchar2(100) not null,
   cg_no number not null,
   constraint fk_INSSA_MEMBER_CUSTOM foreign key(id) references INSSA_MEMBER(id),
   constraint fk_GAME_CATEGORY_CUSTOM foreign key(cg_no) references GAME_CATEGORY(cg_no)
);
--16
create table participant(
   id varchar2(100),
   schedule_no number,
   ground_no number,
   constraint fk_participant_id foreign key(id,ground_no) references insider(id,ground_no),
   constraint fk_participant_schedule_no foreign key(schedule_no) references schedule(schedule_no),
   constraint pk_participant primary key(id,schedule_no,ground_no)
)
--17
create table hashtag(
   content varchar2(100) primary key
)
--18
create table ground_hashtag(
   content varchar2(100),
   ground_no number,
   constraint fk_ground_hashtag_content foreign key(content) references hashtag(content),
   constraint fk_ground_hashtag_ground_no foreign key(ground_no) references ground(ground_no)
)
--19
create table badground_report(
   report_no number primary key,
   content clob not null,
   title varchar2(100) not null,
   time_posted date default sysdate,
   id varchar2(100),
   ground_no number,
   constraint fk_badground_report_id foreign key(id) references inssa_member(id),
   constraint fk_badground_report_ground_no foreign key(ground_no) references ground(ground_no)
)
--20
create table post_img(
   img_no number primary key,
   img_name varchar2(100) not null,
   post_no number,
   constraint fk_post_img_post_no foreign key(post_no) references ground_post(post_no)
)
---21
create table feature(
   feature_no number primary key,
   name varchar2(100) not null
) 
--22
create table hobby_feature(
   feature_no number,
   hobby_no   number,
   constraint fk_hobby_feature_no foreign key(feature_no) references feature,
   constraint fk_hobby_no foreign key(hobby_no) references hobby,
   constraint pk_hobby_feature primary key(feature_no,hobby_no)
)
--23
create table PROFILE_IMG(
   id varchar2(100)   primary key,
   path varchar2(100),
   constraint fk_profile_id foreign key(id) references INSSA_MEMBER(id)
);
--24
create table EMAIL_KEY(
   id varchar2(100) primary key,
   email_key varchar2(100),
   reg_date date default sysdate,
   constraint fk_emailKey_id foreign key(id) references INSSA_MEMBER(id)
);


----------------------
delete from official_game;
select * from game_category;
select * from official_game;
insert into game_category values(1,'실내');
insert into game_category values(2,'실외');


-----------------------------------------------------------
INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (1.0, '이거 실화냐', 3.0, 30.0, 3.0, '사진', '확대된 사진을 보고 무엇인지 맞추는게임', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (2.0, '절대음감', 5.0, 30.0, 2.0, '없음', 'EX)(김)삿갓삿갓 , 김(삿)갓삿갓 ,김삿(갓)삿갓 , 김삿갓(삿)갓 , 김삿갓삿(갓)', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (3.0, '너, 나 알아', 8.0, 20.0, 15.0, '손수건, 쿠션', '⑴ 술래는 눈을 가리고 원 중앙에 서서 세 바퀴를 돈다. 
⑵ 그 동안 다른 사람들은 모두 자리를 바꾼다. 
⑶ 술래는 손에 쿠션을 들고 어느 한 사람 앞으로 찾아가서 쿠션으로 살짝 머리를 친다. 
⑷ 이때 웃음이 나와도 모두 웃는 소리를 내서는 안된다. 
⑸ 술래는 그 사람에게 신상에 관한 것 말고 아무거나 한 가지 질문을 한다. 
예 :"비를 좋아하세요?" "남자친구 이름이 뭐예요?" 
⑹ 쿠션으로 맞은 사람은 자신의 목소리를 술래가 못 알아채도록 바꾸어 대답을 한다. 
⑺ 술래는 그 사람이 누구인지를 알아맞혀야 하며 못 맞출 경우에는 벌칙을 받게 된다. 
⑻ 서로 잘 아는 관계에서 해야 재미있다. 
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (4.0, '난, 알아요', 4.0, 10.0, 20.0, '여러 소도구', '대형 : 이 열 종대 
⑴ 남녀 두사람이 짝을 이룬다. 
⑵ 두 사람은 서로에 대해 자세히 관찰한다. 옷, 장신구, 머리 모양 등등 
⑶ 사회자의 신호가 떨어지면 서로 상대방이 보이지 않는 곳으로 간다. 
⑷ 각자 자신의 옷과 머리모양과 장신구 등에 변화를 준다. 
예 : 반지의 위치나 귀걸이를 바꿈, 벨트를 바꿈, 소매를 걷어올림, 신발을 바꿔 신음 
⑸ 10분이 지난 후에 다시 원래의 위치로 돌아와서 상대방이 무엇이, 어떻게 바뀌었는지를 찾아낸다. 
⑹ 제한 시간 내에 절반 이상 맞추지 못하는 사람은 벌칙을 받게 된다. 
⑺ 짝을 바꾸어 가면서 여러 사람과 해본다. 
⑻ 서로에 대해 관심을 가질 수 있는 좋은 기회다. 

', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (5.0, '바운딩 골인', 5.0, 30.0, 5.0, '공', '공을 튀겨서 통에 넣는 게임', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (6.0, '지구는 초만원', 8.0, 30.0, 5.0, '신문지', '신문지 위에 많이 서기', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (7.0, '돼지 씨름', 2.0, 30.0, 2.0, '원', '원 안에서 손을 ''열중쉬어'' 자세로 잡고 앉은 채 상대를 밀어 넘어뜨리거나 원 밖으로 밀어내기', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (8.0, '신발 윷놀이', 4.0, 8.0, 15.0, '신발', '신발을 네짝을 던져 윷놀이 하기', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (9.0, '패션대회', 2.0, 5.0, 10.0, '옷', '남자가 여장하면 웃기고 재미있다
여자가 남장하면 웃기고 재미있다', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (10.0, '발 무릎 씨름', 2.0, 10.0, 1.0, '없음', '팔씨름과 같이 발로한다', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (11.0, '실내 철인경기', 10.0, 30.0, 3.0, '풍선,비스켓,물종이, 쟁반,밀가루,엿,', '똑같은 시합을 가장 빨리 하는 사람이 이기는 게임으로 코끼리 코 잡고 5바퀴 → 풍선 불어 터뜨리기 → 이마 위에 비스켓 놓고 손 안대고 먹기 → 
물종이 이마에 붙이고불어서 3개 먼저 떼기 → 쟁반 위의 밀가루속 엿을 손 안대고 먹기 → 비스켓 먹고 휘파람 불기', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (12.0, '황소싸움', 4.0, 10.0, 2.0, '물건(아무거나)', '두 명이 각각 양쪽 끝에 밧줄(고무)을 허리에 묶고 일정 지점의 물건을 빨리 집기', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (13.0, '개미떼 풍선 터뜨리기', 10.0, 10.0, 10.0, '풍선', '개미떼 풍선 터뜨리기 : 팀을 나누고 전원이 발목에 풍선을 묶고 상대팀의 풍선 터뜨리기', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (14.0, '신문에서 찾아라', 10.0, 10.0, 10.0, '신문', '신문에서 자신의 이름 찾기, 단어 찾기, 문장 찾기', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (15.0, '그림으로 물건 맞추기', 4.0, 20.0, 4.0, '도화지, 매직펜', '팀에서 그림을 잘 그리는 화가 한 사람을 선발한다. -> 화가는 리더에게 물건 이름이 적힌 메모지를 받는다. 
-> ''시작!'' 신호와 함께 도와지에 그림을 그려 자기 팀원에게 보여 주어 물건의 이름을 맞추게 한다. 
-> 제한 시간 내에 많이 맞추는 팀이 이긴다. 
* 주의 : 화가는 말을 하거나 손짓, 몸짓을 할 수 없다. 
* 응용 : 그림이나 문장(격언이나 속담)을 맞추는 것도 재미있다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (16.0, '변형구구단', 4.0, 10.0, 2.0, '없음', '5단 구구단에 "+2" 
5×1=7, 5×2=12, …… 
단 구구단에 "-3" 
짝수 구구단의 답에는 "나누기 2" 
8단 구구단의 답에 "곱하기 2" 
3단 구구단에 답은 7단으로 
3×1=7, 3×2=14, 3×3=21', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (17.0, '요트', 4.0, 10.0, 3.0, '머리위에 올려 놓을 만한 종이', '머리 위에 종이 1장을 올려놓고 반환점을 돌아오기', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (18.0, '바둑돌 전하기', 10.0, 30.0, 3.0, '바둑돌(다량), 접시, 나무젓가락(인원수 만큼)', '방법 : 진행자는 참가자들 두 팀으로 나눠 5 - 8명의 한조로 각각 게임을 한다. 
각 조는 일렬로 상대팀을 마주보고 자리에 앉는다.
선수들은 모두 나무 젓가락을 들고 있다가 첫 주가가 전해주는 바둑볼을 끝주자에게 전달한다. 
전달방법은 나무 젓가락으로 바둑돌을 집고 받을 때는 젓가락을 사용하지 않는 손바닥으로 받는다. 
바닥에 떨어진 바둑돌은 옮기면 안된다. 정해진 시간내에 가장 많이 옮기면 승리한다. 진행자는 승부를 결정짓고 다음조로 게임을 계속 이어 나간다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (19.0, '물건 찾아오기', 10.0, 10.0, 5.0, '여러 가지의 물건(손목시계, 열쇠, 동전, 책, 볼펜, 지우개 등),
눈가리개', '진행자는 전체를 두 팀으로 나눈다. 각팀의 출전 선수를 뽑고 출발선을 긋는다. 
출발선과 4 - 5m거리에 준비한 물건을 잔뜩 모아둔다. 
진행자의 신호가 떨어지면 양팀의 주자는 눈가리개를 하고 물건 있는 곳까지 달려간다.
그곳에서 진행자가 요구한 물건을 먼저 찾아오는 선수가 승리한다. 
예를 들어 진행자가 "열쇠를 가져오시오!"라고 하면 주자들은 3- 6동안 물건을 보고 눈가리개를 하고 달려가서 먼저 찾아와야 한다.
물건을 한데 모아두어 진행해도 되지만 일렬로 늘어 놓고 해도 괜찮다. 
한번 들고온 물건은 다시 섞여서 게임을 계속 진행한다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (20.0, '단어 전하기', 10.0, 30.0, 10.0, '없음', '전체를 두 팀으로 나누고 각팀을 일렬종대로 세운다음 자리에 앉힌다.
진행자는 사전에 준비한 단어를 맨 앞사람에게 보여주고 다음 사람에게 전하게 한다. 
단어를 전할 때는 뒷 사람의 등에 손가락으로 써서 전하게 한다. 먼저 끝내는 팀이 승리한다. 
단,단어를 맞춰야 한다. 진행자는 단어 외에 속담이나 짧은 문장을 섞어 응용해도 좋다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (21.0, '홍삼 게임', 4.0, 10.0, 3.0, '없음', '시작하는 사람이 두사람을 지목함
그 두사람은 각자 사람을 지목
지목한 사람이 겹치지 않을 시에 지목된 사람들이 다시 지목
지목된 사람이 겹칠 시 다같이 아싸! 홍삼 에블바디 홍삼을 말함
그 후 지목된 사람이 위에 과정을 반복', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (22.0, '기마전', 6.0, 30.0, 10.0, '없음', '시작하는 사람이 두사람을 지목함
그 두사람은 각자 사람을 지목
지목한 사람이 겹치지 않을 시에 지목된 사람들이 다시 지목
지목된 사람이 겹칠 시 다같이 아싸! 홍삼 에블바디 홍삼을 말함
그 후 지목된 사람이 위에 과정을 반복
', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (23.0, '발줄이기', 1.0, 10.0, 5.0, '없음', '팀을 이룬 사람들끼리 진행자가 말한 발개수만큼 발을 줄인다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (24.0, '좀비 게임', 2.0, 10.0, 10.0, '눈을 가릴 수 있는 천이나 안대', '술래가 눈을 가리고 코끼리코를 10바퀴 돔
그 사이 다른 사람들은 숨고 싶은 장소에 숨음
술래는 다른 사람들을 잡으러 돌아다님
잡히는 사람은 그 자리에서 움직일 수없음
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (25.0, '더 게임 오브 데스', 2.0, 10.0, 1.0, '없음', '각 사람은 지목하고 싶은 사람을 지목함
시작하는 사람이 원하는 숫자를 말하고 시작하는 사람부터 번호를 말함
지목한 사람을 따라가며 숫자를 말해 지정 숫자에 도달하는 사람이 패
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (26.0, '딸기게임', 2.0, 10.0, 3.0, '없음', '박자에 맞춰 딸기를 외침
최대 박자까지 딸기 개수가 하나씩 증가
최대 박자에서 다시 하나씩 감소
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (27.0, '풍선play', 4.0, 10.0, 1.0, '풍선', '풍선 빨리 불어 터뜨리기, 풍선 불어 묶지 않고 멀리 날리기, 풍선 빨리 불어 이성과
안아 터뜨리기, 풍선 빨리 불어 묶고서 엉덩이로 눌러 터뜨리기, 풍선 빨리 불어
묶고서 턱으로 터뜨리기, 물풍선 멀리 던지고 받기 등...', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (28.0, '인상맨', 2.0, 10.0, 1.0, '물먹은 종이', '물먹인 종이를 이마와 양볼 등 얼굴에 여러게 붙인다. 진행자의 신호와 함께 이것을
가장 빨리 떼는 사람이 이긴다. 손으로 떼거나 머리를 흔들면 반칙. 물종이를 떼기
위한 표정이 인상적이다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (29.0, '흔들어', 2.0, 10.0, 2.0, '솜', '솜을 옷에 여러개 붙인다. 그리고 춤을 추면서 몸에 붙어있는 솜을 떨어뜨리면 된다.
역시 손을 사용하면 반칙.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (30.0, '흔들어', 2.0, 10.0, 30.0, '솜', '솜을 옷에 여러개 붙인다. 그리고 춤을 추면서 몸에 붙어있는 솜을 떨어뜨리면 된다. 역시 손을 사용하면 반칙.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (31.0, '온 몸으로 사랑', 4.0, 32.0, 30.0, '조그만 과일', '남녀 한 커플이 서로 가까이 마주보고 붙어 서 있는다. 이때 진행자는 남녀의 이마 사이에 조그만 과일을 하나 끼워준다.
이들은 끼워준 과일을 땅에 떨어지지 않게 이마, 코, 가슴, 허리, 무릎, 다리 까지 옮기면 된다.
여러 커플을 시켜 가장 빨리 하는 커플이 이기게 된다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (32.0, '사랑의 징검다리', 10.0, 40.0, 60.0, '징검다리용 발판', '5쌍 정도가 출발선상에 나와 남자는 징검다리를 놓아주고 여자는 징검다리를 밟고 목표물까지 빨리 가면 이긴다. 
여기서 징검다리는 A4용지나 판지나 아무거나 재미있는 걸로 사용하면 된다. 여자와 남자가 바꿔서 해도 된다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (33.0, '평소에 감정있었니', 4.0, 30.0, 10.0, '풍선, 탁자, 주걱이나 몽둥이', '남자는 풍선을 들고 달려가 전방 10m 앞에 놓여있는 탁자 위에 엎드리고 풍선은 엉덩이위에 올려 놓는다.
이어서 여자도 달려가 큰주걱이나 가벼운 몽둥이로 그 풍선을 빨리터뜨리고 둘이 손잡고 돌아오는 게임이다. 실제로 아주 재미있다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (34.0, '커플 맞아', 10.0, 20.0, 30.0, '의자, 먹을것과 못먹는것, 쟁반, 안대', '5쌍 정도 앞으로 나오게 하여 남자는 의자에 앉게 하고 여자는 남자 뒤로 서게 한뒤 여자의 눈을 가린다.
진행자는 미리 준비한 먹을 수 있는 것과 먹지 못할 것이 섞여 있는 쟁반 5개를각 탁자 위에 올려 놓는다.
그리고 시작과 함께 여자는 먹여주고 남자는 먹게 되는데 남자는 두 손을 뒤로 해야 되고 말도 하면 안된다. 먹을 수 있는 것을 가장 빨리 먹으면 승리!
이 게임은 여자가 눈을 가렸기 때문에 먹을 것을 남자의 눈 이나 코에 넣어주기도 하고 먹지 못하는 것을 억지로 먹여주기도 하기 때문에 더욱 재미있다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (35.0, '땅따먹기', 8.0, 32.0, 60.0, '신문지', '진행자는 신문지 1장을 바닥에 넓게 편 다음, 4명의 여자는 신문지 좌우의 1m뒤에 서있다가 진행자의 신호와 함께 신문지 위로 뛰어서 두발을 뒤로 끌어당겨 신문지를 찢는다.
찢은 신문지는 가져가서 땅으로 여기고 커플이 들어가 오래 견뎌야 한다.
신문지 밖으로나가면 탈락. 진행자는 게임도중 여러 가지 핸디캡을 적용할 수 있다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (36.0, '지뢰밭의 사랑 구출작전', 4.0, 16.0, 30.0, '지뢰용 아이템', '먼저 진행자는 바닥에 지뢰용으로 계란, 페인트 통 등을 여러개 깔아 놓는다.
그다음 남자가 눈을 가리면, 여자는 지시를 해서 남자가 지뢰를 밟지 않고 목표물을 빨리 돌아오면 된다.
만약 남자가 지뢰를 밟으면 탈락. 실제로 이 게임은 어렵운 만큼 재미있다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (37.0, '5인조 달리기', 10.0, 15.0, 30.0, '비치볼', '두 팀으로 나누어 진행한다. 각 팀 1조 5명씩 서로 팔짱을 끼고 횡대로 서서 출발신호에 맞춰 달려가서 골의 지점까지 함께 도착하는 편이 이기게 된다. 양쪽 끝사람의 빈손에는 비치볼을 들게 한다. 릴레이로 할 경우 목표 반환물을 돌아서 오게 하고 다음 주자에게 바톤대신 비치볼을 넘겨준다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (38.0, '태평양 건너기', 40.0, 50.0, 60.0, '없음', '서로 마주보고 손을 잡고 서서 좌우로 밀착하여 선다. 손위로 1명씩 나와 두 손을 앞으로 쭉 뻗어 엎드린다. 시작 신호가 울리면 손을 맞잡은 사람들은 손을 뒤에서 앞으로 흔들어 엎드려 있는 수영선수를 앞으로 보낸다. 
끝까지 도착하면 전방 5m 까지 수영하여 반환점을 돌아 출발선까지 달려온다. 다음 사람에게 바톤터치하면 다음 사람 역시 같은 요령으로 이동한다. 먼저 끝난 팀이 승리하게 된다', 2.0);
/*
INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (39.0, '수중 장애물', 15.0, 20.0, 60.0, '물안경 2~3개, 타이어튜브 2~3개, 그물 1개, 사다리, 비치볼 2~3개, 반환물 2~3 개', '⑴ 출발선에서 각 팀별 1열로 서서 대기한다.
⑵ 출발신호에 맞춰 한 사람씩 출발한다. 첫 번째 코스에서 물안경을 쓴다.
⑶ 고무튜브를 향해 헤엄치거나 달려가서 고무튜브를 머리에서부터 뒤집어써서 빠져나온다.
⑷ 그물 밑을 잠수로 통과하여 빠져나온다.
⑸ 사다리 사이를 역시 잠수하여 통과한 후
⑹ 비치볼을 두 손으로 감싸쥐고 고무튜브를 활용하여 반환점을 돌아온다.
⑺ 원래 비치볼 위치까지 되돌아와서 비치볼을 제자리에 두고 역순으로 돌아온다.
⑻ 이때 물안경을 다음 주자에게 바톤대신 넘겨준다.
⑼ 최종적으로 먼저 도착한 팀이 승리한다.

', 2.0);*/

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (40.0, '수중 농구', 15.0, 20.0, 60.0, '비치볼, 바구니 2개 , 흰 끈', '양팀 골키퍼가 바구니를 들고 자기 팀이 던지는 공을 바구니로 받는 것으로서, 몸을 잡거나 세 걸음 이상 발을 옮기는 것은 허용되지 않는다. 일반적 경기규칙은 농구와 같이 적용된다. 상대편 골키퍼 진영에는 들어갈 수 없다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (41.0, '수중 피구', 30.0, 40.0, 60.0, '비치볼, 흰 끈', '각 팀 공격조가 상대방 수비조에게 공을 던져 맞추는 놀이이다. 볼에 몸이 맞으면 라인 밖으로 나와야 하며, 다시 들어가려면 자기팀이 점수를 얻어야 하는데, 점수를 얻는 방법은 상대팀에서 던지는 볼을 받아 내면 1점이 추가된다. 
최종적으로 남는 사람의 숫자가 그 점수가 되고, 그 동안 공을 받아 올린 점수를 더하여 승부를 결정한다. 경기는 전후반으로 나누어 진행하고, 전반전 경기가 끝나면 공격과 수비를 바꾸어 후반전 경기를 치른다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (42.0, '수중 발야구', 30.0, 40.0, 60.0, '비치볼, 베이스 4개 ( 풍선을 끈에 묶어 돌에 고정시킨다 )', '야구룰과 같으나 공격팀은 타자순으로 나와 방망이로 공을 치는 대신 발로 공을 찬다. 베이스는 풍선이나 비치볼을 끈에 묶어 돌에 매달아 둔다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (43.0, ' "가위 바위 보" 업어주기', 50.0, 60.0, 60.0, '없음', '
(1) 두 사람씩 짝을 지어 가위 바위 보를 한다.
(2) 진 사람이 이긴 사람을 업어 준다.
(3) 업힌 사람이 다른 업힌 사람과 만나 가위 바위 보를 한다.
(4) 업힌 사람의 승패에 따라 업은 사람은 같이 업히기도 하고 업기도 한다.
(5) 같은 방법으로 무르익을 때까지 ( 어느 정도 땀이 날 때까지 ) 계속한다.
비고 : 매우 소란스럽고 혼란해 보이는 듯하나 분명한 질서가 있고 금새 친숙해 질 수 있으니 염려하지 않아도 된다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (44.0, ' 알까기 술래잡기', 50.0, 60.0, 60.0, '없음', '(1) 술래를 정한다 ( 전체의 1/5 정도를 한다. )
(2) 술래를 알리고 열까지 센 후 친구들을 잡기 시작한다.
(3) 술래에게 잡힌 친구는 그 자리에서 양팔을 펴고 양발을 벌리고 서 있어야 한다.
(4) 아직 움직일 수 있는 친구가 서 있는 친구의 다리 밑을 통과하면 풀려난다,
(5) 술래에게 모두 잡히면 술래를 바꾼다.
', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (45.0, ' 그물 술래잡기', 40.0, 50.0, 60.0, '없음', '(1) 술래를 한 사람 정한다
(2) 맨 먼저 술래가 된 사람은 술래가 아닌 사람을 쫓아다닌다.
(3) 술래의 손이 닿으면 술래가 되는데, 이때 술래의 손이 닿은 부분을 한 손으로 잡고 쫓아 다녀야 한다
', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (46.0, ' 둘이서 한마음', 10.0, 15.0, 30.0, '작업용지 2종류, 볼펜', '⑴ 두 사람씩 짝을 짓는다. 
⑵ 두 사람 중 한사람은 눈을 감는다. 눈을 뜬 사람은 안내자, 눈감은 사람은 맹인이 된다. 
⑶ 두 사람당 "작업용지"를 한 장씩 나누어준다. 
⑷ 안내자가 볼펜을 맹인의 손에 쥐어 주고 출발점에 대게 한다. 
⑸ 안내자가 맹인에게서 손을 떼고 말로서만 도착까지 줄을 그어 가도록 설명해 준다. 
⑹ 다 끝나면 눈을 뜨고 그 사람이 역할을 교대하며 다시 같은 방법으로 실시한다. 
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (47.0, ' 갈수록 태산', 3.0, 7.0, 30.0, '없음', '⑴ 제비를 뽑아 누구부터 자기소개를 할 것인지를 결정한다. 
⑵ 맨 처음으로 소개하는 사람은 자기 이름과 신상에 대해서 간단하게 소개를 한다. 
⑶ 두 번째 사람부터는 앞사람의 이름을 먼저 말하고 자기소개를 한다.(예: 000옆에 000입니다) 
⑷ 이런 식으로 맨 마지막 사람까지 소개해 나가는데 점점 갈수록 소개 절차가 길어지고 어려워진다. 즉, 앞사람들의 이름을 모두 외워야 한다. 
⑸ 도중에 이름을 못 외우거나 틀리게 말하는 사람은 잘 외울 때까지 시킨다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (48.0, ' 나는 개성파!', 3.0, 7.0, 30.0, '종이,펜', '⑴ 모두는 종이에다 자신만이 가지고 있는 특징이나 자랑거리를 쓴다. 
⑵ 7-10개 정도 간략하게 적는다. 
(예 :# 우리집은 모두 10명의 대가족이며 할머니, 할아버지가 계시고 6공주 중에 저는 맏딸입니다. 
# 저는 새벽예배에 꼭 참석합니다. 
# 내 방은 온통 책으로 둘러싸여 있고 다른 장식품은 전혀 없습니다.) 
⑶ 한 명씩 발표하는데 발표자가 한 가지 말할 때마다 듣는 사람들은 자신과 같은 내용이면 손을 들어 표시한다. 
⑷ 발표자는 각 항목마다 손을 든 사람만큼 벌을 받게 된다. 
⑸ 모두 돌아가면서 자신의 총 벌점을 말한 후 벌점이 가장 적은 사람이 가장 독특하며 개성있는 사람으로 뽑힌다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (49.0, ' 어느새 찰싹', 3.0, 7.0, 30.0, '없음', '⑴ 오른손은 옆사람의 무릎에 얹어 놓고 왼손은 자기 무릎 위에 놓인 옆사람의 손을 때릴 준비를 한다. 
⑵ 사회자의 신호가 떨어지면 오른손은 재빨리 피하고 왼손은 옆사람의 손을 힘껏 내리친다. 
⑶ 사회자는 진행을 점차 빠르게 한다. 
⑷도중에 오른손, 왼손의 위치를 바꾸어 한다. 
⑸ 사회자가 단어를 하나 미리 정해 놓고, 이야기를 하는 중에 정해진 단어가 나오면 행동하도록 해도 재미있다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (50.0, ' 이름 따로 ,사람 따로', 3.0, 7.0, 30.0, '없음', '⑴ 둥그렇게 모여 앉는다. 
⑵ 사회자는 누군가를 손가락으로 가리키면서 이름을 부르는데 그 사람이 아닌 다른 사람의 이름을 부른다. 
⑶ 지적당한 사람은 "네"라고 대답을 하고, 이름을 불리운 당사자는 아무말 없이 벌떡 일어선다. 
⑷ 이때 일어선 사람도 사회자처럼 누군가를 가리키면서 다른 사람의 이름을 부르고 앉는다. 
⑸ 불리운 이름의 실제 사람이 엉겁결에 "네"라고 대답을 한다거나 또는 지적당한 사람이 "네"라고 대답을 안 하면 벌칙을 받게 한다. 
⑹ 진행 속도를 빠르게 해야 재미있다. 
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (51.0, ' 집중공격', 5.0, 10.0, 30.0, '모자, 호루라기', '⑴ 둥그렇게 둘러앉아 모두 노래를 부른다. 
⑵ 모자를 머리에 썼다가 벗어서 옆사람에게 주어 모자를 돌린다. 
⑶ 한편, 또 하나의 모자를 반대 방향으로 돌린다. 
⑷ 모자가 돌다가 어느 한 사람에게 집중해, 한꺼번에 두 개가 모이게 되면 그 사람은 실격이 된다. 
⑸ 사회자가 도중에 호루라기를 불면 가던 방향을 바꾼다. 
⑹ 모자 대신 손수건으로 해도 재미있다.', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (52.0, ' 진짜 헷갈려', 5.0, 10.0, 30.0, '없음', '⑴ 어느 한 사람으로부터 시작해서 오른쪽으로 돌아가면서 일련번호를 붙인다. 
⑵ 3박자로 맞추는데 1박자에 무릎을 치고 2박자에 손뼉을 치고 3박자에 엄지손가락을 들어올리면서 다른 사람의 번호를 부른다. 
⑶ 이때 짝수 번호인 사람은 홀수 번호만, 홀수 번호인 사람은 짝수 번호만 부를 수 있다. 
⑷ 홀수는 기수로, 짝수는 서수로 부른다. 
예 :일, 둘, 삼, 넷, 오, 여섯... 
⑸ 점차 진행 속도를 빠르게 한다. 
⑹ 틀린 사람은 실격이 되어 빠지고 빠진 사람의 번호를 부르면 그 사람도 실격이 된다. 
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (53.0, ' 끼리끼리 모여라', 5.0, 15.0, 60.0, '카드', '⑴ 사회자는 카드에 같은 팀끼리 같은 동작을 하도록 적어 놓는다. 
예: 탁구치는 흉내내기, 천사처럼 웃기 
자전거타는 흉내내기, 원숭이 흉내내기 
수영하는 흉내내기, 킹콩 흉내내기 
발레하는 흉내내기 
⑵ 모두에게 카드를 한 장씩 나누어 준다. 
⑶ 모두는 각자 자기 카드에 쓰여진 지시대로 흉내를 내며 돌아다닌다. 
⑷ 자신과 같은 동작을 하는 사람을 찾아서 한팀을 이룬다. 
⑸ 제한 시간 내에 자기 팀을 못 찾은 사람은 벌칙을 받게 된다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (54.0, ' 장님 코끼리 더듬기', 5.0, 10.0, 30.0, '손수건 또는 눈가리개', '⑴ 술래를 앞으로 나오게 하고 눈을 가린다. 
⑵ 다른 한 사람이 나와 술래와 마주보며 선다. 이성이면 더 재미있다. 
⑶ 사회자는 술래에게 그 사람을 만져보게 하는데 반드시 사회자가 지시하는 곳만 만져봐야 한다. 
⑷ 사회자는 먼저 "눈을 만져 보세요"라고 말한다. 술래는 눈만 만져 본 후 그 사람인 누구인지 짐작해 알아맞힌다. 못 알아맞힐 경우에는 "코를 만져 보세요" "귀를 만져 보세요" "머리를 만져 보세요" 등등 몇 번의 기회를 더 준다. 
⑸ 술래가 알아맞힐 경우 그 사람이 술래가 된다.', 2.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (55.0, '말타기?', 3.0, 5.0, 30.0, '없음', '양손을 앞으로 하여 말고삐를 쥔 듯한 자세를 하게 하고 한발을 들게 한다.??
사회자 "끼럇" 하면 제자리에서 펄쩍펄쩍 뛰게 한다.??마지막까지 버티는 사람의?
승리 팔을 내리면 반칙패를 선언하고 진행 중에 발을 "바꿔"하면서 발바꾸기를?
해도 좋고, 말소리를 내게 해도 좋다', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (56.0, '교통신호?', 3.0, 6.0, 30.0, '없음', '팀별로 선수를 1-2명 선발하여 무대위로 올린다.???한 팔은 위로 들고, 한 팔은 옆으로 반듯하게 들게 한다.???호각 대신에 휘파람을 계속 불면서 서있게 한다.???
휘파람을 불면서 마지막가지 버틴 사람의 승리.?진행자는 교통신호 지키기 등 교통사고에 관한 멘트를 한다.???눈을 이용하여 윙크를 번갈아 가며 시켜도 좋다.?', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (57.0, '눈싸움?', 2.0, 4.0, 30.0, '없음', '2명이 마주보고 선다.?시작신호에 맞춰 상대의 눈을 바라본다.?눈을 깜박이지 않고 오래 버티는 사람의 승리?진행자는 게임을 진행하면서 유머스런 멘트를 한다.?
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (58.0, '음정 높이기?', 2.0, 4.0, 30.0, '없음', '대표 또는 팀별로 대항할 수 있다.? 

"도"부터 시작하여 상대와 같이 음정을 높이기? 

게임중간에 제소리가 안 나오고 엉뚱한 소리를 내면 패배 승리한자 또는 팀에게? 
승리의 노래를 하게 해도 좋다.?', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (59.0, '풍선 내리고 올리기', 4.0, 8.0, 30.0, '풍선', '2명씩 마주보게 하고 풍선을 머리사이에 끼게 한다.?시작신호에 맞춰서 풍선을 손대지 않고 배까지 내리기?배에 있는 풍선을 이마부분에 다시 올려서 맞대기?손이 닿는지 확인하고, 손이 닿으면 처음부터 다시 하게 한다.?
음악을 얄궂게 하고, 재미있는 멘트를 상황에 따라한다.?', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (60.0, '입크게 벌리기?', 3.0, 6.0, 30.0, '없음', '대상들을 1열로 서게 한다.?시작신호에 다라서 입을 크게 벌리기?시작 전에 입운동을 시킨다던가 과자를 입에 넣게 해도 좋다.
?너무오랫동안 벌리지 않도록 판정을 빠르게 한다.?', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (61.0, '비비고 두드리기', 4.0, 6.0, 30.0, '없음', '왼손은 가슴에 대고 위 아래로 왔다갔다하며, 왼손은 가슴을 때린다.?
반복해서 하게 하다가, "바꿔"하면 왼손과 오른손의 동작을 바꿔서 하게 한다 
바꿔를 처음에는 천천히 하다가 빠르게 하면서 흥미를 더해간다. 
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (62.0, '상대방 칭찬하기?', 4.0, 6.0, 30.0, '없음', '대표자를 불러 마주 보게 한다.?쉬지 않고 상대방을 칭찬하도록 한다.?먼저 웃거나 말을 중단하면 패배?', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (63.0, '노래대결', 4.0, 5.0, 30.0, '없음', '개인별 또는 팀별 대항을 한다?진행자가 지시하는 팀이 노래를 한다.?전원이 노래를 할 수 있도록 지도한다.?노래를 끝까지 부르지않게하고 팀을 계속 바꾸면서 노래를 시킨다.?
진행자가 지시를 했는데도 노래를 못하면 패배?게임 전에 노래를 많이 알고 있는 사람으로 팀의 리더를 시킨다.?게임이 길어질 경우 노래의 종류를 제한한다.? 동요, 민요, 가곡 등으로 제한하여 2승 3판으로 해도 좋다
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (64.0, '가위 바위 보 왕뽑기', 3.0, 6.0, 30.0, '없음', '가위 바위 보, 양손 가위 바위 보, 엄지 잡기 등 어느 방법을 쓰든지 둘이서?
즉석에서 승부가 나는 승부 법을 한가지 혹은 여러 가지를 섞어가며 마지막?
한 명의 왕을 뽑는다.?먼저 2명이 승부를 내어 진 사람이 신하가 되어 뒤에 붙고 행진하다가 신하를?
거느린 채 왕끼리 승부를 내고 또 뒤에 달려서 왕뽑기에 이른다.?', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (65.0, '그림 나눠 짝 찾기', 4.0, 6.0, 30.0, '종이, 펜', '기존 그림을 활용하거나 지도자가 미리 그려올 수도 있지만 1명에 종이 한
장씩을 주고 돼지 등 지정돼 그림을 그려 마음대로 반으로 찢어 지도자에게 낸다?지도자는 전체인원의 반수의 것을 먼저 다시 나눠주고 짝찾기 놀이를 하고?
나중 반수 것으로 도 한번 할 수 있다?찾는 순으로 낮게 하여 다음 놀이에 연결할 수 있다.?

', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (66.0, '한 다발로 묶어', 12.0, 15.0, 60.0, '손수건', '손수건을 가진 사람을 12명쯤 나오게 하여 두편으로 나누고 "시작"하면 손수건
끼리 매듭지어 연결해서 원을 만들고 그 속에 6명이 들어가는 편에 점수를 준다.?그 다음 "3명"하면 원안의 1명이 나가 밖에 있는 사람 3명을 데리고 들어오는데?
자꾸 인원을 늘려가도 수건이 풀어지지 않아야 한다.?
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (67.0, '옆사람을 피해라', 4.0, 8.0, 30.0, '종이 또는 타월', '모두 한 줄로 둘러선 채 오른손을 뒤로 내밀어 종이 방망이나 타월 방망이를?
준비를 하고 다같이 신나는 노래를 부른다.?지도자가 원뒤로 돌아다니다가 아무 손에나 들고 있던 종이 방망이를 쥐어주면?
그 사람은 빨리 오른쪽 사람을 때리며 쫒아가고 오른쪽 사람은 달아나는데?
한바퀴 중 5번 이상 때려야 한다.?', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (68.0, '다람쥐 잡기?', 15.0, 20.0, 30.0, '없음', '다섯 명씩 한 조가 되어 네명은 원을 만들고 한 명은 다람쥐가 되어 원안에서?
있고 밖에는 다람쥐 한 마리와 늑대 한 마리가 있어 늑대가 다람쥐를 잡으로?
다닌다.?다람쥐가 아무 굴에나 들어가면 그 속에 있던 다람쥐는 굴속에서 빨리 나와 돌아
다니는데 늑대는 밖에 있는 다람쥐만 잡게되며 잡으면 늑대와 다람쥐의 역할이?
바뀌게 된다.?', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (69.0, '전류선 놀이', 6.0, 9.0, 30.0, '없음', '방사선형으로 중심을 향해 다섯줄 정도가 왼손으로 앞의 사람 어깨를 잡고 정열?
한다.?술래가 어느 줄이던 맨 끝사람을 치면 그 사람은 앞의 사람 어깨를 오른손으로?
쳐서 차례로 앞으로 전달해 맨 앞사람이 "전기야!"하면 흩어져 한바뀌돌고 도착
순으로 다시 연결하는데 이때 맨 나중에 도착한 사람이 술래가 된다', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (70.0, '풍선 축구', 3.0, 9.0, 30.0, '풍선', '가운데 놓은 탁자 중앙에 탁구공이나 풍선을 양쪽 대표가 가장 자리에서 입으로?
불어 일정한 시간에 어느 쪽으로 더 가 있거나 그쪽으로 떨어지느냐 하는 놀이다.?바닥이 깨끗하면 바닥에 놓고 기면서 할 수도 있고 탁자에 놓고 서로 눈을 가린
채 자기편의 응원소리를 듣고 불어서 진행할 수도 있을 것이다.?
', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (71.0, '포수와 탄환', 2.0, 4.0, 30.0, '라면,의자,꼬깔모자', '라면 상자에 구멍을 세 개정도 뚫어 양쪽 목표지점에 하나씩 의자에 올려놓고?
출발점에 있는 한편의 두명중 한 명은 고깔모자를 눈까지 가린 채로 머리를 쓰고
있다.?', 1.0);

INSERT INTO OFFICIAL_GAME (O_GAME_NO, TITLE, MIN_PERSONNEL, MAX_PARSONNEL, GAME_TIME, MATERIALS, CONTENT, CG_NO) 
VALUES (72.0, '주사위 탑 쌓기', 2.0, 4.0, 30.0, '주사위', '장기 알을 양쪽에 똑같이 나누어주고 주사위를 양쪽편 대표가 굴리게 한다?주사위에 나온 숫자대로 장기 알을 쌓아나가야 하는데 작은 알부터 쌓아 올려야?
하며 무너져 버린 것은 무효가 되어 계속한다.?주사위 놀이는 탑쌓기 뿐 아니라 칠판에 얼굴 그리거나 물건 뺏어오기 등 대표?
놀이에도 활용될 수 있다.', 1.0);

------------------------------------------------------sido
INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (1.0, '강원도');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (2.0, '경기도');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (3.0, '경상남도');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (4.0, '경상북도');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (5.0, '광주광역시');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (6.0, '대구광역시');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (7.0, '대전광역시');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (8.0, '부산광역시');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (9.0, '서울특별시');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (10.0, '세종특별자치시');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (11.0, '울산광역시');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (12.0, '인천광역시');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (13.0, '전라남도');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (14.0, '전라북도');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (15.0, '제주특별자치도');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (16.0, '충청남도');

INSERT INTO SIDO (SIDO_NO, SIDO) 
VALUES (17.0, '충청북도');
--------------------------------------------------------

------------------------------------sigungu
INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (1.0, '강릉시', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (2.0, '고성군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (3.0, '동해시', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (4.0, '삼척시', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (5.0, '속초시', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (6.0, '양구군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (7.0, '양양군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (8.0, '영월군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (9.0, '원주시', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (10.0, '인제군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (11.0, '정선군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (12.0, '철원군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (13.0, '춘천시', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (14.0, '태백시', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (15.0, '평창군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (16.0, '홍천군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (17.0, '화천군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (18.0, '횡성군', 1.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (19.0, '가평군', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (20.0, '고양시 덕양구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (21.0, '고양시 일산동구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (22.0, '고양시 일산서구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (23.0, '과천시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (24.0, '광명시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (25.0, '광주시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (26.0, '구리시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (27.0, '군포시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (28.0, '김포시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (29.0, '남양주시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (30.0, '동두천시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (31.0, '부천시 소사구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (32.0, '부천시 오정구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (33.0, '부천시 원미구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (34.0, '성남시 분당구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (35.0, '성남시 수정구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (36.0, '성남시 중원구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (37.0, '수원시 권선구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (38.0, '수원시 영통구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (39.0, '수원시 장안구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (40.0, '수원시 팔달구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (41.0, '시흥시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (42.0, '안산시 단원구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (43.0, '안산시 상록구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (44.0, '안성시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (45.0, '안양시 동안구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (46.0, '안양시 만안구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (47.0, '양주시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (48.0, '양평군', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (49.0, '여주군', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (50.0, '연천군', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (51.0, '오산시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (52.0, '용인시 기흥구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (53.0, '용인시 수지구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (54.0, '용인시 처인구', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (55.0, '의왕시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (56.0, '의정부시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (57.0, '이천시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (58.0, '파주시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (59.0, '평택시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (60.0, '포천시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (61.0, '하남시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (62.0, '화성시', 2.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (63.0, '거제시', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (64.0, '거창군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (65.0, '고성군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (66.0, '김해시', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (67.0, '남해군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (68.0, '밀양시', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (69.0, '사천시', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (70.0, '산청군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (71.0, '양산시', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (72.0, '의령군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (73.0, '진주시', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (74.0, '창녕군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (75.0, '창원시 마산합포구', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (76.0, '창원시 마산회원구', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (77.0, '창원시 성산구', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (78.0, '창원시 의창구', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (79.0, '창원시 진해구', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (80.0, '통영시', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (81.0, '하동군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (82.0, '함안군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (83.0, '함양군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (84.0, '합천군', 3.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (85.0, '경산시', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (86.0, '경주시', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (87.0, '고령군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (88.0, '구미시', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (89.0, '군위군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (90.0, '김천시', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (91.0, '문경시', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (92.0, '봉화군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (93.0, '상주시', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (94.0, '성주군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (95.0, '안동시', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (96.0, '영덕군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (97.0, '영양군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (98.0, '영주시', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (99.0, '영천시', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (100.0, '예천군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (101.0, '울릉군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (102.0, '울진군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (103.0, '의성군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (104.0, '청도군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (105.0, '청송군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (106.0, '칠곡군', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (107.0, '포항시 남구', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (108.0, '포항시 북구', 4.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (109.0, '광산구', 5.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (110.0, '남구', 5.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (111.0, '동구', 5.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (112.0, '북구', 5.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (113.0, '서구', 5.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (114.0, '남구', 6.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (115.0, '달서구', 6.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (116.0, '달성군', 6.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (117.0, '동구', 6.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (118.0, '북구', 6.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (119.0, '서구', 6.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (120.0, '수성구', 6.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (121.0, '중구', 6.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (122.0, '대덕구', 7.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (123.0, '동구', 7.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (124.0, '서구', 7.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (125.0, '유성구', 7.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (126.0, '중구', 7.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (127.0, '강서구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (128.0, '금정구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (129.0, '기장군', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (130.0, '남구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (131.0, '동구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (132.0, '동래구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (133.0, '부산진군', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (134.0, '북구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (135.0, '사상구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (136.0, '사하구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (137.0, '서구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (138.0, '수영구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (139.0, '연제구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (140.0, '영도구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (141.0, '중구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (142.0, '해운대구', 8.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (143.0, '강남구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (144.0, '강동구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (145.0, '강북구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (146.0, '강서구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (147.0, '관악구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (148.0, '광진구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (149.0, '구로구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (150.0, '금천구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (151.0, '노원구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (152.0, '도봉구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (153.0, '동대문구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (154.0, '동작구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (155.0, '마포구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (156.0, '서대문구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (157.0, '서초구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (158.0, '성동구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (159.0, '성북구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (160.0, '송파구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (161.0, '양천구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (162.0, '영등포구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (163.0, '용산구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (164.0, '은평구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (165.0, '종로구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (166.0, '중구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (167.0, '중랑구', 9.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (168.0, '세종특별자치시', 10.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (169.0, '남구', 11.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (170.0, '동구', 11.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (171.0, '북구', 11.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (172.0, '울주군', 11.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (173.0, '중구', 11.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (174.0, '강화군', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (175.0, '계양구', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (176.0, '남구', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (177.0, '남동구', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (178.0, '동구', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (179.0, '부평구', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (180.0, '서구', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (181.0, '연수구', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (182.0, '옹진군', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (183.0, '중구', 12.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (184.0, '강진군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (185.0, '고흥군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (186.0, '곡성군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (187.0, '광양시', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (188.0, '구례군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (189.0, '나주시', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (190.0, '담양군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (191.0, '목포시', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (192.0, '무안군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (193.0, '보성군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (194.0, '순천시', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (195.0, '신안구', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (196.0, '여수시', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (197.0, '영광군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (198.0, '영암군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (199.0, '완도군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (200.0, '장성군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (201.0, '장흥군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (202.0, '진도군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (203.0, '함평군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (204.0, '해남군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (205.0, '화순군', 13.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (206.0, '고창군', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (207.0, '군산시', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (208.0, '김제시', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (209.0, '남원시', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (210.0, '무주군', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (211.0, '부안군', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (212.0, '순창군', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (213.0, '완주군', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (214.0, '익산시', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (215.0, '임실군', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (216.0, '장수군', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (217.0, '전주시 덕진구', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (218.0, '전주시 완산구', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (219.0, '정읍시', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (220.0, '진안군', 14.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (221.0, '서귀포시', 15.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (222.0, '제주시', 15.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (223.0, '계룡시', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (224.0, '공주시', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (225.0, '금산군', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (226.0, '논산시', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (227.0, '당진시', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (228.0, '보령시', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (229.0, '부여군', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (230.0, '서산시', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (231.0, '서천군', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (232.0, '아산시', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (233.0, '예산군', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (234.0, '천안시 동남구', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (235.0, '천안시 서북구', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (236.0, '청양군', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (237.0, '태안군', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (238.0, '홍성군', 16.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (239.0, '괴산군', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (240.0, '단양군', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (241.0, '보은군', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (242.0, '영동군', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (243.0, '옥천군', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (244.0, '음성군', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (245.0, '제천시', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (246.0, '증평군', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (247.0, '진천군', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (248.0, '청주시 상당구', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (249.0, '청주시 서원구', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (250.0, '청주시 청원구', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (251.0, '청주시 흥덕구', 17.0);

INSERT INTO SIGUNGU (SIGUNGU_NO, SIGUNGU_NAME, SIDO_NO) 
VALUES (252.0, '충주시', 17.0);
-----------------------------------
--------------------------------------------취미 카테고리
INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (1.0, '수집');

INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (2.0, '수공예');

INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (3.0, '키우기');

INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (4.0, '문화');

INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (5.0, '예술');

INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (6.0, '운동/스포츠');

INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (7.0, '게임');

INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (8.0, '요리');

INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (9.0, '체험');

INSERT INTO HOBBY_CATEGORY (HOBBY_CATEGORY_NO, CATEGORY) 
VALUES (10.0, '기타');
------------------------------------------

--------------------------------------------------------취미 특징
INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (1.0, '실내');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (2.0, '실외');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (3.0, '꾸준함이 요구되는');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (4.0, '일회성의');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (5.0, '섬세함이 요구되는');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (6.0, '결과물이 있는');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (7.0, '정성이 필요한');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (8.0, '두뇌');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (9.0, '신체');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (10.0, '의미 있는');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (11.0, '창작');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (12.0, '혼자 하는');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (13.0, '여러 사람과 어울리는');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (14.0, '투자가 필요한');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (15.0, '조용한');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (16.0, '시끌벅적한');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (17.0, '집중력이 요구되는');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (18.0, '차분한');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (19.0, '흥겨운');

INSERT INTO FEATURE (FEATURE_NO, NAME) 
VALUES (20.0, '자기 계발');
--------------------------------------------------------

----------------------------------------------취미
INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (1.0, 'RC카', 1.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (2.0, '레고', 1.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (3.0, '프라모델', 1.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (4.0, '피규어', 1.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (5.0, '우표', 1.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (6.0, '화폐', 1.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (7.0, '기타', 1.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (8.0, '가구DIY', 2.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (9.0, '가죽공예', 2.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (10.0, '액세서리', 2.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (11.0, '자수', 2.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (12.0, '퀼트', 2.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (13.0, '꽃꽂이', 2.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (14.0, '뜨개질', 2.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (15.0, '기타', 2.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (16.0, '강아지', 3.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (17.0, '고양이', 3.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (18.0, '물고기', 3.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (19.0, '식물', 3.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (20.0, '기타', 3.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (21.0, '뮤지컬', 4.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (22.0, '연극', 4.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (23.0, '영화', 4.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (24.0, '콘서트', 4.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (25.0, '페스티벌', 4.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (26.0, '기타', 4.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (27.0, '그림', 5.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (28.0, '서예', 5.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (29.0, '캘리그라피', 5.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (30.0, '음악감상', 5.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (31.0, '악기연주', 5.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (32.0, '댄스', 5.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (33.0, '작곡', 5.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (34.0, '보컬', 5.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (35.0, '기타', 5.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (36.0, '러닝', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (37.0, '등산', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (38.0, '볼링', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (39.0, '당구', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (40.0, '축구', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (41.0, '야구', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (42.0, '농구', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (43.0, '스키', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (44.0, '보드', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (45.0, '자전거', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (46.0, '수영', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (47.0, '수상레저', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (48.0, '경기관람', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (49.0, '익스트림스포츠', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (50.0, '기타', 6.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (51.0, 'PC게임', 7.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (52.0, '모바일게임', 7.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (53.0, '보드게임', 7.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (54.0, '오락실게임', 7.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (55.0, '기타', 7.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (56.0, '한식', 8.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (57.0, '일식', 8.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (58.0, '중식', 8.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (59.0, '양식', 8.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (60.0, '디저트', 8.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (61.0, '기타', 8.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (62.0, '여행', 9.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (63.0, '전통', 9.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (64.0, '맛집', 9.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (65.0, '공포', 9.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (66.0, '기타', 9.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (67.0, '낚시', 10.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (68.0, '코스프레', 10.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (69.0, '마술', 10.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (70.0, '봉사활동', 10.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (71.0, '팬활동', 10.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (72.0, '사교', 10.0);

INSERT INTO HOBBY (HOBBY_NO, NAME, HOBBY_CATEGORY_NO) 
VALUES (73.0, '기타', 10.0);
------------------------------------------------
----------------------------------------------- 취미 특징 관계테이블
INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (1.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (1.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (1.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (1.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (1.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (1.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (2.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (2.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (2.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (2.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (2.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (2.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (3.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (3.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (3.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (3.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (3.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (3.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (3.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (3.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (3.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (4.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (4.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (4.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (4.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (4.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (5.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (5.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (5.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (5.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (5.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (6.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (6.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (6.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (6.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (6.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (7.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (7.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (7.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (7.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (7.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (8.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (8.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (8.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (8.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (8.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (8.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (9.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (9.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (9.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (9.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 10.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (10.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (11.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (11.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (11.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (11.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (11.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (11.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (11.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (12.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (12.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (12.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (12.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (12.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (12.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (12.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (12.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (13.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (13.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (13.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (13.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (13.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (13.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (14.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (15.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (16.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (16.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (16.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (16.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (16.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (16.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (17.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (17.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (17.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (17.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (17.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (17.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (18.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (18.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (18.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (18.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (18.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (18.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (19.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (19.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (19.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (19.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (19.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (19.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (19.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (20.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (20.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (20.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (20.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (20.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (20.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (20.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (21.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (21.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (21.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (21.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (21.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (21.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (21.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (22.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (22.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (22.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (22.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (22.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (22.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (22.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (22.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (23.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (23.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (23.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (23.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (23.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (23.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (24.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (24.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (24.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (24.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (24.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (25.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (25.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (25.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (25.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (25.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (26.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (26.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (26.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (26.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (26.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (27.0, 20.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (28.0, 20.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (29.0, 20.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (30.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (30.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (30.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (30.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (31.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (31.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (31.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (31.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (31.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (31.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (31.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (31.0, 20.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (32.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (32.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (32.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (32.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (32.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (32.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (33.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (33.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (33.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (33.0, 10.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (33.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (33.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (33.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (33.0, 20.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (34.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (34.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (34.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (34.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (34.0, 20.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (35.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (35.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (35.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (35.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (35.0, 20.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (36.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (36.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (36.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (36.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (36.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (36.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (37.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (37.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (37.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (37.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (38.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (38.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (38.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (38.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (38.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (39.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (39.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (39.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (39.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (39.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (39.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (40.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (40.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (40.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (40.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (40.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (41.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (41.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (41.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (41.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (41.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (42.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (42.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (42.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (42.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (42.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (43.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (43.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (43.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (43.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (43.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (44.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (44.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (44.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (44.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (45.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (45.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (45.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (45.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (45.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (46.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (46.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (46.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (46.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (46.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (47.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (47.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (47.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (47.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (47.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (48.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (48.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (48.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (48.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (48.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (49.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (49.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (49.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (49.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (49.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (50.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (50.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (50.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (50.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (50.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (51.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (51.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (51.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (51.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (51.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (52.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (52.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (52.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (52.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (52.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (53.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (53.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (53.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (53.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (54.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (54.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (54.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (54.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (54.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (55.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (55.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (55.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (55.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (55.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (56.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (56.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (56.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (56.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (56.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (56.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (56.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (56.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (57.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (57.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (57.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (57.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (57.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (57.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (57.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (57.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (58.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (58.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (58.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (58.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (58.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (58.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (58.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (58.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (59.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (59.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (59.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (59.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (59.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (59.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (59.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (59.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (60.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (60.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (60.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (60.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (60.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (60.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (60.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (60.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (61.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (61.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (61.0, 5.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (61.0, 6.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (61.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (61.0, 11.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (61.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (61.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (62.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (62.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (62.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (62.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (62.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (62.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (63.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (63.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (63.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (63.0, 18.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (64.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (64.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (64.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (64.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (64.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (65.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (65.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (65.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (66.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (66.0, 4.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (66.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (66.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (66.0, 14.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (66.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (67.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (67.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (67.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (67.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (67.0, 15.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (68.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (68.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (68.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (68.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (68.0, 9.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (69.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (69.0, 20.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (69.0, 17.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (69.0, 8.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (69.0, 12.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (69.0, 1.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (70.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (70.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (70.0, 10.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (70.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (70.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (71.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (71.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (71.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (71.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (71.0, 7.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (71.0, 3.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (72.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (72.0, 10.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (72.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (72.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (72.0, 19.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (73.0, 2.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (73.0, 10.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (73.0, 16.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (73.0, 13.0);

INSERT INTO HOBBY_FEATURE (HOBBY_NO, FEATURE_NO) 
VALUES (73.0, 19.0);
------------------------------------------------------
delete from sido;
select * from sigungu;
--------------------------------------------------
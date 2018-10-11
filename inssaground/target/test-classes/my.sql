alter table ground add(status number default 0);
alter table insider add(status number default 0);
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
   introduction varchar2(100) not null,
   ground_name varchar2(100) not null,
   master varchar2(100),
   hobby_no number,
   sigungu_no number,
   constraint fk_ground_sigungu_no foreign key(sigungu_no) references(sigungu_no),
   constraint fk_ground_id foreign key(master)  references inssa_member(id),
   constraint fk_ground_hobby_no foreign key(hobby_no) references hobby(hobby_no)
)
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
   constraint fk_participant_id foreign key(id) references inssa_member(id),
    constraint fk_participant_schedule_no foreign key(schedule_no) references schedule(schedule_no),
    constraint fk_participant_ground_no foreign key(ground_no) references ground(ground_no),
    constraint pk_participant primary key(schedule_no,ground_no)
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
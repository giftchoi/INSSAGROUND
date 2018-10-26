--------------------------------------------------------------------------------
-----------------------------CREATE SEQUENCE-----------------------------
--------------------------------------------------------------------------------
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
create sequence ground_img_seq nocache;
create sequence notice_seq nocache;
--------------------------------------------------------------------------------
-------------------------------CREATE TABLE--------------------------------
--------------------------------------------------------------------------------
-- 1
drop table hobby_category
create table hobby_category(
   hobby_category_no number primary key,
   category varchar2(100) not null
)
--2
drop table inssa_member
create table INSSA_MEMBER(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   name varchar2(100) not null,
   email varchar2(100) not null,
   status number default 1,
   constraint fk_email foreign key(email) references email_key(email)
)
--3
drop table member_authority
create table MEMBER_AUTHORITY(
   id varchar2(100),
   role varchar2(100),
   constraint fk_member_authority_id foreign key(id) references inssa_member(id),
   constraint pk_inssa_member primary key(id,role)
);
--4
drop table hobby
create table hobby(
   hobby_no number primary key,
   name varchar2(100) not null,
   hobby_category_no number,
   constraint fk_hobby_category_no foreign key(hobby_category_no)
   references hobby_category(hobby_category_no)
)
--5
drop table sido
create table sido(
   sido_no number primary key,
   sido varchar2(100) not null
)
--6
select * from sigungu
drop table sigungu 
create table sigungu(
   sigungu_no number primary key,
   sigungu_name varchar2(100) not null,
   sido_no number,
   constraint fk_sigungu foreign key(sido_no) references sido(sido_no)
)
alter table sigungu add sigungu_name varchar2(100) not null
--7
drop table ground
create table ground(
   ground_no number primary key,
   max_personnel number default 0,
   introduction clob not null,
   ground_name varchar2(100) not null,
   master varchar2(100),
   hobby_no number,
   sigungu_no number,
   status number default 0,
   constraint fk_ground_sigungu_no foreign key(sigungu_no) references sigungu(sigungu_no),
   constraint fk_ground_id foreign key(master)  references inssa_member(id),
   constraint fk_ground_hobby_no foreign key(hobby_no) references hobby(hobby_no)
)

--8
drop table insider
create table insider(
   id varchar2(100),
   ground_no number,
   attendance number default 0,
   status number default 0,
   constraint fk_insider_id foreign key(id) references inssa_member,
   constraint fk_insider_ground_no foreign key(ground_no) references ground,
   constraint pk_insider primary key(id,ground_no)
)
--9
drop table game_category
create table GAME_CATEGORY(
   cg_no number primary key,
   name varchar2(100) not null
);
--10
drop table official_game
create table OFFICIAL_GAME(
   o_game_no number primary key,
   title varchar2(50) not null,
   min_personnel number default 0,
   max_personnel number default 1000,
   game_time number not null,
   materials varchar2(100) not null,
   content clob not null,
   cg_no number,
   constraint fk_GAME_CATEGORY_OFFICIAL foreign key(cg_no) references GAME_CATEGORY(cg_no)
);
--11
drop table game_program
create table GAME_PROGRAM(
   program_no number primary key,
   title varchar2(100) not null,
   detail varchar2(50) not null,
   id varchar2(100) not null,
   CONSTRAINT fk_GAME_PROGRAM_id FOREIGN KEY (id) REFERENCES INSSA_MEMBER(id)
);
--12
drop table ground_post
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
drop table schedule
create table schedule(
   schedule_no number primary key,
   start_date date default sysdate,
   end_date date default sysdate,
   title varchar2(100) not null,
   loc varchar2(100) not null,
   content clob not null,
   max_personnel number not null,
   id varchar2(100),
   ground_no number,
   constraint fk_schedule_id foreign key(id,ground_no) references insider(id,ground_no)   
)
--14
drop table program_official_game
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
drop table custom_game
create table CUSTOM_GAME(
   c_game_no number primary key,
   title varchar2(50) not null,
   min_personnel number default 0,
   max_personnel number default 1000,
   game_time number not null,
   materials varchar2(100) not null,
   content clob not null,
   writer_id varchar2(100) not null,
   cg_no number not null,
   constraint fk_INSSA_MEMBER_CUSTOM foreign key(writer_id) references INSSA_MEMBER(id),
   constraint fk_GAME_CATEGORY_CUSTOM foreign key(cg_no) references GAME_CATEGORY(cg_no)
);
--16
drop table participant
create table participant(
   id varchar2(100),
   schedule_no number,
   ground_no number,
   constraint fk_participant_id foreign key(id,ground_no) references insider(id,ground_no),
   constraint fk_participant_schedule_no foreign key(schedule_no) references schedule(schedule_no),
   constraint pk_participant primary key(id,schedule_no,ground_no)
)
--17
drop table hashtag
create table hashtag(
   content varchar2(100) primary key
)
--18
drop table ground_hashtag
create table ground_hashtag(
   content varchar2(100),
   ground_no number,
   constraint fk_ground_hashtag_content foreign key(content) references hashtag(content),
   constraint fk_ground_hashtag_ground_no foreign key(ground_no) references ground(ground_no)
)
--19
drop table badground_report
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
drop table post_img
create table post_img(
   img_no number primary key,
   img_name varchar2(100) not null,
   post_no number,
   constraint fk_post_img_post_no foreign key(post_no) references ground_post(post_no)
)
---21
drop table feature
create table feature(
   feature_no number primary key,
   name varchar2(100) not null
) 
--22
drop table hobby_feature
create table hobby_feature(
   feature_no number,
   hobby_no   number,
   constraint fk_hobby_feature_no foreign key(feature_no) references feature,
   constraint fk_hobby_no foreign key(hobby_no) references hobby,
   constraint pk_hobby_feature primary key(feature_no,hobby_no)
)
--23
drop table PROFILE_IMG;
create table PROFILE_IMG(
   id varchar2(100)   primary key,
   path varchar2(100),
   constraint fk_profile_id foreign key(id) references INSSA_MEMBER(id)
);
--24
drop table EMAIL_KEY;
create table EMAIL_KEY(
   email varchar2(100) primary key,
   email_key varchar2(100),
   reg_date date default sysdate,
   status number default 0
);

--25
drop table recommendation
create table recommendation(
    id varchar2(100) not null,
    c_game_no number not null,
    constraint fk_recommendation_id foreign key(id) references INSSA_MEMBER(id),
    constraint fk_recommendation_c_game_no foreign key(c_game_no) references CUSTOM_GAME(c_game_no),
    constraint pk_recommendation primary key(id,c_game_no)
)
--26
drop table ground_img
create table ground_img(
	ground_img_no number primary key,
	img_name varchar2(100) not null,
	ground_no number not null,
	constraint fk_ground_img foreign key (GROUND_NO) REFERENCES GROUND (GROUND_NO)
)

--27
create table notice(
   notice_no number primary key,
   ground_no number not null,
   time_posted date default sysdate,
   content clob not null,
   
   constraint fk_notice_ground_no foreign key(ground_no) references ground(ground_no)
)
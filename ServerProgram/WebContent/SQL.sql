create table course_tbl(id VARCHAR2(5) not null primary key, name VARCHAR2(40), credit number(6), lecturer number(6), week number(2), start_hour number(4), end_hour number(4));

insert into course_tbl VALUES(10001, '프로그래밍', 2, 1, 1, 0900, 1100);
insert into course_tbl VALUES(10002, '객체지향 프로그래밍', 2, 2, 2, 0900, 1200);
insert into course_tbl VALUES(10003, '자료구조', 3, 4, 3, 0900, 1200);
insert into course_tbl VALUES(10004, '알고리즘', 3, 4, 4, 0900, 1200);
insert into course_tbl VALUES(20001, '시스템 프로그래밍', 2, 5, 1, 1300, 1600);
insert into course_tbl VALUES(20002, '운영체제', 3, 5, 2, 1500, 1800);
insert into course_tbl VALUES(20003, '오토마타와 컴파일러', 3, 5, 3, 1330, 1630);
insert into course_tbl VALUES(30001, '소프트웨어 공학', 2, 3, 4, 1300, 1530);
insert into course_tbl VALUES(30002, '시스템 분석 및 설계', 3, 3, 5, 0900, 1200);
insert into course_tbl VALUES(40001, '데이터베이스', 3, 2, 5, 1300, 1600);

create table lecturer_tbl(idx number(6) not null primary key, name VARCHAR2(40), major VARCHAR2(40), field VARCHAR2(40));

create sequence lecturer_seq nocache;

insert into lecturer_tbl VALUES(lecturer_seq.nextval, '김교수', '소프트웨어 공학', '알고리즘');
insert into lecturer_tbl VALUES(lecturer_seq.nextval, '이교수', '소프트웨어 공학', '인공지능');
insert into lecturer_tbl VALUES(lecturer_seq.nextval, '박교수', '소프트웨어 공학', '소프트웨어 공학');
insert into lecturer_tbl VALUES(lecturer_seq.nextval, '오교수', '소프트웨어 공학', '알고리즘');
insert into lecturer_tbl VALUES(lecturer_seq.nextval, '최교수', '응용컴퓨터 공학', '임베디드 시스템');
insert into lecturer_tbl VALUES(lecturer_seq.nextval, '강교수', '응용컴퓨터 공학', '멀티미디어');
insert into lecturer_tbl VALUES(lecturer_seq.nextval, '황교수', '모바일 시스템 공학', '네트워크');

commit;
create table board(
    num number(5) primary key,
    pw varchar2(30),
    name varchar2(30),
    email varchar2(30),
    title varchar2(50),
    content varchar2(1000),
    readCount number(4) default 0,
    writedate date default sysdate);

create SEQUENCE board_seq nocache;

insert into board(num, pw, name, email, title, content, readCount) values (board_seq.nextval, 1234, '홍길동', 'hong@naver.com, ', '첫 방문', '반갑습니다.', 0);
insert into board(num, pw, name, email, title, content, readCount) values (board_seq.nextval, 1234, '김길동', 'kim@naver.com', '반가워요', '대출은 000-0000-0000', 0);
insert into board(num, pw, name, email, title, content, readCount) values (board_seq.nextval, 1234, '이길동', 'lee@naver.com', '건강하세요', '건강하시죠?', 0);
insert into board(num, pw, name, email, title, content, readCount) values (board_seq.nextval, 1234, '박길동', 'park@naver.com', '보험 문의', '평생을 함께하는 XX보험사', 0);
insert into board(num, pw, name, email, title, content, readCount) values (board_seq.nextval, 1234, '고길동', 'ko@naver.com', '글 제목입니다.', '아무 내용', 0);
commit;

select * from board;
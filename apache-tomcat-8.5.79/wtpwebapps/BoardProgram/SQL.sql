CREATE TABLE board_tbl(idx number(6) Primary Key,
    writer varchar2(20),
    subject varchar2(255),
    content clob,
    regdate date);
    
CREATE TABLE comment_tbl(idx number(6) PRIMARY KEY,
    bidx number(6),
    writer VARCHAR2(20),
    content clob,
    regdate date);
                    
CREATE SEQUENCE board_seq NOCACHE;
CREATE SEQUENCE comment_seq NOCACHE;

INSERT INTO board_tbl VALUES(board_seq.nextval, '김회원', '정보처리 산업기사 쉽다', 'jsp 쉽네요', sysdate);
INSERT INTO board_tbl VALUES(board_seq.nextval, '김회원', '웹 디자인 기능사 어렵다', 'jquery 어렵네요', sysdate);
INSERT INTO board_tbl VALUES(board_seq.nextval, '이회원', '정보처리 산업기사 어렵다', 'jsp 어렵네요', sysdate);
INSERT INTO board_tbl VALUES(board_seq.nextval, '이회원', '정보처리 산업기사 쉽다', 'jquery 쉽네요', sysdate);
INSERT INTO board_tbl VALUES(board_seq.nextval, '박회원', 'ㅈㄱㄴ', '제목 그대로 내용', sysdate);
INSERT INTO board_tbl VALUES(board_seq.nextval, '박회원', '제목 그대로 내용', 'ㅈㄱㄴ', sysdate);
INSERT INTO board_tbl VALUES(board_seq.nextval, '강회원', '하드코딩하는 사람들', '가입하면 좋음', sysdate);
INSERT INTO board_tbl VALUES(board_seq.nextval, '나회원', 'github를 사용합시다', '신세계', sysdate);
INSERT INTO board_tbl VALUES(board_seq.nextval, '문회원', '노는 게 제일좋아', '모두들 모여라', sysdate);
INSERT INTO board_tbl VALUES(board_seq.nextval, '지회원', '여름아', '부탁해', sysdate);
commit;

INSERT INTO comment_tbl VALUES (comment_seq.nextval, 1, '김회원', 'Lorem ipsum dolor sit amet', sysdate);
INSERT INTO comment_tbl VALUES (comment_seq.nextval, 3, '김회원', 'consectetur adipiscing elit', sysdate);
INSERT INTO comment_tbl VALUES (comment_seq.nextval, 5, '이회원', 'sed do eiusmod tempor', sysdate);
INSERT INTO comment_tbl VALUES (comment_seq.nextval, 7, '이회원', 'incididunt ut labore et', sysdate);
INSERT INTO comment_tbl VALUES (comment_seq.nextval, 9, '박회원', 'dolore magna aliqua', sysdate);
INSERT INTO comment_tbl VALUES (comment_seq.nextval, 2, '박회원', 'minim veniam, quis nostrud', sysdate);
INSERT INTO comment_tbl VALUES (comment_seq.nextval, 3, '강회원', 'exercitation ullamco laboris', sysdate);
INSERT INTO comment_tbl VALUES (comment_seq.nextval, 5, '나회원', 'nisi ut aliquip', sysdate);
INSERT INTO comment_tbl VALUES (comment_seq.nextval, 7, '문회원', 'ex ea commodo consequat', sysdate);
INSERT INTO comment_tbl VALUES (comment_seq.nextval, 2, '지회원', 'Duis aute irure dolor', sysdate);
commit;
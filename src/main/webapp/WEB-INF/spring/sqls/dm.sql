

CREATE SEQUENCE USER_NOSQ NOCACHE;

CREATE TABLE USER_INFO(
	USER_NO NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(500) UNIQUE,
	USER_PW VARCHAR2(500) NOT NULL,
	USER_NAME VARCHAR2(500) NOT NULL,
	USER_GENDER VARCHAR2(2) CHECK(USER_GENDER IN('F','M') ),
	USER_BIRTHDATE VARCHAR2(500) NOT NULL,
	USER_EMAIL VARCHAR2(200) UNIQUE,
	USER_PHONE VARCHAR2(20) NOT NULL,
	USER_ZIP VARCHAR2(20) NOT NULL,
	USER_ADDR VARCHAR2(1000),
	USER_ROLE VARCHAR2(50) NOT NULL,
	USER_CONCHK VARCHAR2(50)
);
CREATE SEQUENCE STADIUM_NOSQ NOCACHE;

CREATE TABLE STADIUM(
	STADIUM_NO NUMBER PRIMARY KEY,
	STADIUM_NAME VARCHAR2(500) NOT NULL,
	STADIUM_ADDR VARCHAR2(1000) NOT NULL,
	STADIUM_CONTENT VARCHAR2(4000) NOT NULL,
	STADIUM_WEBADDR VARCHAR2(1000),
	STADIUM_PHONENUM VARCHAR2(500)
);



CREATE SEQUENCE REVIEW_NOSQ NOCACHE;

CREATE TABLE REVIEW(
	REVIEW_NO NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(500) NOT NULL,
	REVIEW_REG DATE NOT NULL,
	REVIEW_TITLE VARCHAR2(500) NOT NULL,
	REVIEW_CONTENT VARCHAR2(4000) NOT NULL,
	STADIUM_NO NUMBER NOT NULL,
	CONSTRAINT FK_USER_ID1 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
		ON DELETE CASCADE,
	CONSTRAINT FK_STADIUM_NO1 FOREIGN KEY(STADIUM_NO) REFERENCES STADIUM(STADIUM_NO)
		ON DELETE CASCADE
);




CREATE TABLE STADIUM_PIC(
	STADIUM_NO NUMBER NOT NULL,
	PIC_NAME VARCHAR2(500) NOT NULL,
	PIC_PATH VARCHAR2(1000) NOT NULL,
	CONSTRAINT FK_STADIUM_NO2 FOREIGN KEY(STADIUM_NO) REFERENCES STADIUM(STADIUM_NO)
		ON DELETE CASCADE
);



CREATE SEQUENCE TEAM_NOSQ NOCACHE;

CREATE TABLE TEAM_INFO(
	USER_NO NUMBER NOT NULL,
	TEAM_NAME VARCHAR2(500) UNIQUE,
	TEAM_INTRO VARCHAR2(4000),
	TEAM_NO NUMBER PRIMARY KEY,
	TEAM_ADDCHK VARCHAR2(2) DEFAULT 'N' CHECK(TEAM_ADDCHK IN('Y','N') ),
	CONSTRAINT FK_USER_NO1 FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO)
		ON DELETE CASCADE
);



CREATE SEQUENCE TEAM_PIC_NOSQ NOCACHE;

CREATE TABLE TEAM_PIC(
	TEAM_NO NUMBER NOT NULL,
	PIC_NAME VARCHAR2(500) NOT NULL,
	PIC_PATH VARCHAR2(1000) NOT NULL,
	CONSTRAINT FK_TEAM_NO1 FOREIGN KEY(TEAM_NO) REFERENCES TEAM_INFO(TEAM_NO)
		ON DELETE CASCADE
);



CREATE SEQUENCE TMASK_NOSQ NOCACHE;
CREATE SEQUENCE TMASK_GPNOSQ NOCACHE;
CREATE SEQUENCE TMASK_GPSQ NOCACHE;

CREATE TABLE TEAM_ASK(
	TMASK_NO NUMBER PRIMARY KEY,
	TEAM_NO NUMBER NOT NULL,
	TMASK_TYPE VARCHAR2(100) NOT NULL,
	TMASK_GPNO NUMBER NOT NULL,
	TMASK_GPSQ NUMBER NOT NULL,
	USER_ID VARCHAR2(500) NOT NULL,
	TMASK_CONTENT VARCHAR2(4000) NOT NULL,
	TMASK_REG DATE NOT NULL,
	TMASK_STATUS VARCHAR2(2) DEFAULT 'N' CHECK(TMASK_STATUS IN('Y','N') ),
	CONSTRAINT FK_TEAM_NO2 FOREIGN KEY(TEAM_NO) REFERENCES TEAM_INFO(TEAM_NO)
		ON DELETE CASCADE,
	CONSTRAINT FK_USER_ID2 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
		ON DELETE CASCADE
);



CREATE TABLE MERCENARY_INFO(
	USER_NO NUMBER NOT NULL,
	MERCENARY_INTRO VARCHAR2(4000),
	MERCENARY_FOOT VARCHAR2(2) DEFAULT 'R' CHECK(MERCENARY_FOOT IN('L','R','A') ),
	MERCENARY_RATE NUMBER(2,2),
	MERCENARY_POSITION VARCHAR2(100) NOT NULL,
	CONSTRAINT FK_USER_NO2 FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO)
		ON DELETE CASCADE
);




CREATE SEQUENCE GAME_NOSQ NOCACHE;

CREATE TABLE GAME(
	GAME_NO NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(500) NOT NULL,
	GAME_REGION VARCHAR2(100) NOT NULL,
	GAME_STADIUM VARCHAR2(500) NOT NULL,
	GAME_ADDR VARCHAR2(500) NOT NULL,
	GAME_DATE DATE NOT NULL,
	GAME_TIME VARCHAR2(100) NOT NULL,
	GAME_PEOPLE NUMBER NOT NULL,
	GAME_MERCENARY NUMBER DEFAULT 0,
	GAME_CONTENT VARCHAR2(4000),
	GAME_TYPE VARCHAR2(2) DEFAULT 'N' CHECK(GAME_TYPE IN('N','Y') ),
	CONSTRAINT FK_USER_ID4 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
		ON DELETE CASCADE
);




CREATE SEQUENCE ASK_NOSQ NOCACHE;
CREATE SEQUENCE ASK_GPNOSQ NOCACHE;
CREATE SEQUENCE ASK_GPSQ NOCACHE;

CREATE TABLE GAME_ASK(
	ASK_NO NUMBER PRIMARY KEY,
	GAME_NO NUMBER NOT NULL,
	ASK_TYPE VARCHAR2(100) NOT NULL,
	ASK_GPNO NUMBER NOT NULL,
	ASK_GPSQ NUMBER NOT NULL,
	USER_ID VARCHAR2(500) NOT NULL,
	ASK_CONTENT VARCHAR2(4000),
	ASK_REG DATE NOT NULL,
	ASK_STATUS VARCHAR2(2) DEFAULT 'N' CHECK(ASK_STATUS IN('N','Y') ),
	CONSTRAINT FK_USER_ID4 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
		ON DELETE CASCADE,
	CONSTRAINT FK_GAME_NO1 FOREIGN KEY(GAME_NO) REFERENCES GAME(GAME_NO)
		ON DELETE CASCADE	
);



CREATE TABLE GAME_PIC(
	GAME_NO NUMBER NOT NULL,
	PIC_NAME VARCHAR2(500) NOT NULL,
	PIC_PATH VARCHAR2(1000) NOT NULL,
	CONSTRAINT FK_GAME_NO2 FOREIGN KEY(GAME_NO) REFERENCES GAME(GAME_NO)
		ON DELETE CASCADE
);



CREATE SEQUENCE QNA_NOSQ NOCACHE;
CREATE SEQUENCE QNA_GPNOSQ NOCACHE;
CREATE SEQUENCE QNA_GPSQ NOCACHE;

CREATE TABLE QNA(
	QNA_NO NUMBER PRIMARY KEY,
	QNA_GPNO NUMBER NOT NULL,
	QNA_GPSQ NUMBER NOT NULL,
	QNA_TITLE VARCHAR2(2000) NOT NULL,
	QNA_CONTENT VARCHAR2(4000) NOT NULL,
	USER_ID VARCHAR2(500) NOT NULL,
	QNA_REG DATE NOT NULL,
	QNA_TYPE VARCHAR2(100) NOT NULL,
	CONSTRAINT FK_USER_ID5 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
		ON DELETE CASCADE
);



CREATE SEQUENCE FAQ_NOSQ NOCACHE;
CREATE SEQUENCE FAQ_GPNOSQ NOCACHE;
CREATE SEQUENCE FAQ_GPSQ NOCACHE;

CREATE TABLE FAQ(
	FAQ_NO NUMBER PRIMARY KEY,
	FAQ_GPNO NUMBER NOT NULL,
	FAQ_GPSQ NUMBER NOT NULL,
	FAQ_TITLE VARCHAR2(2000) NOT NULL,
	FAQ_CONTENT VARCHAR2(4000) NOT NULL,
	USER_ID VARCHAR2(500) NOT NULL,
	FAQ_REG DATE NOT NULL,
	FAQ_TYPE VARCHAR2(100) NOT NULL,
	CONSTRAINT FK_USER_ID6 FOREIGN KEY(USER_ID) REFERENCES USER_INFO(USER_ID)
		ON DELETE CASCADE
);

CREATE TABLE GAME_APPLY(
	GAME_NO NUMBER NOT NULL,
	USER_NO NUMBER NOT NULL,
	CONSTRAINT FK_GAME_NO4 FOREIGN KEY(GAME_NO) REFERENCES GAME(GAME_NO)
		ON DELETE CASCADE,
	CONSTRAINT FK_USER_NO4 FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO)
		ON DELETE CASCADE
);

CREATE TABLE TEAM_APPLY(
	TEAM_NO NUMBER NOT NULL,
	USER_NO NUMBER NOT NULL,
	CONSTRAINT FK_TEAM_NO4 FOREIGN KEY(TEAM_NO) REFERENCES TEAM_INFO(TEAM_NO)
		ON DELETE CASCADE,
	CONSTRAINT FK_USER_NO4 FOREIGN KEY(USER_NO) REFERENCES USER_INFO(USER_NO)
		ON DELETE CASCADE
);

DROP TABLE TEAM_APPLY;

DROP TABLE GAME_APPLY;

DROP TABLE FAQ;
DROP SEQUENCE FAQ_NOSQ;
DROP SEQUENCE FAQ_GPNOSQ;
DROP SEQUENCE FAQ_GPSQ;

DROP TABLE QNA;
DROP SEQUENCE QNA_NOSQ;
DROP SEQUENCE QNA_GPNOSQ;
DROP SEQUENCE QNA_GPSQ;

DROP TABLE GAME_PIC;

DROP TABLE GAME_ASK;
DROP SEQUENCE ASK_NOSQ;
DROP SEQUENCE ASK_GPNOSQ;
DROP SEQUENCE ASK_GPSQ;

DROP TABLE GAME;
DROP SEQUENCE GAME_NOSQ;

DROP TABLE MERCENARY_INFO;

DROP TABLE TEAM_ASK;
DROP SEQUENCE TMASK_NOSQ;
DROP SEQUENCE TMASK_GPNOSQ;
DROP SEQUENCE TMASK_GPSQ;

DROP TABLE TEAM_PIC;
DROP SEQUENCE TEAM_PIC_NOSQ;

DROP TABLE TEAM_INFO;
DROP SEQUENCE TEAM_NOSQ;

DROP TABLE REVIEW;
DROP SEQUENCE REVIEW_NOSQ;

DROP TABLE STADIUM_PIC;

DROP TABLE STADIUM;
DROP SEQUENCE STADIUM_NOSQ;

DROP TABLE USER_INFO;
DROP SEQUENCE USER_NOSQ;


SELECT * FROM USER_INFO;

SELECT * FROM TEAM_INFO;

SELECT * FROM TEAM_PIC;

SELECT * FROM MERCENARY_INFO;

SELECT * FROM STADIUM;

UPDATE USER_INFO
		SET USER_ROLE='ADMIN'
		WHERE USER_NO=1

SELECT t.TEAM_NO, t.USER_NO, p.PIC_PATH, t.TEAM_NAME, t.TEAM_INTRO, t.TEAM_ADDCHK
		FROM TEAM_INFO t 
		LEFT JOIN TEAM_PIC p ON t.TEAM_NO = p.TEAM_NO
		ORDER BY TEAM_NO DESC

INSERT INTO TEAM_INFO
VALUES(1,'테스트팀1','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀2','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀4','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀4','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀5','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀6','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀7','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀8','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀9','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀10','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀11','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀12','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀14','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀14','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀15','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀16','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀17','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀18','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀19','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀20','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀21','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀22','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀24','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀24','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀25','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀26','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀27','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀28','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀29','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀40','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀41','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀42','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀44','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀44','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀45','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀46','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀47','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀48','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀49','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀40','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀41','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀42','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀44','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀44','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀45','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀46','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀47','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀48','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀49','1',TEAM_NOSQ.NEXTVAL,'N')
INSERT INTO TEAM_INFO
VALUES(1,'테스트팀50','1',TEAM_NOSQ.NEXTVAL,'N')
/*QNA 문의 더미데이터*/
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트1','테스트1', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트2','테스트2', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트3','테스트3', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트4','테스트4', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트5','테스트5', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트6','테스트6', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트7','테스트7', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트8','테스트8', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트9','테스트9', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '테스트10','테스트10', 'user1', SYSDATE, '일반문의')

INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '백신 미접종자 참여가 가능한가요?','백신 미접종자 참여가 가능한가요?', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '1차 접종했는데 매치 참여가 안돼요.','1차 접종했는데 매치 참여가 안돼요.', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '[공지] 백신 접종 정보 갱신하기',
'코로나19 백신 2차 접종을 마쳤나요? 아래 링크에서 백신 접종 정보를 입력하거나 수정할 수 있습니다. 접종 완료 경과일을 충족하면 접종 완료자로 바뀝니다.
https://plabfootball.com/vaccine/

매치가 열리는 구장에서 매니저가 COOV 앱으로 정보를 확인합니다. 제출한 정보가 사실과 다르면 경기를 뛸 수 없을 뿐 아니라, 참가비도 돌려받지 못하는 점 꼭 확인해 주세요.

11월 1일부터 시행하는 단계적 일상회복 지침에 따라 접종 미완료자는 10~12명까지 선착순 참여할 수 있습니다. *백신 접종 완료자에 대한 제한은 없습니다.

*백신 접종 완료자: 코로나19 백신을 2차 접종하고 14일 경과한 사람(얀센은 1차).
ex) 11월 1일 2차 접종 완료한 사람은 14일째 되는 날이 11월 15일입니다. 접종 완료자로서 매치 신청은 11월 16일 0시부터 가능합니다.', 'user', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '회원 탈퇴를 하고 싶어요','회원 탈퇴를 하고 싶어요', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '스트리트 풋살 매니저 사이트는 뭔하는 사이트 인가요?','스트리트 풋살 매니저 사이트는 뭔하는 사이트 인가요?', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '여러 명 신청이 가능한가요?','여러 명 신청이 가능한가요?', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '[공지]단계적 일상 회복을 위한 새로운 방침이 11.1(월)부터 적용됩니다',
'단계적 일상 회복을 위한 새로운 방침이 11.1(월)부터 적용됩니다

안녕하세요 풋볼그라운드입니다.
10.29(금) 정부가 단계적 일상 회복을 위한 새로운 방침을 발표하였습니다.
따라서 11.1(월)부터 소셜 매치가 아래와 같이 적용될 예정입니다.

 

수도권(실외 체육시설)
: 경기장 내 최대 15명까지 입장이 가능하며 백신 접종 미완료자의 경우 최대 10명까지 참가 가능합니다
(경기장 상황에 따라 달라질 수 있습니다)

 

[백신 접종 완료자]
백신 접종 완료 후 14일 경과
화이자, 모더나, 아스트라제네카 백신의 경우 2차까지 접종 후 14일 경과
얀센 백신의 경우 1차 접종 후 14일 경과
백신 접종 완료자의 경우 모든 소셜 매치에 참가가 가능합니다.', 'user', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '아이디를 까먹었습니다 어디서 찾을 수 있나요?','아이디를 까먹었습니다 어디서 찾을 수 있나요?', 'user1', SYSDATE, '일반문의')
INSERT INTO QNA
VALUES(QNA_NOSQ.NEXTVAL, QNA_GPNOSQ.NEXTVAL, 1, '비밀번호를 까먹었습니다 어디서 찾을 수 있나요?','비밀번호를 까먹었습니다 어디서 찾을 수 있나요?', 'user1', SYSDATE, '일반문의')



SELECT * FROM QNA;









DROP TABLE UserInfo CASCADE CONSTRAINTS;
DROP TABLE Community CASCADE CONSTRAINTS;
DROP SEQUENCE commId_seq;

CREATE TABLE UserInfo ( 
	userId      VARCHAR2(12)	PRIMARY KEY, 
	password	VARCHAR2(12)	NOT NULL,
	name		VARCHAR2(20)	NOT NULL,
	email		VARCHAR2(50),	
 	phone		VARCHAR2(20),
 	commId		NUMBER(4)
);

CREATE TABLE Community ( 
	cId     	NUMBER(4)		PRIMARY KEY, 
	cName		VARCHAR2(20)	NOT NULL,
	descr		VARCHAR2(50),
	startDate	Date,
	chairId		VARCHAR2(12)	
);

ALTER TABLE UserInfo ADD FOREIGN KEY (commId) REFERENCES Community (cId);
ALTER TABLE Community ADD FOREIGN KEY (chairId) REFERENCES UserInfo (userId);

CREATE SEQUENCE commId_seq
	START WITH 10
	INCREMENT BY 10; 
	
INSERT INTO UserInfo VALUES ('admin', 'admin', '�ý��� ������', 'admin@dongduk.ac.kr', '02-940-9999', null);
INSERT INTO UserInfo VALUES ('movieMan', 'movie', '�迵ȭ', 'young99@gmail.com', '010-1234-5678', null);
INSERT INTO UserInfo VALUES ('btsFan', 'bts', '�̹�ź', 'bangtan01@naver.com', '010-5323-7788', null);

INSERT INTO Community VALUES (commId_seq.NEXTVAL, 'Cinema Paradiso', '��ȭ ���� ���Ƹ�', SYSDATE, 'movieMan');
INSERT INTO Community VALUES (commId_seq.NEXTVAL, 'A.R.M.Y', 'BTS ��Ŭ��', SYSDATE, null);
INSERT INTO Community VALUES (commId_seq.NEXTVAL, 'Aero Bike', '��� ������ ��ȣȸ', SYSDATE, null);



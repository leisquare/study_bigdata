 --���
DROP TABLE STUDENT;
DROP TABLE MAJOR;
 --ũ������Ʈ
 CREATE TABLE MAJOR (
 mNO NUMBER(2) PRIMARY KEY,
 mNAME VARCHAR(50)
 );
 
 DROP SEQUENCE STUDENT_SEQ;
 CREATE SEQUENCE STUDENT_SEQ MAXVALUE 999 NOCACHE NOCYCLE;
 
 CREATE TABLE STUDENT(
 sNO VARCHAR(7) PRIMARY KEY,
 sNAME VARCHAR(50),
 mNO NUMBER(2) REFERENCES MAJOR(mNO),
 SCORE NUMBER (3) DEFAULT 0 CHECK(SCORE BETWEEN 0 AND 100),
 sEXPEL NUMBER(1) DEFAULT 0 CHECK(sEXPEL BETWEEN 0 AND 1)
 );


INSERT INTO MAJOR VALUES (1, '��������');
INSERT INTO MAJOR VALUES (2, '�濵������');
INSERT INTO MAJOR VALUES (3, '��ǻ�Ͱ���');
INSERT INTO MAJOR VALUES (4, '����Ʈ����');
INSERT INTO MAJOR VALUES (5, '�ΰ�������');	

SELECT * FROM MAJOR;
SELECT * FROM STUDENT;

--�й������ ����
SELECT TO_CHAR(SYSDATE, 'YYYY')||
    TRIM(TO_CHAR(STUDENT_SEQ.NEXTVAL,'000'))
    FROM DUAL;

-- 1�� �л� �Է�
INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES
    (TO_CHAR(SYSDATE, 'YYYY')
    ||TRIM(TO_CHAR(STUDENT_SEQ.NEXTVAL,'000')),
    '���켺',(SELECT mNO FROM MAJOR WHERE mNAME='��������'), 90) ;


INSERT INTO STUDENT VALUES(TO_CHAR(SYSDATE, 'YYYY')||
    TRIM(TO_CHAR(STUDENT_SEQ.NEXTVAL,'000')), '���켺', 1,90,0);
INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, '�ڼ���', 1,80,0);
INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, '�����', 3,20,0);
INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, 'ȫ�浿', 4,95,0);
INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, '������', 5,100,0);
INSERT INTO STUDENT VALUES(STUDENT_SEQ.NEXTVAL, 'ȫö��', 4,20,1);


--2�� ���ϴ� �а� �̸� �Է�
SELECT mNO FROM MAJOR WHERE mNAME = '��������'; --��������

SELECT ROWNUM RANK, sNAME||'('||sNO||')' sNAME, mNAME, SCORE
    FROM (SELECT * FROM MAJOR M, STUDENT S 
            WHERE M.mNO=S.mNO AND mNAME = '��������')
    ORDER BY SCORE DESC;
    
    
--3�� ���������� ���� ��ü �л�, ���� ���� �� ���
SELECT ROWNUM||'��', S.sNAME||'('||sNO||')', M.mNAME, S.SCORE FROM MAJOR M, STUDENT S 
    WHERE M.mNO=S.mNO AND sEXPEL!=1
    ORDER BY SCORE DESC; --���� �� �ȵ��� TOP-N üũ�ϱ�
    
    SELECT ROWNUM RANK, sNAME||'('||sNO||')' sNAME, mNAME, SCORE
    FROM (SELECT * FROM STUDENT S , MAJOR M WHERE S.mNO= M.mNO AND sEXPEL=0
       ORDER BY SCORE DESC);
    
    
    
--4�� �������� �л��� ��ȸ. ���� ���� ������ ���
SELECT ROWNUM||'��', S.sNAME||'('||sNO||')', M.mNAME, S.SCORE 
    FROM MAJOR M, STUDENT S 
    WHERE M.mNO=S.mNO AND sEXPEL=1
    ORDER BY SCORE DESC;
    
SELECT ROWNUM RANK, S.sNAME||'('||sNO||')', M.mNAME, S.SCORE 
    FROM MAJOR M, STUDENT S 
    WHERE M.mNO=S.mNO AND sEXPEL=1
    ORDER BY SCORE DESC;
commit;
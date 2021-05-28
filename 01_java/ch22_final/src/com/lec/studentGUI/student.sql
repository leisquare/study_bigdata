--DROP ���� ������ �״�� ����
DROP TABLE STUDENT;
DROP TABLE MAJOR;
--CREATE TABLE
CREATE TABLE MAJOR (
mNO NUMBER(2) PRIMARY KEY,
mNAME VARCHAR(50)
);

CREATE TABLE STUDENT(
sNO VARCHAR(7) PRIMARY KEY,
sNAME VARCHAR(50),
mNO NUMBER(2) REFERENCES MAJOR(mNO),
SCORE NUMBER (3) DEFAULT 0 CHECK(SCORE BETWEEN 0 AND 100),
sEXPEL NUMBER(1) DEFAULT 0 CHECK(sEXPEL BETWEEN 0 AND 1)
);
 
--CREATE SEQUENCE
DROP SEQUENCE STUDENT_SEQ;
CREATE SEQUENCE STUDENT_SEQ MAXVALUE 999 NOCACHE NOCYCLE;
 

--�а��Է�
INSERT INTO MAJOR VALUES (1, '��������');
INSERT INTO MAJOR VALUES (2, '�濵������');
INSERT INTO MAJOR VALUES (3, '��ǻ�Ͱ���');
INSERT INTO MAJOR VALUES (4, '����Ʈ����');
INSERT INTO MAJOR VALUES (5, '�ΰ�������');	

--SELECT * FROM MAJOR;
--SELECT * FROM STUDENT;

-- SwingStudentMng���� �ʿ��� Query
-- 0. ùȭ�鿡 �����̸��� �޺��ڽ��� �߰�(mName) : DAO���� public Vector<String> getMNamelist()
SELECT MNAME FROM MAJOR;

-- 1. �й��˻� (sNo, sName, mName, score) : DAO���� public StudentSwingDto sNogetStudent(String sNo)
SELECT SNO,SNAME,MNAME,SCORE 
    FROM MAJOR M,STUDENT S 
    WHERE M.MNO=S.MNO AND SNO='2021001';

-- 2. �̸��˻� (sNo, sName, mName, score)  : DAO���� public ArrayList<StudentSwingDto> sNamegetStudent(String sName)
SELECT SNO,SNAME,MNAME,SCORE 
    FROM MAJOR M,STUDENT S 
    WHERE M.MNO=S.MNO AND SNAME='�����';

-- 3. �����˻� (rank, sName(sNo����), mName(mNo����), score) : DAO���� public ArrayList<StudentSwingDto> mNamegetStudent(String mName)
--- ��� : 1 ���켺(2021001) ��������(1) 90 
SELECT ROWNUM RANK, SNAME||'('||SNO||')' AS STUDENT, MNAME||'('||S.MNO||')' AS MAJOR , SCORE 
    FROM MAJOR M,STUDENT S 
    WHERE M.MNO=S.MNO AND MNAME='��������';

-- 4. �л��Է� : DAO���� public int insertStudent(String sName, String mName, int score)
--              DAO���� public int insertStudent(StudentSwingDto dto)
INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES
    (TO_CHAR(SYSDATE, 'YYYY')
    ||TRIM(TO_CHAR(STUDENT_SEQ.NEXTVAL,'000')),
    '���켺',(SELECT mNO FROM MAJOR WHERE mNAME='��������'), 90) ;
INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES
    (TO_CHAR(SYSDATE, 'YYYY')
    ||TRIM(TO_CHAR(STUDENT_SEQ.NEXTVAL,'000')),
    '�ڼ���',(SELECT mNO FROM MAJOR WHERE mNAME='��������'), 80) ;
INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES
    (TO_CHAR(SYSDATE, 'YYYY')
    ||TRIM(TO_CHAR(STUDENT_SEQ.NEXTVAL,'000')),
    '�����',(SELECT mNO FROM MAJOR WHERE mNAME='��ǻ�Ͱ���'), 20) ;
INSERT INTO STUDENT VALUES
    (TO_CHAR(SYSDATE, 'YYYY')
    ||TRIM(TO_CHAR(STUDENT_SEQ.NEXTVAL,'000')),
    '������',(SELECT mNO FROM MAJOR WHERE mNAME='��ǻ�Ͱ���'), 10, 1) ;
INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES
    (TO_CHAR(SYSDATE, 'YYYY')
    ||TRIM(TO_CHAR(STUDENT_SEQ.NEXTVAL,'000')),
    'ȫ�浿',(SELECT mNO FROM MAJOR WHERE mNAME='��ǻ�Ͱ���'), 99) ;
INSERT INTO STUDENT (sNO, sNAME, mNO, SCORE) VALUES
    (TO_CHAR(SYSDATE, 'YYYY')
    ||TRIM(TO_CHAR(STUDENT_SEQ.NEXTVAL,'000')),
    '�ֹ���',(SELECT mNO FROM MAJOR WHERE mNAME='�ΰ�������'), 85) ;

-- 5. �л����� : DAO���� public int updateStudent(String sNo, String sName, String mName, int score)
--              DAO���� public int updateStudent(StudentSwingDto dto)
UPDATE STUDENT SET SCORE='90' WHERE SNO=2021001 AND SNAME='���켺';

-- 6. �л���� (rank, sName(sNo����), mName(mNo����), score) : DAO���� public ArrayList<StudentSwingDto> getStudents()
-- ��� : 1 ���켺(2021001) ��������(1) 90
 SELECT ROWNUM RANK, sNAME||'('||sNO||')' STUDENT, mNAME||'('||MNO||')' MAJOR, SCORE
    FROM (SELECT SNO, SNAME,S.MNO MNO,SCORE,SEXPEL,MNAME FROM STUDENT S , MAJOR M WHERE S.mNO= M.mNO AND sEXPEL=0
       ORDER BY SCORE DESC);

-- 7. ���������  (rank, sName(sNo����), mName(mNo����), score) : DAO���� public ArrayList<StudentSwingDto> getStudentsExpel()
-- ��� : 1 ������(2021004) ��ǻ�Ͱ���(3) 10
 SELECT ROWNUM RANK, sNAME||'('||sNO||')' STUDENT, mNAME||'('||MNO||')' MAJOR, SCORE
    FROM (SELECT SNO, SNAME,S.MNO MNO,SCORE,SEXPEL,MNAME FROM STUDENT S , MAJOR M WHERE S.mNO= M.mNO AND sEXPEL=1
       ORDER BY SCORE DESC);

-- 8. ����ó�� : DAO���� public int sNoExpel(String sNo)
UPDATE STUDENT SET sEXPEL=1 WHERE SNO='2021005';
UPDATE STUDENT SET sEXPEL=0 WHERE SNO='2021001';

commit;
--(4) ����ȯ�Լ�
--TO_CHAR(��¥, ����); ��¥���� ���Ͽ� �°� ���ڷ� ����ȯ
    --YY(����) MM(��) MON(���̸�) DD(��) DY(����)
    --HH24 (0~23 �ð����) AM(��������) HH(0~11��) MI(��) SS(��)
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY"��"-MM"��"-DD"��"DY"����"')FROM EMP;

SELECT TO_CHAR(SYSDATE,'YY"��" MON DD"��" AM HH"��" MI"��" SS"��"') FROM DUAL;
--TO_CHAR(����, ����); ���ڰ��� ���Ͽ� �°� ���ڷ� ����ȯ
    --���� �� 0: �ڸ���. �ڸ����� ���� ������ 0���� ä��
    --���� �� 9: �ڸ���. �ڸ����� ���� ������ ä���� ����(�ڹٿ����� #)(�ڸ��� ��ġ�� ������)
    --���� �� $: ��ȭ ���� $�� ���� �տ� ����.
    --���� �� L: ������ȭ������ ���� �տ� ����.
SELECT ENAME, TO_CHAR(SAL, 'L999,999') FROM EMP;
SELECT ENAME, TO_CHAR(SAL, '$999,999') FROM EMP;
SELECT ENAME, TO_CHAR(SAL, '$000,000') FROM EMP;

--TO_DATE(����, ����); '81/01/01' ���ڸ� ���Ͽ� �°� ��¥������ ��ȯ.
--81/5/1~83/5/1 ���̿� �Ի��� ���� ���
SELECT * FROM EMP WHERE HIREDATE BETWEEN '81/05/01' AND '83/05/01';
SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('19810501','YYYYMMDD') AND TO_DATE('19830501','YYYYMMDD');
--2020�� 11�� 30�Ϻ��� ������� ��¥���� ���. (SYSTEM�� ��¥�� ������ �𸥴�)
SELECT TRUNC(SYSDATE-TO_DATE('20201130','YYYYMMDD')) FROM  DUAL;
SELECT CEIL(SYSDATE-TO_DATE('20201130','YYYYMMDD')) FROM  DUAL;
--TO_NUMBER(����, ����); ���ڸ� ���Ͽ� �°� ���������� ��ȯ.
SELECT TO_NUMBER('1,000','9,999') FROM DUAL;
SELECT TO_NUMBER('1,000','9,999')*1.1 FROM DUAL;


--(5) NULL �����Լ� ; NVL(���ϼ��� �ִ� ������, ���� ��� ����� ��). �Ű����� 2���� Ÿ���� ��ġ�� ��. 
--����̸�, ���� ����� �̸�(���� ��簡 ������ CEO�� ���)
SELECT E.ENAME, NVL(D.ENAME,'CEO') FROM EMP E, EMP D WHERE E.MGR=D.EMPNO(+);

--����̸�, ���� ����� ���(���ӻ�簡 ������ CEO�� ���)
SELECT E.ENAME, NVL(TO_CHAR(E.MGR),'CEO') ����� FROM EMP E, EMP D WHERE E.MGR=D.EMPNO(+);

--(6) DECODE (������, ��1, ��� 1, ��2, ��� 2, ..., ��N, ��� N, �׿ܰ��)
--�̸�, �μ���ȣ, �μ��̸�
SELECT ENAME, D.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO;
SELECT ENAME, DEPTNO, DECODE (DEPTNO, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATION','ETC1')AS DNAME FROM EMP;
SELECT ENAME, DEPTNO, 
    CASE WHEN DEPTNO = 10 THEN 'ACCOUNTING'
         WHEN DEPTNO = 20 THEN 'RESEARCH'
         WHEN DEPTNO = 30 THEN 'SALES' 
         WHEN DEPTNO = 40 THEN 'OPERATION' ELSE 'ETC1'
         END AS "DNAME"
         FROM EMP;
         
SELECT ENAME, DEPTNO, 
    CASE DEPTNO WHEN 10 THEN 'ACCOUNTING'
                WHEN 20 THEN 'RESEARCH'
                WHEN 30 THEN 'SALES'
                WHEN 40 THEN 'OPERATION' ELSE 'ETC1'
                END AS "DNAME"
                FROM EMP;

--�̸�, �޿�, �λ����޿�
    --JOB�� ���� 'ANALYST' 10% �λ�, 'MANAGER'�� 20% �λ�, PRESIDENT�� 30% �λ�, SALESMAN�̸� 40% �λ�
SELECT DISTINCT JOB FROM EMP;
SELECT ENAME, SAL, DECODE(JOB, 'ANALYST', SAL*1.1, 'MANAGER', SAL*1.2, 'PRESIDENT', SAL*1.3, 'SALESMAN', SAL*1.4,SAL)AS �λ�޿� FROM EMP;

SELECT ENAME, SAL ���޿�,
    CASE WHEN JOB = 'ANALYST' THEN SAL*1.1
         WHEN JOB = 'MANAGER' THEN SAL*1.2
         WHEN JOB = 'PRESIDENT' THEN SAL*1.3
         WHEN JOB = 'SALESMAN' THEN SAL*1.4
         ELSE SAL
         END AS �λ�޿�
         FROM EMP;

--(7) �� �� EXTRACT, ������ ���
SELECT EXTRACT(YEAR FROM HIREDATE) YEAR FROM EMP; 
SELECT TO_CHAR(HIREDATE,'YYYY') YEAR FROM EMP;
SELECT EXTRACT(MONTH FROM HIREDATE) MONTH FROM EMP;
SELECT TO_CHAR(HIREDATE,'MM')MONTH FROM EMP;

-- LEVEL, START WITH(�ֻ��������� ����),CONNECT BY PRIOR(������ ��������)
SELECT LEVEL, LPAD(' ',LEVEL*2)||ENAME, MGR FROM EMP
    START WITH MGR IS NULL
    CONNECT BY PRIOR EMPNO=MGR;


-- <�� ��������>
-- 1. ���� ��¥�� ����ϰ� TITLE�� ��Current Date���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT TO_CHAR(SYSDATE, 'YYYY"��"-MM"��"-DD"��" DY"����"')AS "Current date" FROM DUAL;

-- 2. EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� ����Ͽ�,
-- �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase)�� ����ϴ� SELECT ����
SELECT EMPNO, ENAME, JOB, SAL, SAL*1.15 "NEW Salary", SAL*1.15-SAL "������" FROM EMP;

--3. �̸�, �Ի���, �Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6),'��') FROM EMP;

--4. �̸�, �Ի���, �Ի��Ϸκ��� ��������� ������, �޿�, �Ի��Ϻ��� ��������� ���� �޿��� �Ѱ踦 ���
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) �ٹ�������, SAL, SAL*TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) �޿��Ѱ�  FROM EMP;

--5. ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ���
SELECT ENAME, LPAD(SAL,15,'*') FROM EMP;

--6. ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE, TO_CHAR(HIREDATE,'DY') �Ի���� FROM EMP;

--7. �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ���
SELECT ENAME, LENGTH(ENAME), JOB FROM EMP WHERE LENGTH(ENAME)>=6;

--8. ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ���
SELECT ENAME, JOB, SAL, TO_NUMBER(NVL(COMM,0)) "���ʽ�", SAL+TO_NUMBER(NVL(COMM,0)) "�޿�+���ʽ�" FROM EMP;

-- 9.��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT SUBSTR(ENAME,2,3) FROM EMP;

--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ�. 
--  �ý��ۿ� ���� DATEFORMAT �ٸ� �� �����Ƿ� �Ʒ��� ����� �˾ƺ���
SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE, 'MM')=12;

--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
--EMPNO		ENAME		�޿�
--7369		       SMITH		*******800
--7499		       ALLEN		******1600
--7521		       WARD		******1250
--����. 
SELECT EMPNO, ENAME, LPAD(SAL,10,'*') �޿� FROM EMP;

-- 12. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ�
-- EMPNO	 ENAME 	�Ի���
-- 7369	  SMITH		1980-12-17
-- ��.
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD') �Ի��� FROM EMP;

--13. ��� ���̺��� �μ� ��ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�.
    --(�޿��� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����Ѵ�)
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL,'$999,999') FROM EMP WHERE DEPTNO = 20;

-- 14. ��� ���̺��� �޿��� ���� ���, �̸�, �޿�, ����� �˻��ϴ� SQL ������ �ۼ� �Ͻ� ��.
-- �޿��� 0~1000 E / 1001~2000 D / 2001~3000 C / 3001~4000 B / 4001~5000 A
SELECT EMPNO, ENAME, SAL,
    CASE WHEN SAL BETWEEN 0 AND 1000 THEN 'E'
         WHEN SAL BETWEEN 1001 AND 2000 THEN 'D'
         WHEN SAL BETWEEN 2001 AND 3000 THEN 'C'
         WHEN SAL BETWEEN 3001 AND 4000 THEN 'B'
         WHEN SAL BETWEEN 4001 AND 5000 THEN 'A'
         ELSE 'ETC'
         END 
         FROM EMP;

-- **** �߻��� ��ƴ�
SELECT EMPNO, ENAME,SAL,DECODE(TRUNC((SAL-1)/1000),0,'E',1,'D',2,'C',3,'B',4,'A') ��� FROM EMP;


--SELECT EMPNO, ENAME,SAL,
--    DECODE (TRUNC(SAL/1000)=0, 'E', TRUNC((SAL-1)/1000)=1, D, TRUNC((SAL-1)/1000)=2, C, TRUNC((SAL-1)/1000)=3,B,TRUNC((SAL-1)/1000)=4,A) FROM EMP;

SELECT ENAME, TRUNC((SAL-1)/1000) FROM EMP;

--SELECT EMPNO, ENAME,SAL,
--   DECODE (SAL, TRUNC((SAL-1)/1000)=0, 'E', TRUNC((SAL-1)/1000)=1, D, TRUNC((SAL-1)/1000)=2, C, TRUNC((SAL-1)/1000)=3,B,TRUNC((SAL-1)/1000)=4,A) FROM EMP;

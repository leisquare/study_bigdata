--[VI] SUB QUERY ; QUERY �ȿ� QUERY�� ����

-- �� 1. ���������� ����

--�������� (1) �����༭������(�������� ����� ������) =, >, >=, <, <=, <>
--        (2) �����༭������(�������� ����� 2���̻�) IN ANY ALL ��SOME ALL EXISTS���
--SCOTT�� �ٹ��ϴ� �μ��̸� ���
SELECT DNAME FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND ENAME='SCOTT';

SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';  --��������  
SELECT DNAME FROM DEPT 
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT'); --��������
--JOB�� 'MANAGER'�� ����� �μ��̸�
SELECT DEPTNO FROM EMP WHERE JOB ='MANAGER'; --�����༭������
SELECT DNAME FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB ='MANAGER'); --��������. �������� ���� =�� �ƴ� IN�� �����

-- �� 2. ������ ��������
--ȸ�翡�� �޿��� ���� ���� �޴� ����� �̸��� �޿�
SELECT MAX(SAL) FROM EMP; --��������(������, ���Ͽ�)
SELECT ENAME FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP); --��������

--SCOTT�� ���� �μ���ȣ�� ����̸�
SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';
SELECT ENAME FROM EMP WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT')AND ENAME<>'SCOTT';

--SCOTT�� ���� �ٹ����� ����̸�(50�� DZLLAS�μ� ȫ�浿�� ��� �߰��Է���)
--INSERT INTO DEPT VALUES (50,'IT','DALLAS');
--INSERT INTO EMP(EMPNO, ENAME,DEPTNO) VALUES (9999, 'ȫ', 50);

SELECT LOC FROM EMP E, DEPT D WHERE E. DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';

SELECT ENAME FROM EMP E, DEPT D
    WHERE E. DEPTNO=D.DEPTNO AND LOC =(SELECT LOC 
    FROM EMP E, DEPT D 
    WHERE E. DEPTNO=D.DEPTNO AND ENAME = 'SCOTT')AND ENAME<>'SCOTT';

--źź������
--SCOTT�� ���� �μ����� �ٹ��ϴ� ������� �޿� ��
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT';
SELECT SUM(SAL) FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');

--SCOTT�� ������ JOB�� ���� ����� ��� ������ ���
SELECT * FROM EMP
    WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'SCOTT');
    
--DALLAS���� �ٹ��ϴ� ����� �̸�, �μ���ȣ�� ���
ROLLBACK; --DML��ɾ ���

SELECT ENAME, DEPTNO FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');

--SALES �μ����� �ٹ��ϴ� ��� ����� �̸��� �޿��� ���

SELECT ENAME, SAL FROM EMP
    WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
    
-- 'KING'�� ���ӻ���� ����� �̸��� �޿��� ���
SELECT ENAME, SAL FROM EMP
    WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME ='KING');

-- ��ձ޿� ���Ϸ� �޴� ����� �̸�, �޿��� ���
SELECT ENAME, SAL FROM EMP
    WHERE SAL<=(SELECT AVG(SAL) FROM EMP);
    
--SCOTT�� JOB�� �μ���ȣ�� ���� ������ ��� �ʵ� ���(���߿� ��������)
SELECT * FROM EMP 
WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='SCOTT')AND DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT') AND ENAME<>'SCOTT';

SELECT * FROM EMP 
WHERE (JOB,DEPTNO)=(SELECT JOB,DEPTNO FROM EMP WHERE ENAME='SCOTT')AND ENAME<>'SCOTT';

-- �� �� ��������
--1. ������̺��� ���� ���� �Ի��� ����� �̸�, �޿�, �Ի���
SELECT ENAME, SAL, HIREDATE FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP);

-- 2. ȸ�翡�� ���� �޿��� ���� ����� �̸�, �޿�
SELECT ENAME, SAL FROM EMP WHERE SAL=(SELECT MIN(SAL) FROM EMP);

-- 3. ȸ�� ��պ��� �޿��� ���� �޴� ����� �̸�, �޿�, �μ��ڵ�
SELECT ENAME, SAL, DEPTNO 
    FROM EMP 
    WHERE SAL>=(SELECT AVG(SAL) FROM EMP);

--4. ȸ�� ��� ������ �޿��� �޴� ����� �̸�, �޿�, �μ���
SELECT ENAME, SAL, DNAME 
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO AND SAL<=(SELECT AVG(SAL) FROM EMP);

--5. SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���
SELECT ENAME, SAL, HIREDATE, GRADE 
    FROM EMP E, SALGRADE S 
    WHERE SAL >=LOSAL AND SAL <=HISAL 
    AND HIREDATE<=(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT') AND ENAME<>'SCOTT';

--6. 5��(SCOTT���� ���� �Ի��� ����� �̸�, �޿�, �Ի���, �޿� ���)�� �μ��� �߰��ϰ� 
    --�޿��� ū �� ����
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME 
    FROM EMP E, SALGRADE S, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND SAL >=LOSAL AND SAL <=HISAL AND HIREDATE<=(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT') AND ENAME<>'SCOTT'
    ORDER BY SAL DESC;

--7. ������̺��� BLAKE ���� �޿��� ���� ������� ���, �̸�, �޿��� �˻�
SELECT DEPTNO, ENAME, SAL
    FROM EMP
    WHERE SAL>(SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');

--8. ������̺��� MILLER���� �ʰ� �Ի��� ����� ���, �̸�, �Ի����� �˻��Ͻÿ�
SELECT DEPTNO, ENAME, HIREDATE
    FROM EMP
    WHERE HIREDATE>(SELECT HIREDATE FROM EMP WHERE ENAME = 'MILLER');

--9. ������̺��� �����ü ��� �޿����� �޿��� ���� ������� ���, �̸�, �޿��� �˻�
SELECT DEPTNO, ENAME, SAL
    FROM EMP
    WHERE SAL>=(SELECT AVG(SAL) FROM EMP);

--10. ������̺��� CLARK�� ���� �μ���, ����� 7698�� ������ �޿����� 
        -- ���� �޿��� �޴� ������� ���, �̸�, �޿� �˻�
SELECT DEPTNO, ENAME, SAL
    FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME = 'CLARK')AND SAL>=(SELECT SAL FROM EMP WHERE EMPNO ='7698');

--11.  �����ȭ. ������̺��� CLARK�� ���� �μ����̸�, ����� 7698�� ������ �޿����� 
    --  ���� �޿��� �޴� ������� ���, �̸�, �޿� �˻�
 SELECT E.DEPTNO, ENAME, SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND DNAME=(SELECT DNAME FROM  EMP E, DEPT D WHERE  E.DEPTNO = D.DEPTNO AND ENAME = 'CLARK')AND SAL>=(SELECT SAL FROM EMP WHERE EMPNO ='7698');

--12.  ��� ���̺��� BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի����ڸ� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT ENAME, HIREDATE
    FROM EMP
    WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE')AND ENAME<>'BLAKE';

--13.  ��� ���̺��� ��� �޿� �̻��� �޴� ��� �������� ���ؼ� �����ȣ�� �̸��� ���
        --(�� �޿��� ���� ������ ����Ͽ���.)
SELECT DEPTNO, ENAME
    FROM EMP
    WHERE SAL>=(SELECT AVG(SAL) FROM EMP)
    ORDER BY SAL DESC;

-- ���⼭���ʹ� �����༭������, ������ �����༭������

--�� 3. ������ �������� : IN, ALL, ANY=SOME, EXISTS
-- (1) IN
-- �μ����� �Ի����� ���� ���� ����� �μ���ȣ, �̸�, �Ի��� ���
SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO; -- ��������
SELECT EMPNO, ENAME, HIREDATE FROM EMP
    WHERE (DEPTNO, HIREDATE) IN (SELECT DEPTNO, MAX(HIREDATE) FROM EMP GROUP BY DEPTNO);
    
--�޿� 3000�̻� �޴� ����� �Ҽӵ� �μ����� �ٹ��ϴ� ������� ��� ����
SELECT * FROM EMP
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE SAL>=3000);
--(2) ALL
-- 30�� �μ� ����� �� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� �����. 
--���������δ� �Ʒ��� ����.
SELECT * FROM EMP
    WHERE SAL>(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);

SELECT * FROM EMP
    WHERE SAL> ALL(SELECT SAL FROM EMP WHERE DEPTNO=30);

--(3) ANY=SOME
SELECT * FROM EMP
    WHERE SAL> ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP
    WHERE SAL> (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);

--(4) EXISTS : �������� ����� �����ϸ� ��
--���Ӻ��ϰ� �ִ� �������� ���, �̸�, �޿� ��� 
SELECT EMPNO, ENAME, SAL
    FROM EMP MANAGER
    WHERE EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO = MGR);
--���ܻ���� ��� �ʵ� ���� ���
SELECT * FROM EMP MANAGER
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR);

--�μ����� ���� �޿��� ���� �޴� ����� ����(��� ��ȣ, ����̸�, �޿�, �μ���ȣ)�� ���(IN ������ �̿�)
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT * FROM EMP WHERE (SAL) IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO); 
--���� ��������
--SELECT * FROM EMP WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO); 

--����(JOB)�� MANAGER�� ����� ���� �μ��� �μ� ��ȣ�� �μ���� ������ ���(IN)
SELECT E.DEPTNO, D.DNAME, LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB IN (SELECT * FROM EMP WHERE JOB='MANAGER');

SELECT DEPTNO, DNAME, LOC FROM DEPT
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE JOB='MANAGER');

--������ 3000�̻��� ����� �� ���� ����� ����� �ش� ��޺� �ְ� ������ �޴� ������� ���, �̸�, ����, �Ի���, �޿�, �޿������ ���
SELECT GRADE, MAX(SAL) FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000 GROUP BY GRADE;


SELECT EMPNO, ENAME, HIREDATE, SAL,GRADE FROM EMP E, SALGRADE 
WHERE SAL BETWEEN LOSAL AND HISAL 
AND (GRADE, SAL) IN (SELECT GRADE, MAX(SAL) FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND SAL>=3000 GROUP BY GRADE);


--��REVIEW �Ұ�
--�����ȭ : �Ի��� �б⺰�� ���� ���� ������ �޴� ������� �б�, ���, �̸�, JOB, �����, �Ի���, �޿�, �󿩸� ����ϼ���
SELECT HIREDATE, DEIL(EXTRACT(MONTH FROM HIREDATE)/3) QUARTER FROM EMP;
SELECT HIREDATE,CEIL (TO_CHAR(HIREDATE,'MM')/3) QUARTER FROM EMP;
SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) QUARTER, MAX(SAL) FROM EMP
    GROUP BY CEIL(EXTRACT(MONTH FROM HIREDATE)/3);
    
SELECT CEIL(EXTRACT(MONTH FROM HIREDATE)/3) QUARTER, EMPNO, ENAME, JOB,;


--SALESMAN ��� ����� ���� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ����� ������� �ʴ´�.(ALL�̿�)
SELECT ENAME, SAL, JOB FROM EMP WHERE SAL>ALL (SELECT SAL FROM EMP WHERE JOB='SALESMAN') AND JOB!='SALESMAN';

--SALESMAN �Ϻ� � �� ������� �޿��� ���� �޴� ������� �̸��� �޿��� ����(��� ����)�� ����ϵ� ���� ����� ���(ANY)
SELECT ENAME, SAL, JOB FROM EMP WHERE SAL>ANY (SELECT SAL FROM EMP WHERE JOB='SALESMAN') AND JOB!='SALESMAN';
    
--������ 3000�̸��� ��� �߿� ���� �ֱٿ� �Ի��� ����� �����ȣ�� �̸�, ����, �Ի����� ���
SELECT DEPTNO, ENAME, SAL*12+COMM ����, HIREDATE 
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP WHERE (SAL*12+COMM)<30000);

--������ ��SALESMAN���� ����� �޴� �޿��� �ּ� �޿����� ���� �޴� ������� �̸�, �޿�, ����, �μ���ȣ�� ����ϵ� �μ���ȣ�� 20���� ����� �����Ѵ�(ANY ������ �̿�)
SELECT * FROM EMP;
SELECT ENAME, SAL, JOB, DEPTNO FROM EMP WHERE SAL>ANY(SELECT SAL FROM EMP WHERE JOB='SALESMAN')AND DEPTNO!=20;






--��������
-- 14. ��� ���̺��� �̸��� ��T���� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� �������� ����
    --��� ��ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�. �� �����ȣ ������ ����Ͽ���.
SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%'; --��������
SELECT DEPTNO, ENAME, SAL 
    FROM EMP 
    WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%') ORDER BY DEPTNO;

-- 15. ��� ���̺��� �μ� ��ġ�� Dallas�� ��� �������� ���� �̸�,����,�޿��� ���
SELECT ENAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC='DALLAS'; --��������
SELECT ENAME, JOB, SAL 
    FROM EMP 
    WHERE ENAME IN (SELECT ENAME FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC='DALLAS');

--��review
-- 16. EMP ���̺��� King���� �����ϴ� ��� ����� �̸��� �޿��� ����ϴ� SELECT��
SELECT E1.ENAME FROM EMP E1, EMP E2 WHERE E1.MGR=E2.EMPNO AND E1.MGR='7839'; --��������
SELECT ENAME, SAL 
    FROM EMP 
    WHERE ENAME IN (SELECT E1.ENAME FROM EMP E1, EMP E2 WHERE E1.MGR=E2.EMPNO AND E1.MGR='7839');

-- 17. ��� ���̺��� SALES�μ� ����� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT E.ENAME FROM EMP E, DEPT D WHERE  E.DEPTNO = D.DEPTNO AND DNAME = 'SALES'; --��������
SELECT ENAME, JOB 
    FROM EMP 
    WHERE ENAME IN(SELECT E.ENAME FROM EMP E, DEPT D WHERE  E.DEPTNO = D.DEPTNO AND DNAME = 'SALES');

-- 18. ��� ���̺��� ������ �μ� 30�� ���� ���޺��� ���� ����� ���
SELECT MIN(SAL) FROM EMP WHERE DEPTNO='30';  --��������
SELECT ENAME 
    FROM EMP 
    WHERE SAL>ANY(SELECT SAL FROM EMP WHERE DEPTNO='30');

-- 19. �μ� 10���� �μ� 30�� ����� ���� ������ �ð� �ִ� ����� �̸��� ������ ���
SELECT JOB FROM EMP WHERE DEPTNO='30';
SELECT ENAME, JOB 
    FROM EMP
    WHERE DEPTNO = '10' AND JOB IN(SELECT JOB FROM EMP WHERE DEPTNO='30');

-- 20. ��� ���̺��� FORD�� ������ ���޵� ���� ����� ��� ������ ���
SELECT JOB, SAL FROM EMP WHERE ENAME = 'FORD';
SELECT * 
    FROM EMP 
    WHERE (JOB, SAL)=(SELECT JOB, SAL FROM EMP WHERE ENAME = 'FORD')AND ENAME<>'FORD';

-- 21. �̸��� JONES�� ������ JOB�� ���ų� 
    --������ FORD ���� �̻��� ����� ������ �̸�,����,�μ���ȣ,�޿��� ����ϴ� SELECT���� �ۼ�.
    -- ��, ������ ���ĺ� ��, ������ ���� ������ ����Ͽ���.

SELECT ENAME, JOB, DEPTNO, SAL FROM EMP 
    WHERE JOB=(SELECT JOB FROM EMP WHERE ENAME='JONES')
    OR SAL>=(SELECT SAL FROM EMP WHERE ENAME='FORD')
    AND ENAME!='JONES' AND ENAME!='FORD'
    ORDER BY JOB, SAL DESC;

--��
-- 22. ��� ���̺��� SCOTT �Ǵ� WARD�� ������ ���� ����� ������ �̸�,����,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.

--SELECT SAL FROM EMP WHERE SAL=(SELECT SAL FROM EMP WHERE ENAME='SCOTT') OR SAL=(SELECT SAL FROM EMP WHERE ENAME='WARD');

SELECT SAL FROM EMP WHERE ENAME IN ('SCOTT','WARD');--��������
SELECT ENAME, JOB, SAL 
    FROM EMP 
    WHERE SAL IN(SELECT SAL FROM EMP WHERE ENAME IN ('SCOTT','WARD')) AND ENAME!='SCOTT' AND ENAME !='WARD';


-- 23. ��� ���̺��� CHICAGO���� �ٹ��ϴ� ����� ���� ������ �ϴ� ������� �̸�,������ ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT JOB FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC='CHICAGO';
SELECT ENAME, JOB 
    FROM EMP 
    WHERE JOB IN(SELECT JOB FROM EMP E, DEPT D WHERE E.DEPTNO = D.DEPTNO AND LOC='CHICAGO');

-- 24. ��� ���̺��� �μ����� ������ ��� ���޺��� ���� ����� �����ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO; --���������� �̰����� �θ� �ȵ�.
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO --�̷� ������������, �̰��� ���δ� ������� �ʴ´�.

SELECT DEPTNO, ENAME, SAL FROM EMP E
    WHERE SAL>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);

SELECT DEPTNO, ENAME, SAL, TRUNC((SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO)) �μ����  FROM EMP E
    WHERE SAL>(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);

-- 25. ��� ���̺��� �������� ������ ��� ���޺��� ���� ����� �μ���ȣ,�̸�,�޿��� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;

SELECT DEPTNO, ENAME, SAL FROM EMP E
    WHERE SAL<(SELECT AVG(SAL) FROM EMP WHERE DEPTNO=E.DEPTNO);

-- 26 ��� ���̺��� ��� �� �� �̻����κ��� ���� ���� �� �ִ� ����� ����,�̸�,�����ȣ,�μ���ȣ�� ���(��, �μ���ȣ ������ �������� ����)
SELECT JOB,ENAME,EMPNO,DEPTNO 
    FROM EMP MANAGER
    WHERE EXISTS(SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR) ORDER BY DEPTNO;

SELECT JOB,ENAME,EMPNO,DEPTNO 
    FROM EMP MANAGER
    WHERE EXISTS(SELECT * FROM EMP W WHERE MANAGER.EMPNO=W.MGR) ORDER BY DEPTNO;

-- 27. ��� ���̺��� ���� ����� �����ȣ, �̸�, ����, �μ���ȣ�� ����ϴ� SELECT���� �ۼ��Ͻÿ�.
SELECT EMPNO, ENAME, JOB, DEPTNO
    FROM EMP MANAGER
    WHERE NOT EXISTS (SELECT * FROM EMP WHERE MANAGER.EMPNO=MGR);
    
--IN�� ������ NOT�� ����ϸ� NULL������ ������ ���� �� ������ NULL�� �����ϴ��� IN�� ���� ���ƾ��Ѵ�.
    
    

    
    


--[III] JOIN : ���̺��� 2�� �̻� �����Ͽ� �˻�

SELECT * FROM EMP WHERE ENAME = 'SCOTT';
SELECT * FROM DEPT; 

--��CROSS JOIN(FROM���� ���̺� 2�� �̻�)
SELECT * FROM EMP,DEPT WHERE ENAME = 'SCOTT';
--EQUI JOIN (���� �ʵ��� DEPTNO���� ��ġ�Ǵ� ���Ǹ� JOIN)
SELECT * FROM EMP,DEPT WHERE ENAME = 'SCOTT' AND EMP.DEPTNO=DEPT.DEPTNO;
SELECT * FROM EMP,DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;
--��� ����� �̸�,�μ���, �μ���ȣ
SELECT ENAME ,DNAME, E.DEPTNO FROM EMP E ,DEPT D 
    WHERE E.DEPTNO = D.DEPTNO;
SELECT E.*, DNAME,LOC
    FROM EMP E,DEPT D WHERE E.DEPTNO=D.DEPTNO;




--��EQUI JOIN 

--���, �̸�, �μ���ȣ, �μ��̸�, �ٹ��� ���
SELECT EMPNO, ENAME, E.DEPTNO, DNAME,LOC
    FROM EMP E,DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
--�޿� 2000 �̻� ������ �̸�, ����, �޿�, �μ���, �ٹ��� �ʵ� ���
SELECT ENAME,JOB,SAL,DNAME,LOC FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000;
--LOC�� CHICAGO�� ����� �̸�, ����, �μ���, �ٹ��� ���
SELECT ENAME,JOB, DNAME,LOC FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO';
--�μ���ȣ�� 10 �Ǵ� 20�� ����� �̸�, ����, �ٹ��� ���(�޿��� ����)
SELECT ENAME, JOB, LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND D.DEPTNO IN (10,20)
    ORDER BY SAL;
--�̸�, �޿�, ��(COMM), ����((�޿�+COMM)*12),�μ���, �ٹ���
SELECT ENAME,SAL,COMM,(SAL+NVL(COMM,0))*12 "����", DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;
--�̸�, �޿�, ��(COMM), ����((�޿�+COMM)*12),�μ���, �ٹ���
--JOB�� SALESMAN �Ǵ� MANAGER�� �����(������ ū ������ ����)
SELECT ENAME,SAL,COMM,(SAL+NVL(COMM,0))*12 "����", DNAME, LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB IN('SALESMAN','MANAGER') --UPPER(JOB) ��밡��
    ORDER BY ���� DESC;
--COMM�� NULL�̰� �޿��� 1200 �̻��� ����� �̸�, �޿� �Ի���, �μ���ȣ, �μ���(�μ����, �޿�ū�� ����
SELECT ENAME, SAL,HIREDATE,E.DEPTNO,DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND COMM IS NULL AND SAL>=1200
    ORDER BY DNAME, SAL DESC;

--źź ������
--���忡�� �ٹ��ϴ� ����� �̸��� �޿��� ����Ͻÿ�
SELECT * FROM DEPT;
SELECT ENAME,SAL FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC = 'NEW YORK';
-- ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի����� ����Ͻÿ�
SELECT ENAME, HIREDATE FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND DNAME = 'ACCOUNTING';
--������ MANAGER�� ����� �̸�, �μ����� ����Ͻÿ�
SELECT ENAME, DNAME FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND JOB = 'MANAGER';
--Comm�� null�� �ƴ� ����� �̸�, �޿�, �μ��ڵ�, �ٹ����� ����Ͻÿ�.
SELECT ENAME, SAL, E.DEPTNO, LOC FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND NOT COMM IS NULL;


-- TO_CHAR(��¥��, 'YY')
-- TO_CHAR(������, 'YY')

--��NON EQUI JOIN
SELECT ENAME, SAL FROM EMP WHERE ENAME = 'SCOTT';
SELECT * FROM SALGRADE;
SELECT ENAME, SAL, GRADE, LOSAL, HISAL
    FROM EMP, SALGRADE WHERE ENAME = 'SCOTT' AND SAL >=LOSAL AND SAL <=HISAL;
--��� ����� ���, �̸�, JOB, ��� ���, �޿�, �޿����(1��� 2��� ��)
SELECT EMPNO, ENAME, JOB, MGR,SAL, GRAED ||'���'
    FROM EMP,SALGRADE 
    WHERE SAL BETWEEN LOSAL AND HISAL;
    
--źź������ ��������
--Comm�� null�� �ƴ� ����� �̸�, �޿�, ���, �μ���ȣ, �μ��̸�, �ٹ����� ����Ͻÿ�.
SELECT ENAME,SAL,GRADE, E.DEPTNO,DNAME,LOC FROM EMP E, DEPT D,SALGRADE S
    WHERE E. DEPTNO=D.DEPTNO AND NOT COMM IS NULL AND SAL BETWEEN LOSAL AND HISAL;
--�̸�, �޿�, �Ի���, �޿����
SELECT ENAME, SAL, HIREDATE, GRADE FROM EMP, SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL;
--�̸�, �޿�, �Ի���, �޿����, �μ���, �ٹ���
SELECT ENAME, SAL, HIREDATE, GRADE, DNAME LOC FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
--�̸�, �޿�, ���, �μ��ڵ�, �ٹ���. �� comm �� null�ƴ� ���
SELECT ENAME, SAL,GRADE,E.DEPTNO,LOC
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL;
--�̸�, �޿�, �޿����, ����, �μ���, �μ��� ���, �μ��� ������ ������. ����=(sal+comm)*12 comm�� null�̸� 0
SELECT NAME, SAL, GRADE, (SAL+NVL(COMM,0))*12, DNAME,
    FROM EMP E, DEPT D, SALGRADE
    WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
    ORDER BY SAL '����';
--�̸�, ����, �޿�, ���, �μ��ڵ�, �μ��� ���. �޿��� 1000~3000����. �������� : �μ���, �μ������� ������, ���������� �޿� ū��
SELECT ENAME, JOB, SAL, GRADE,E.DEPTNO, DNAME
FROM EMP E,DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL
AND SAL >=1000 AND SAL<=3000;
OREDR BY DNAME, JOB, SAL DESC;
--�̸�, �޿�, ���, �Ի���, �ٹ���. 81�⿡ �Ի��� ���. ��� ū��
SELECT ENAME, SAL, GRADE, HIREDATE, LOC
FROM EMP E,DEPT D, SALGRADE
WHERE E.DEPTNO = D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND TO_CHAR(HIREDATE,'YY')=81;
ORDER BY GRADE DESC;

--�� SELF JOIN
SELECT W.EMPNO, W.ENAME, W.MGR, M.EMPNO, M.ENAME MANAGERNAME
    FROM EMP W, EMP M
    WHERE W.ENAME = 'SMITH' AND W.MGR = M.EMPNO;

SELECT WORKER.EMPNO, WORKER.ENAME, MANAGER.ENAME ���
    FROM EMP WORKER, EMP MANAGER
    WHERE WORKER.MGR = MANAGER.EMPNO; --EMPNO�� NULL���� �����Ƿ� 13�� ���.
    
--"SMITH�� ���� FORD"�� ������ ���
SELECT W.ENAME||'�� ���� '||M.ENAME||'��'
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO;


--SELF JOIN źź������ ����
--������ ������ ����
INSERT INTO DEPT VALUES (50, 'IT','DALLAS');
INSERT INTO EMP (EMPNO,ENAME,DEPTNO) VALUES (9999, 'HONG', 50);
--EX1. ����� �̸��� 'KING�� ������� �̸��� JOB ���
SELECT W.ENAME, W.JOB
    FROM EMP W, EMP M
    WHERE W.MGR = M.EMPNO AND M.ENAME ='KING'; 

--EX2. SCOTT�� ������ �μ���ȣ ���� �ٹ��ϴ� ����� �̸� ���
SELECT W.ENAME, W.DEPTNO
    FROM EMP W, EMP W2
    WHERE W2.ENAME = 'SCOTT' AND W.DEPTNO=W2.DEPTNO AND W.ENAME!='SCOTT';

--EX3. SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸� ���
SELECT W.ENAME, W.DEPTNO, M.DEPTNO, D.LOC, M.ENAME
    FROM EMP W, EMP M, DEPT D
    WHERE M.ENAME = 'SCOTT' AND W.DEPTNO = M.DEPTNO;

----���� �ٹ��� ���
SELECT W.ENAME, D.LOC
    FROM EMP W, DEPT D
    WHERE W.DEPTNO=D.DEPTNO AND ENAME = 'SCOTT';
    
----������� �ٹ��� 
SELECT W2.ENAME, D.LOC
    FROM EMP W2, DEPT D
    WHERE W2.DEPTNO=D.DEPTNO;
    
----������� �ٹ��� (�������� ���ֽŰ�)
SELECT W2.ENAME, D2.LOC
    FROM EMP W2, DEPT D2
    WHERE W2.DEPTNO=D2.DEPTNO;
    
----���� �ٹ������� ���ϴ�..
SELECT W2.ENAME
    FROM EMP W, DEPT D, EMP W2
    WHERE W.DEPTNO=D.DEPTNO AND W2.DEPTNO=D.DEPTNO AND W.ENAME = 'SCOTT'  AND W2.ENAME!='SCOTT';

----���� �ٹ������� ���ϴ�..(�������� ���ֽŰ�)
SELECT W2.ENAME
    FROM EMP W, DEPT D, EMP W2, DEPT D2
    WHERE W.DEPTNO=D.DEPTNO AND W.ENAME = 'SCOTT'
    AND W2.DEPTNO=D2.DEPTNO
    AND W2.ENAME!='SCOTT' AND D.LOC=D2.LOC;

----���� �ٹ������� ���ϴ�..(TEST)
SELECT W2.ENAME
    FROM EMP W, DEPT D, EMP W2
    WHERE W.DEPTNO=D.DEPTNO AND W.ENAME = 'SCOTT'
    AND W2.DEPTNO=D.DEPTNO
    AND W2.ENAME!='SCOTT' AND D.LOC=D.LOC;

ROLLBACK; (���������۾� ���.)

SELECT * FROM DEPT;
SELECT * FROM EMP;

--�� OUTER JOIN
SELECT W.EMPNO,W.ENAME,M.ENAME
    FROM EMP W,EMP M
    WHERE W.MGR=M.EMPNO(+);
SELECT W.EMPNO,W.ENAME, NVL(M.ENAME,'--CEO--')
    FROM EMP W,EMP M
    WHERE W.MGR=M.EMPNO(+);
    
SELECT W.EMPNO,W.ENAME, NVL(M.ENAME,'--CEO--')
    FROM EMP W,EMP M
    WHERE W.MGR(+)=M.EMPNO AND W.EMPNO IS NULL;

SELECT * FROM EMP; --14��
SELECT * FROM DEPT; --4��
SELECT E.*, DNAME FROM EMP E, DEPT D
    WHERE E.DEPTNO(+)= D.DEPTNO;
    
--OUTER JOIN źź������
--SMITH�� �Ŵ����� FORD �Դϴ�.
--KING�� �Ŵ����� X�Դϴ�.
SELECT E1.ENAME || '�Ŵ�����' || NVL(E2.ENAME,'x') || '�Դϴ�.'
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO(+);

-- �� <��������> PART1
--1. �̸�, ���ӻ��
SELECT E1.ENAME �̸�, E2.ENAME ���ӻ��
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO;

--2. �̸�, �޿�, ����, ���ӻ��
SELECT E1.ENAME �̸�, E1.SAL �޿�, E1.JOB ����, E2.ENAME ���ӻ��
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO;
    
--3. �̸�, �޿�, ����, ���ӻ��. (��簡 ���� �������� ��ü ���� �� ���.
    --��簡 ���� �� '����'���� ���)
    SELECT E1.ENAME �̸�, E1.SAL �޿�, E1.JOB ����, NVL(E2.ENAME,'����') ���ӻ��
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO(+);

--4. �̸�, �޿�, �μ���, ���ӻ���
SELECT E1.ENAME �̸�, E1.SAL �޿�, D.DNAME �μ���, NVL(E2.ENAME,'����') ���ӻ��
    FROM EMP E1, EMP E2, DEPT D
    WHERE E1.DEPTNO = D.DEPTNO AND E1.MGR=E2.EMPNO;

--5. �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ���, (��簡 ���� �������� ��ü ���� �� ���)
SELECT E1.ENAME �̸�, E1.SAL �޿�, E1.DEPTNO �μ��ڵ�, D.DNAME �μ���, D.LOC �ٹ���, NVL(E2.ENAME,'����') ���ӻ��
    FROM EMP E1, EMP E2, DEPT D
    WHERE E1.DEPTNO = D.DEPTNO AND E1.MGR=E2.EMPNO(+);

--6. �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���
SELECT E1.ENAME �̸�, E1.SAL �޿�, S.GRADE ���, E1.DEPTNO �μ��ڵ�, D.DNAME �μ���, NVL(E2.ENAME,'����') ���ӻ��
    FROM EMP E1, EMP E2, DEPT D, SALGRADE S
    WHERE E1.DEPTNO = D.DEPTNO AND E1.MGR=E2.EMPNO
    AND E1.SAL BETWEEN S.LOSAL AND S.HISAL
    AND E1.SAL >=2000;
 
--7. �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����)
SELECT E1.ENAME �̸�, E1.SAL �޿�, S.GRADE ���, D.DNAME �μ���, NVL(E2.ENAME,'����') ���ӻ��
    FROM EMP E1, EMP E2, DEPT D, SALGRADE S
    WHERE E1.DEPTNO = D.DEPTNO AND E1.MGR=E2.EMPNO(+)
    AND E1.SAL BETWEEN S.LOSAL AND S.HISAL
    ORDER BY D.DNAME;
--8. �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12 �� comm�� null�̸� 0
SELECT E1.ENAME �̸�, E1.SAL �޿�, S.GRADE ���, D.DNAME �μ���, (E1.SAL+NVL(E1.COMM,0))*12 ����, NVL(E2.ENAME,'����') ���ӻ��
    FROM EMP E1, EMP E2, DEPT D, SALGRADE S
    WHERE E1.DEPTNO = D.DEPTNO AND E1.MGR=E2.EMPNO(+)
    AND E1.SAL BETWEEN S.LOSAL AND S.HISAL;

--9. 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����
SELECT E1.ENAME �̸�, E1.SAL �޿�, S.GRADE ���, D.DNAME �μ���, (E1.SAL+NVL(E1.COMM,0))*12 ����, NVL(E2.ENAME,'����') ���ӻ��
    FROM EMP E1, EMP E2, DEPT D, SALGRADE S
    WHERE E1.DEPTNO = D.DEPTNO AND E1.MGR=E2.EMPNO(+)
    AND E1.SAL BETWEEN S.LOSAL AND S.HISAL
    ORDER BY D.DNAME, E1.SAL DESC;

--  PART2
--1. EMP ���̺��� ��� ����� ���� �̸�,�μ���ȣ,�μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT E.ENAME �̸�, E.DEPTNO �μ���ȣ, D.DNAME �μ���
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO;

--2. EMP ���̺��� NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�,����,�޿�,�μ����� ���
SELECT E.ENAME �̸�, E.JOB ����, E.SAL �޿�, D.DNAME �μ���
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND D.LOC ='NEW YORK';

--3. EMP ���̺��� ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ���
SELECT E.ENAME �̸�, D.DNAME �μ���, D.LOC ��ġ, E.COMM ���ʽ�
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND NOT E.COMM IS NULL AND E.COMM!=0;

--4. EMP ���̺��� �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���
SELECT E.ENAME �̸�, E.JOB ����, D.DNAME �μ���, D.LOC ��ġ
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO=D.DEPTNO
    AND E.ENAME LIKE '%L%';

--5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�. ������������ ������������
SELECT E.EMPNO ���, E.ENAME �����, E.DEPTNO �μ��ڵ�, D.DNAME �μ���
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO
    ORDER BY E.ENAME ASC;

--6. ���, �����, �޿�, �μ����� �˻��϶�. 
    --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
SELECT E.EMPNO ���, E.ENAME �����, E.SAL �޿�, D.DNAME �μ���
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND E.SAL>=2000
    ORDER BY E.SAL DESC;

--7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻���
-- ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.
SELECT E.EMPNO ���, E.ENAME �����, E.JOB ����, E.SAL �޿�, D.DNAME �μ���
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO  AND E.JOB ='MANAGER' AND E.SAL>=2500
    ORDER BY E.EMPNO ASC;
    
--8. ���, �����, ����, �޿�, ����� �˻��Ͻÿ�. ��, �޿����� ������������ �����Ͻÿ�
SELECT E.EMPNO ���, E.ENAME �����, E.JOB ����, E.SAL �޿�, S.GRADE ���
    FROM EMP E, DEPT D, SALGRADE S
    WHERE E.DEPTNO=D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL
    ORDER BY E.SAL DESC;

--9. ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü)
SELECT E1.ENAME ���, NVL(E2.ENAME,'������') ���
    FROM EMP E1, EMP E2
    WHERE E1.MGR=E2.EMPNO(+);

--10. �����, ����, ����� ������ �˻��Ͻÿ�
SELECT E1.ENAME ���, NVL(E2.ENAME,'������') ���, NVL(E3.ENAME,'������') "����� ���" 
    FROM EMP E1, EMP E2, EMP E3 
    WHERE E1.MGR=E2.EMPNO AND E2.MGR = E3.EMPNO;
    
--11. ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�
SELECT E1.ENAME ���, NVL(E2.ENAME,'������') ���, NVL(E3.ENAME,'������') "����� ���" 
    FROM EMP E1, EMP E2, EMP E3 
    WHERE E1.MGR=E2.EMPNO(+) AND E2.MGR = E3.EMPNO(+);

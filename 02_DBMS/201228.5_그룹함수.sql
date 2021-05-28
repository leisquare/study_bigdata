--[V] �׷��Լ� : SUM, AVG, MIN, MAX, COUNT STDDEV, VARIANCE
SELECT ENAME, ROUND(SAL,-3) FROM EMP; --�������Լ�

SELECT SUM(SAL) FROM EMP; --�׷��Լ�

SELECT ENAME, SUM(SAL) FROM EMP; -- �׷��Լ��� ������� ���� �� �� ����.
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;
--EMP���̺��� ��� SAL
SELECT ROUND(AVG(SAL),2) FROM EMP;
SELECT COUNT(SAL) FROM EMP; 
SELECT COUNT(*) FROM EMP; --�ο�(��) ��
SELECT AVG(SAL), SUM(SAL)/COUNT(SAL) FROM EMP;
SELECT COMM FROM EMP; --300,500,1400,0
SELECT COUNT(COMM), SUM(COMM) AVG(COMM) FROM EMP; --�׷��Լ��� NULL���� �����ϰ� �Ի��Ѵ�.
-- EMP ���̺��� SAL�� ���, ��, �ּҰ�, �ִ밪, �л�, ǥ������
SELECT ROUND(AVG(SAL)), SUM(SAL), MIN(SAL), MAX(SAL), ROUND(VARIANCE(SAL)), ROUND(STDDEV(SAL)) FROM EMP;
-- �μ���ȣ�� �޿� �ִ�ġ
SELECT DEPTNO �μ���ȣ, MAX(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO; --GROUP BY ������ �ʵ� ��Ī�� �� �� ����.
--�׷��Լ��� ������, ������, ��¥���� ��� ��� ����.
--�μ���ȣ���� ���� �Ի�⵵, �ֱ� �Ի�⵵
SELECT DEPTNO, MIN(HIREDATE),MAX(HIREDATE) FROM EMP GROUP BY DEPTNO;
SELECT MIN(ENAME), MAX(ENAME) FROM EMP;
SELECT COUNT(DISTINCT JOB) FROM EMP;

--	źź ������
-- ���� �ֱٿ� �Ի��� ����� �Ի��ϰ� �Ի����� ���� ������ ����� �Ի����� ���. 
--(���) 80/12/17:14620��° 83/01/12:13864��°
SELECT MAX(HIREDATE)||':'||TRUNC(SYSDATE-MAX(HIREDATE))||'��° ' ||MIN(HIREDATE)||':'||TRUNC(SYSDATE-MIN(HIREDATE)) FROM EMP;
	
--(���) 80��12��17�� �����Ի�  :14,620��° 83��01��12�� �ֱ��Ի� :13,864��°
	SELECT TO_CHAR(MAX(HIREDATE))||'�ֱ��Ի�'||TO_CHAR(TRUNC(SYSDATE-MAX(HIREDATE)),'99,999')||' �����Ի�' ||MIN(HIREDATE)||':'||TO_CHAR(TRUNC(SYSDATE-MIN(HIREDATE)),'99,999')||'��° ' FROM EMP;
   
--10�� �μ� �Ҽ��� ��� ��ձ޿�
SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10;
--	10�� �μ� �Ҽ��� ��� �߿��� Ŀ�̼��� �޴� ����� ���� ���� ���ÿ�.


--2. GROUP BY ��
--EX. �μ��� �ִ�޿�
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE =(SELECT MAX(HIREDATE) FROM EMP);

--�μ���ȣ�� �����, �ִ�޿�, �ּұ޿�, ��ձ޿�
SELECT DNAME, COUNT(*), MAX(SAL), MIN(SAL), TRUNC(AVG(SAL)) 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO 
    GROUP BY DNAME;

SELECT DEPTNO, JOB, SUM(SAL) FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO;
    
    
-- �� 3. HAVING (�׷��Լ� ����� ����
-- DEPTNO���� ��ձ޿�(��ձ޿��� 2000�̻��� �μ��� ���)
SELECT DEPTNO, AVG(SAL) FROM EMP
    GROUP BY DEPTNO
    HAVING AVG(SAL)>2000;

-- �� 4. �ǹ����̺�
SELECT DEPTNO, JOB, SUM(SAL) FROM EMP GROUP BY DEPTNO, JOB ORDER BY DEPTNO;
-- 1�ܰ�
SELECT DEPTNO, DECODE(JOB,'CLERK', SAL, 0) "CLERK",
            DECODE(JOB,'MANAVER', SAL, 0) "MANAGER",
            DECODE(JOB,'PRISIDENT', SAL, 0) "PRISIDENT",
            DECODE(JOB,'ANALYST',SAL,0) "ANALYST",
            DECODE(JOB, 'SALESMAN',SAL,0) "SALESMAN" 
            FROM EMP;
            
-- 2�ܰ�
SELECT DEPTNO, SUM(DECODE(JOB,'CLERK', SAL, 0)) "CLERK",
            SUM(DECODE(JOB,'MANAGER', SAL, 0)) "MANAGER",
            SUM(DECODE(JOB,'PRESIDENT', SAL, 0)) "PRESIDENT",
           SUM(DECODE(JOB,'ANALYST',SAL,0)) "ANALYST",
           SUM(DECODE(JOB, 'SALESMAN',SAL,0)) "SALESMAN" 
           FROM EMP
            GROUP BY DEPTNO;
            
            DECODE(JOB, 'SALESMAN',SAL,0) "SALESMAN" FROM;
-- 3�ܰ� : �հ��߰�

SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY ROLLUP(DEPTNO);

SELECT DEPTNO, SUM(DECODE(JOB,'CLERK', SAL, 0)) CLERK,
            SUM(DECODE(JOB,'MANAGER', SAL, 0)) MANAGER,
            SUM(DECODE(JOB,'PRESIDENT', SAL, 0)) PRESIDENT,
           SUM(DECODE(JOB,'ANALYST',SAL,0)) ANALYST,
           SUM(DECODE(JOB, 'SALESMAN',SAL,0)) SALESMAN,
           SUM(SAL) AS �Ұ�
        FROM EMP GROUP BY ROLLUP(DEPTNO);



--1. ��� ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ���
SELECT COUNT(*), MAX(SAL), MIN(SAL), SUM(SAL)
    FROM EMP;

--2. ������̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB;

--3. ������̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT������ �ۼ��Ͽ���.
SELECT MAX(SAL)-MIN(SAL) FROM EMP;
--4. �� �μ����� �ο���, �޿� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ����ϵ� �޿��� ���� ���� ������ ����϶�.
SELECT COUNT(*), TRUNC(AVG(SAL)), MIN(SAL), MAX(SAL), SUM(SAL) 
    FROM EMP 
    GROUP BY DEPTNO 
    ORDER BY SUM(SAL) DESC;

--5. �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����϶�
--(��°���� �μ���ȣ, ���������� �������� ����)
SELECT DEPTNO, JOB, COUNT(*) "�ο���" , TRUNC(AVG(SAL)), SUM(SAL) 
    FROM EMP 
    GROUP BY DEPTNO, JOB 
    ORDER BY DEPTNO, JOB;


--6. ������, �μ��� �׷��Ͽ� �����  ����, �μ���ȣ, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� 
-- ����϶�.(��°���� ������, �μ���ȣ �� �������� ����)
SELECT JOB, DEPTNO , COUNT(*) "�ο���" , TRUNC(AVG(SAL)), SUM(SAL) 
    FROM EMP 
    GROUP BY DEPTNO, JOB 
    ORDER BY DEPTNO, JOB;

--7. ������� 5���̻� �Ѵ� �μ���ȣ�� ������� ����Ͻÿ�.
SELECT DEPTNO, COUNT(*)
    FROM EMP
    HAVING COUNT(*)>=5
    GROUP BY DEPTNO;


-- 8. ������� 5���̻� �Ѵ� �μ���� ������� ����Ͻÿ�
SELECT DNAME, COUNT(*)
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    HAVING COUNT(*)>=5
    GROUP BY DNAME;

--9. ��� ���̺��� ������ �޿��� ����� 3000�̻��� ������ ���ؼ� ������, ��� �޿�, 
--�޿��� ���� ���Ͽ� ����϶�
SELECT JOB, TRUNC(AVG(SAL)), SUM(SAL)
    FROM EMP
    HAVING TRUNC(AVG(SAL))>=3000
    GROUP BY JOB;


--10. ������̺��� �޿����� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿��հ踦 ����϶� 
        --��, �޿� �հ�� �������� �����϶�.
SELECT JOB, SUM(SAL)
    FROM EMP
    HAVING SUM(SAL)>5000
    GROUP BY JOB
    ORDER BY SUM(SAL) DESC;

--11. �μ��� �޿����, �μ��� �޿��հ�, �μ��� �ּұ޿��� ����϶�.
SELECT DNAME, TRUNC(AVG(SAL)), SUM(SAL), MIN(SAL)
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY DNAME;


--12. ���� 11���� �����Ͽ�, �μ��� �޿���� �ִ�ġ, �μ��� �޿����� �ִ�ġ, 
            --�μ��� �ּұ޿��� �ִ�ġ�� ����϶�.
SELECT MAX(TRUNC(AVG(SAL))), MAX(SUM(SAL)), MAX(MIN(SAL))
    FROM EMP
    GROUP BY DEPTNO;
    

--13. ��� ���̺��� �Ʒ��� ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.(�⵵�� ������)
--   H_YEAR	COUNT(*)	MIN(SAL)	MAX(SAL)	AVG(SAL)	SUM(SAL)
--     80	  1		    800		    800		    800		    800
--	81	 10		    950		    5000	    2282.5	  22825
--	82	  2		    1300	    3000	   2150		   4300
--	83	  1		    1100	    1100	    1100	   1100

SELECT TO_CHAR(HIREDATE,'YY') AS H_YEAR, COUNT(*), MIN(SAL), MAX(SAL), AVG(SAL), SUM(SAL)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE,'YY')
    ORDER BY H_YEAR;

-- 14.  ������̺��� �Ʒ��� ����� ����ϴ� SELECT �� �ۼ�
-- TOTAL	1980	1981	1982	1983
--  14		  1	     10	      2	      1
SELECT COUNT(*) AS TOTAL,
       SUM(DECODE(TO_CHAR(HIREDATE,'YYYY'),1980,1,0)) AS "1980",
       SUM(DECODE(TO_CHAR(HIREDATE,'YYYY'),1981,1,0)) AS "1981",
       SUM(DECODE(TO_CHAR(HIREDATE,'YYYY'),1982,1,0)) AS "1982",
       SUM(DECODE(TO_CHAR(HIREDATE,'YYYY'),1983,1,0)) AS "1983"
       FROM EMP;
     
     --**  (DECODE(TO_CHAR(HIREDATE,'YYYY'),1980,1,) null�� ä�� �θ� count ����, �ƴ� ��� sum �ؾ���.
       
--     GROUP BY ROLLUP(TO_CHAR(HIREDATE,'YYYY'));
-- **�ȴ޾Ƶ��Ǵ°ſ���.

--15. ������̺��� �Ʒ��� ����� ����ϴ� SELECT �� �ۼ�(JOB ������ �������� ����)
-- JOB��, DEPTNO�� SUM(SAL)
--JOB		DEPTNO10	DEPTNO20	DEPTNO30     TOTAL
--ANALYST	     0		   6000		    0		6000
--CLERK		  1300		   1900		  950		4150
--��.
--SALESMAN	      0	 		0	 5600		 5600

SELECT JOB, SUM(DECODE(DEPTNO,10,SAL,0)) AS DEPTNO10,
            SUM(DECODE(DEPTNO,20,SAL,0)) AS DEPTNO20,
             SUM(DECODE(DEPTNO,30,SAL,0)) AS DEPTNO30,
             SUM(SAL) AS TOTAL
    FROM EMP
    GROUP BY JOB
    ORDER BY JOB;


        
--16. ������̺��� �ִ�޿�, �ּұ޿�, ��ü�޿���, ����� ���Ͻÿ�
SELECT MAX(SAL), MIN(SAL), SUM(SAL), TRUNC(AVG(SAL))
    FROM EMP;


--17. ������̺��� �μ��� �ο����� ���Ͻÿ�
SELECT COUNT(*)
    FROM EMP
    GROUP BY DEPTNO;


--18. ��� ���̺��� �μ��� �ο����� 6���̻��� �μ��ڵ带 ���Ͻÿ�
SELECT DEPTNO, COUNT(*)
    FROM EMP
    HAVING COUNT(*)>=6
    GROUP BY DEPTNO;

--19. ������̺��� ������ ���� ����� ������ �Ͻÿ�
--DNAME               CLERK    MANAGER  PRESIDENT  ANALYST   SALESMAN
--ACCOUNTING          1300       2450       5000          0           0
--RESEARCH             1900       2975           0       6000          0
--SALES                  950       2850           0          0       5600

SELECT D.DNAME, SUM(DECODE(JOB,'CLERK', SAL, 0)) AS CLERK,
    SUM(DECODE(JOB,'MANAGER', SAL, 0)) AS MANAGER,
    SUM(DECODE(JOB,'PRESIDENT', SAL, 0)) AS PRESIDENT,
    SUM(DECODE(JOB,'ANALYST',SAL,0))AS  ANALYST,
    SUM(DECODE(JOB, 'SALESMAN',SAL,0)) AS SALESMAN
    FROM EMP E, DEPT D 
    WHERE D.DEPTNO = E.DEPTNO
    GROUP BY D.DNAME;

--20.  ������̺��� �޿��� ���� ������� ����� �ο��Ͽ� ������ ���� ����� ������ �Ͻÿ�. 
-- (��Ʈ self join, group by, count���)
--ENAME	    ���
--________________________
--KING		1
--SCOTT		2
--����

SELECT E1.ENAME,E1.SAL,E2.ENAME,E2.SAL
    FROM EMP E1,EMP E2
    WHERE E1.SAL<E2.SAL
    ORDER BY E1.ENAME;

SELECT E1.ENAME, COUNT(E2.ENAME)+1 ���
    FROM EMP E1, EMP E2
    WHERE E1.SAL<E2.SAL(+)
    GROUP BY E1.ENAME
    ORDER BY ���;

SELECT ENAME,SAL,
    RANK() OVER(ORDER BY SAL DESC) "RANK",
    DENSE_RANK()OVER(ORDER BY SAL DESC) "DENSE_R",
    ROW_NUMBER()OVER(ORDER BY SAL DESC) "ROW_NUM"
    FROM EMP;
    

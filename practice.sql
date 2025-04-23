SELECT * FROM EMP;
select 
ENAME AS "EMPLOYEE NAME" ,
DEPTNO AS "DEPARTMENT NUMBER" ,
SAL+300 AS "INCREMENTED SALARY"
FROM 
EMP; 

SELECT E.ENAME,D.DNAME
FROM EMP E,DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT ENAME || ' IS WORKING AS A ' || JOB AS "EMPLOYEE JOB INFO" FROM EMP;
To display the name and department number of employee with number 7566. 
SELECT ENAME,DEPTNO FROM EMP WHERE EMPNO = 7566;
To display the name and department number of all employees in departments 10 and 30 in alphabetical order by name. 
SELECT ENAME, DEPTNO 
FROM EMP
WHERE DEPTNO IN (10,30)
ORDER BY ENAME;
Display the name and salary for all employees whose salary is not in range of $1500 and $2850.
SELECT ENAME , SAL
FROM EMP 
WHERE SAL NOT BETWEEN 1500 AND 2850;
Display the name of all clerks of department 10 and 20 hired before 1983.
SELECT ENAME
FROM EMP 
WHERE JOB = 'CLERK'
AND DEPTNO IN (10,20)
AND HIREDATE < TO_DATE('01-JAN-1983','DD-MON-YYYY');
SELECT SYSDATE AS "Current Date" FROM DUAL;
SELECT EMPNO, ENAME, SAL,
      ROUND(SAL * 1.15) AS "New Salary",
      ROUND((SAL * 1.15) - SAL) AS "Increment"
FROM EMP;
SELECT ENAME,
      CEIL(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "Months_Worked"
FROM EMP
ORDER BY "Months_Worked" DESC;
SELECT ENAME || ' earns ' || SAL || ' monthly' AS "Earnings"
FROM EMP;
SELECT DEPTNO, AVG(SAL) AS "Average Salary"
FROM EMP
GROUP BY DEPTNO;
SELECT D.DNAME, D.LOC, COUNT(E.EMPNO) AS "NUMBER OF PEOPLE", ROUND(AVG(E.SAL), 2) AS "SALARY"
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME, D.LOC;



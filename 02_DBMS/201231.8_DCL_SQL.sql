SHOW USER;
SELECT * FROM TAB;
SELECT * FROM DBA_TABLES; --DBA권한이 아니므로 접근 불가.
SELECT * FROM USER_tABLES;  --내 계정이 가진 테이블 정보
SELECT * FROM ALL_tABLES; --접근가능한 테이블 정보
SELECT * FROM ALL_TABLES WHERE TABLE_NAME='EMP';
SELECT * FROM SCOTT.EMP;
EXIT; --접속 해제
SHOW USER;
SELECT * FROM SCOTT.EMP; --권한박탈 후 접근불가
EXIT;


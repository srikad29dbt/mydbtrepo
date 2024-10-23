select e.*,as1.avg_sal from 
DEV.RAW_DATA.EMP_STG e  inner join {{ref('avg_sal')}} as1 
on (as1.deptno=e.deptno) and e.sal<as1.avg_sal
{{ config(materialized='ephemeral') }}

select deptno,avg(sal) as avg_sal from DEV.RAW_DATA.EMP_STG group by 1
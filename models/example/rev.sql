select prod_name, sum(quantity*unit_price) as revenue  
from CURATED_DATA.PRODUCTS P inner join CURATED_DATA.SALES S
on (P.prod_id=S.prod_id)
group by prod_name
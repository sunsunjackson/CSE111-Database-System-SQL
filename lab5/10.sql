select r_name, count(c_custkey) 
from customer, region, nation
where r_regionkey = n_regionkey
and  c_nationkey = n_nationkey and 
c_custkey not in (select o_custkey from orders)
and c_acctbal > (select avg(c_acctbal) from customer)
group by r_name;
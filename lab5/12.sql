select sum(p_ssupplycost)
from part, partsupp
where p_partkey in
(select l_partkey from lineitem, partsupp 
where l_shipdate like '1996%' and p_ssuppkey = l_suppkey)
and p_partkey = p_spartkey
and p_retailprice < 1000 
and p_ssuppkey 
not in (select distinct p_ssuppkey from partsupp, lineitem, part
where p_spartkey = p_partkey 
and p_ssuppkey = l_suppkey
and p_partkey = l_partkey 
and l_shipdate LIKE '1995%' 
and l_extendedprice < 1000);
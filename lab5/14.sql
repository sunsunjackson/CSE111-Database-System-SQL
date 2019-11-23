select r1.r_name, r2.r_name, strftime('%Y', l_shipdate) as year, sum(l_extendedprice*(1-l_discount))
from region r1, region r2, nation n1, nation n2, lineitem, supplier, customer, orders
where l_shipdate between '1995%' and  '1996%'
and o_custkey = c_custkey
and o_orderkey = l_orderkey
and n1.n_nationkey = c_nationkey
and n1.n_regionkey = r1.r_regionkey
and s_suppkey = l_suppkey
and s_nationkey = n2.n_nationkey
and r2.r_regionkey = n2.n_regionkey
group by r1.r_name, r2.r_name, strftime('%Y', l_shipdate);
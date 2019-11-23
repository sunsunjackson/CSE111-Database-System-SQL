select Q2.s_nation, count (distinct Q5.o_orderkey)
from Q2, Q5, lineitem
where Q2.s_suppkey = lineitem.l_suppkey
and lineitem.l_orderkey = Q5.o_orderkey 
and Q2.s_region = 'AMERICA' and Q5.o_orderyear LIKE '1995%'
and Q5.o_orderstatus = 'F' 
group by Q2.s_nation, Q5.o_orderstatus;
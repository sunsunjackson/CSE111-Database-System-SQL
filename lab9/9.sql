select count (distinct Q5.o_clerk)
from Q2, Q5, lineitem
where lineitem.l_orderkey = Q5.o_orderkey
and Q2.s_suppkey = lineitem.l_suppkey
and Q2.s_nation = 'RUSSIA';
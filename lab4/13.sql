Select Count(Distinct(o_orderkey))
From orders o, lineitem l, customer c, supplier s, nation n1, region r, nation n2
Where o.o_orderkey = l.l_orderkey and l.l_suppkey = s.s_suppkey
and s.s_nationkey = n1.n_nationkey and n1.n_regionkey = r.r_regionkey
and n2.n_name = 'CANADA' and r_name = 'EUROPE' 
and o.o_custkey = c.c_custkey and c.c_nationkey = n2.n_nationkey;
SELECT DISTINCT s_name,
                c_name
  FROM supplier s,
       customer c,
       orders o,
       lineitem l
 WHERE c.c_custkey = o.o_custkey AND 
       l.l_suppkey = s.s_suppkey AND 
       l.l_orderkey = o.o_orderkey AND 
       o.o_totalprice = (
                            SELECT MAX(o.o_totalprice) 
                              FROM orders o
                             WHERE o.o_orderstatus = 'F'
                        );

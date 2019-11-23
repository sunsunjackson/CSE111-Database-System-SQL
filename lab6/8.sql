SELECT COUNT(C.c_custkey) 
  FROM customer C,
       (
           SELECT c_custkey
             FROM customer,
                  nation,
                  orders,
                  region,
                  supplier
            WHERE c_custkey = o_custkey AND 
                  c_nationkey = n_nationkey AND 
                  n_nationkey = s_nationkey AND 
                  n_regionkey = r_regionkey AND 
                  r_name = 'ASIA'
            GROUP BY c_custkey
           HAVING COUNT(o_orderkey) >= 1
       )
       T
 WHERE T.c_custkey = C.c_custkey;



SELECT COUNT(DISTINCT c_custkey) 
  FROM customer c,
       orders o
 WHERE c.c_custkey = o.o_custkey AND 
       o.o_orderkey NOT IN (
           SELECT DISTINCT o_orderkey
             FROM lineitem l,
                  orders o,
                  supplier s,
                  nation n,
                  region r
            WHERE l.l_orderkey = o.o_orderkey AND 
                  s.s_suppkey = l.l_suppkey AND 
                  s.s_nationkey = n.n_nationkey AND 
                  r.r_regionkey = n.n_regionkey AND 
                  r.r_name NOT IN ('ASIA') 
       );

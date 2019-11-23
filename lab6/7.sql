SELECT COUNT(DISTINCT S.s_suppkey) 
  FROM customer C,
       lineitem L,
       nation N,
       orders O,
       supplier S,
       (
           SELECT s.s_suppkey AS TT
             FROM supplier s,
                  customer c,
                  orders o,
                  lineitem l,
                  nation n
            WHERE s.s_suppkey = l.l_suppkey AND 
                  l.l_orderkey = o.o_orderkey AND 
                  c.c_custkey = o.o_custkey AND 
                  c.c_nationkey = n.n_nationkey AND 
                  (n.n_name = 'GERMANY' OR 
                   n.n_name = 'FRANCE') 
            GROUP BY s.s_name
           HAVING COUNT(DISTINCT o.o_orderkey) < 30
       )
       T
 WHERE C.c_custkey = O.o_custkey AND 
       L.l_orderkey = O.o_orderkey AND 
       N.n_nationkey = C.c_nationkey AND 
       S.s_suppkey = L.l_suppkey AND 
       T.TT = S.s_suppkey;

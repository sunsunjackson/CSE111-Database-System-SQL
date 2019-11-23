SELECT DISTINCT P.p_name
  FROM Part P,
       lineitem L
 WHERE P.p_partkey = L.l_partkey AND 
       L.l_orderkey IN (
           SELECT o_orderkey
             FROM customer,
                  orders,
                  nation,
                  region
            WHERE c_custkey = o_custkey AND 
                  c_nationkey = n_nationkey AND 
                  r_regionkey = n_regionkey AND 
                  r_name = 'AMERICA'
       )
AND 
       p_partkey IN (
           SELECT l_partkey
             FROM lineitem,
                  supplier,
                  nation,
                  region
            WHERE l_suppkey = s_suppkey AND 
                  n_nationkey = s_nationkey AND 
                  r_regionkey = n_regionkey AND 
                  r_name = 'ASIA'
            GROUP BY l_partkey
           HAVING COUNT(DISTINCT s_suppkey) = 4
       )
       ORDER BY P.p_name;

SELECT n_name
  FROM (
           SELECT n_name,
                  sum(l_extendedprice) AS T
             FROM nation,
                  supplier,
                  partsupp,
                  lineitem
            WHERE n_nationkey = s_nationkey AND 
                  s_suppkey = ps_suppkey AND 
                  ps_suppkey = l_suppkey AND 
                  l_shipdate LIKE '1996%'
            GROUP BY n_name
       )
 ORDER BY T DESC
 LIMIT 1;

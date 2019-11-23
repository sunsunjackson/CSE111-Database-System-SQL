SELECT n_name
  FROM (
           SELECT n_name,
                  sum(o_totalprice) AS T
             FROM nation,
                  customer,
                  orders
            WHERE n_nationkey = c_nationkey AND 
                  c_custkey = o_custkey
            GROUP BY n_name
       )
 ORDER BY T DESC
 LIMIT 1;

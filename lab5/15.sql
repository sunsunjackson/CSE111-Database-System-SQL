SELECT SUM(l_extendedprice * (1 - l_discount) ) / (
  SELECT SUM(l_extendedprice * (1 - l_discount) ) 
    FROM lineitem,
         supplier,
         customer,
         nation nation1,
         nation nation2,
         region,
         orders
   WHERE c_nationkey = nation1.n_nationkey AND 
         nation1.n_regionkey = r_regionkey AND 
         r_name = 'EUROPE' AND 
         s_nationkey = nation2.n_nationkey AND 
         nation2.n_name NOT IN (
             SELECT r_name
               FROM region
              WHERE r_name = 'UNITED STATES'
         )
AND 
         l_shipdate LIKE '1996-%%-%%' AND 
         c_custkey = o_custkey AND 
         o_orderkey = l_orderkey AND 
         l_suppkey = s_suppkey
)
  FROM lineitem,
       supplier,
       customer,
       nation nation1,
       nation nation2,
       region,
       orders
 WHERE c_nationkey = nation1.n_nationkey AND 
       nation1.n_regionkey = r_regionkey AND 
       s_nationkey = nation2.n_nationkey AND 
       r_name = 'EUROPE' AND 
       nation2.n_name = 'UNITED STATES' AND 
       l_shipdate LIKE '1996-%%-%%' AND 
       c_custkey = o_custkey AND 
       o_orderkey = l_orderkey AND 
       l_suppkey = s_suppkey;

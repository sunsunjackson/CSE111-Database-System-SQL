SELECT r_name
  FROM (
           SELECT r_name,
                  max(tot_price) 
             FROM (
                      SELECT R.r_name AS r_name,
                             sum(L.l_extendedprice) AS tot_price
                        FROM customer C,
                             lineitem L,
                             nation N1,
                             nation N2,
                             region R,
                             supplier S
                       WHERE C.c_nationkey = N1.n_nationkey AND 
                             R.r_regionkey = N1.n_regionkey AND 
                             L.l_suppkey = S.s_suppkey AND 
                             S.s_nationkey = N1.n_nationkey AND 
                             R.r_regionkey = N2.n_regionkey
                       GROUP BY R.r_name
                  )
                  T
       );

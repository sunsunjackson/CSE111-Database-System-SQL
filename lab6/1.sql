SELECT strftime("%m", L.l_shipdate),
       AVG(L.l_quantity) 
  FROM lineitem L
 WHERE strftime("%Y", L.l_shipdate) = '1996'
 GROUP BY strftime("%m", L.l_shipdate);

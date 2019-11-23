SELECT N.n_name, COUNT(DISTINCT O.o_orderkey)
FROM nation N, orders O, region R, supplier S, lineitem L
WHERE N.n_nationkey = S.s_nationkey and S.s_suppkey = L.l_suppkey
AND L.l_orderkey = O.o_orderkey and N.n_regionkey = R.r_regionkey
AND R.r_name = 'AMERICA' AND O.o_orderdate LIKE '1995%'
AND O.o_orderstatus = 'F' 
GROUP BY N.n_name;
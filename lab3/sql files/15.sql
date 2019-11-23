SELECT N.n_name, substr(O.o_orderdate,1,4), COUNT(O.o_orderpriority)
FROM lineitem L, nation N, orders O, supplier S
WHERE L.l_suppkey = S.s_suppkey AND O.o_orderkey = L.l_orderkey
AND N.n_nationkey = S.s_nationkey AND O.o_orderpriority = '3-MEDIUM'
GROUP BY N.n_name, substr(O.o_orderdate,1,4);
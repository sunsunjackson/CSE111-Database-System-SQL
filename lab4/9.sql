SELECT COUNT(DISTINCT O.o_clerk)
FROM nation N, lineitem L, orders O, supplier S
WHERE N.n_nationkey = S.s_nationkey AND L.l_orderkey = O.o_orderkey
AND S.s_suppkey = L.l_suppkey
AND N.n_name = 'RUSSIA';
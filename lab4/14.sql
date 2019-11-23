SELECT R1.r_name, R2.r_name, SUM(L.l_extendedprice)
FROM region R1, region R2, lineitem L, nation N1, nation N2, supplier S, customer C, orders O
WHERE S.s_suppkey = L.l_suppkey AND N1.n_regionkey = R1.r_regionkey
AND N2.n_regionkey = R2.r_regionkey AND N1.n_nationkey = S.s_nationkey
AND N2.n_nationkey = C.c_nationkey AND C.c_custkey = O.o_custkey
AND O.o_orderkey = L.l_orderkey
GROUP BY R1.r_name, R2.r_name;
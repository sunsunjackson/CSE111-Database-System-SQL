SELECT MAX(DISTINCT l_discount) FROM lineitem L, orders O
WHERE L.l_orderkey = O.o_orderkey AND O.o_orderdate LIKE '1995-05%'
AND L.l_discount < (SELECT AVG(l_discount)
FROM lineitem);
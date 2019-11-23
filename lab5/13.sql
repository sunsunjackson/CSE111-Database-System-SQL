SELECT O.o_orderpriority, COUNT(DISTINCT O.o_orderkey)
FROM lineitem L, orders O
WHERE L.l_orderkey = O.o_orderkey
AND O.o_orderdate BETWEEN '1996-10-01' AND '1996-12-31'
AND  L.l_receiptdate > L.l_commitdate
GROUP BY O.o_orderpriority
ORDER BY O.o_orderpriority ASC;
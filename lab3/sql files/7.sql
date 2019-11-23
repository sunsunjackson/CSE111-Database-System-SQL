SELECT L.l_receiptdate, COUNT(L.l_quantity) FROM customer C, lineitem L, orders O
WHERE C.c_custkey = O.o_custkey AND L.l_orderkey = O.o_orderkey
AND C.c_name = 'Customer#000000118' GROUP BY L.l_receiptdate;
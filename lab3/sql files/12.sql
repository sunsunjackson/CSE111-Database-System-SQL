SELECT R.r_name, COUNT(O.o_orderstatus)
FROM orders O, customer C, nation N, region R
WHERE C.c_custkey = O.o_custkey AND N.n_regionkey = R.r_regionkey 
AND C.c_nationkey = N.n_nationkey AND O.o_orderstatus = 'F' 
GROUP BY R.r_name
ORDER BY COUNT(O.o_orderstatus) DESC;
SELECT c_address, c_phone FROM customer_index WHERE c_name = 'Customer#000000227';

SELECT c_address, c_phone FROM customer_noindex WHERE c_name = 'Customer#000000227';

SELECT s_name, MIN(s_acctbal) FROM supplier_index;

SELECT s_name, MIN(s_acctbal) FROM supplier_noindex;

SELECT l_quantity, l_extendedprice FROM lineitem_index WHERE l_returnflag = 'N' AND l_shipdate = '1995-09-25';

SELECT l_quantity, l_extendedprice FROM lineitem_noindex WHERE l_returnflag = 'N' AND l_shipdate = '1995-09-25';

SELECT MAX(julianday(l_shipdate)-julianday(l_commitdate)) FROM lineitem_index;

SELECT MAX(julianday(l_shipdate)-julianday(l_commitdate)) FROM lineitem_noindex;

SELECT MIN(c_acctbal), MAX(c_acctbal) FROM customer_index WHERE c_mktsegment = 'BUILDING';

SELECT MIN(c_acctbal), MAX(c_acctbal) FROM customer_noindex WHERE c_mktsegment = 'BUILDING';

SELECT DISTINCT n_name FROM nation, customer_noindex, orders_noindex 
WHERE c_nationkey = n_nationkey AND c_custkey = o_custkey AND o_orderdate LIKE '1996-12%'; 

SELECT L.l_receiptdate, COUNT(L.l_quantity) FROM customer_noindex C, lineitem_noindex L, orders_noindex O
WHERE C.c_custkey = O.o_custkey AND L.l_orderkey = O.o_orderkey
AND C.c_name = 'Customer#000000118' GROUP BY L.l_receiptdate;

SELECT S.s_name, S.s_acctbal FROM supplier_noindex S, region R, nation N WHERE N.n_nationkey = S.s_nationkey
AND N.n_regionkey = R.r_regionkey AND R.r_name = 'ASIA' AND S.s_acctbal >= 1000;

SELECT N.n_name, COUNT(S.s_name), AVG(S.s_acctbal) FROM nation N, supplier_noindex S
WHERE N.n_nationkey = S.s_nationkey GROUP BY N.n_name HAVING COUNT (S.s_name) >= 5;

SELECT SUM(O.o_totalprice) FROM orders_noindex O, customer_noindex C, nation N, region R
WHERE C.c_custkey = O.o_custkey AND N.n_regionkey = R.r_regionkey
AND C.c_nationkey = N.n_nationkey
AND R.r_name = 'EUROPE' AND O.o_orderdate LIKE '1996%';

SELECT COUNT(DISTINCT C.c_name) FROM customer_noindex C, lineitem_noindex L, orders_noindex O
WHERE C.c_custkey = O.o_custkey AND L.l_orderkey = O.o_orderkey
AND L.l_discount >= 0.04;

SELECT R.r_name, COUNT(O.o_orderstatus)
FROM orders_noindex O, customer_noindex C, nation N, region R
WHERE C.c_custkey = O.o_custkey AND N.n_regionkey = R.r_regionkey 
AND C.c_nationkey = N.n_nationkey AND O.o_orderstatus = 'F' 
GROUP BY R.r_name
ORDER BY COUNT(O.o_orderstatus) DESC;

SELECT AVG(C.c_acctbal) FROM customer_noindex C, nation N, region R
WHERE C.c_nationkey = N.n_nationkey AND N.n_regionkey = R.r_regionkey
AND R.r_name = 'EUROPE' AND C.c_mktsegment = 'MACHINERY';

SELECT COUNT(O.o_orderpriority) FROM customer_noindex C, nation N, orders_noindex O
WHERE C.c_custkey = O.o_custkey AND C.c_nationkey = N.n_nationkey
AND O.o_orderpriority = '1-URGENT' AND N.n_name = 'BRAZIL' 
AND O.o_orderdate BETWEEN '1994%' AND '1997-31-12';

SELECT N.n_name, substr(O.o_orderdate,1,4), COUNT(O.o_orderpriority)
FROM lineitem_noindex L, nation N, orders_noindex O, supplier_noindex S
WHERE L.l_suppkey = S.s_suppkey AND O.o_orderkey = L.l_orderkey
AND N.n_nationkey = S.s_nationkey AND O.o_orderpriority = '3-MEDIUM'
GROUP BY N.n_name, substr(O.o_orderdate,1,4);
SELECT Q1.c_nation, COUNT(o_orderstatus)
FROM Q1, orders
WHERE Q1.c_custkey = o_custkey
AND c_region = 'EUROPE'
GROUP BY Q1.c_nation;
SELECT Q1.c_nation, Q5.o_orderstatus, COUNT(Q1.c_name)
FROM Q1, Q5
WHERE Q1.c_custkey = Q5.o_custkey
AND Q1.c_region = 'ASIA'
GROUP BY Q1.c_nation, Q5.o_orderstatus;
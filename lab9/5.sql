CREATE VIEW Q5 AS
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate AS o_orderyear,
o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders;

SELECT Q1.c_name, COUNT(Q5.o_orderstatus)
FROM Q1, Q5
WHERE Q5.o_custkey = Q1.c_custkey
AND Q1.c_nation = 'GERMANY' AND Q5.o_orderyear LIKE '1995%'
GROUP BY Q1.c_name;
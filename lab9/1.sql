CREATE VIEW Q1 AS
SELECT c_custkey, c_name, c_address, c_phone, c_acctbal, c_mktsegment, c_comment,
n_name AS c_nation, r_name AS c_region
FROM customer, region, nation
WHERE customer.c_nationkey = nation.n_nationkey AND nation.n_regionkey = region.r_regionkey;

SELECT Q1.c_name, SUM(O.o_totalprice), Q1.c_nation
FROM Q1, orders O
WHERE Q1.c_custkey = O.o_custkey
AND Q1.c_nation = 'FRANCE'
GROUP BY Q1.c_name;
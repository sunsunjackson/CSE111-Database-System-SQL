CREATE VIEW Q2 AS
SELECT s_suppkey, s_name, s_address, s_phone, s_acctbal, s_comment, n_name AS s_nation,
r_name AS s_region
FROM supplier, nation, region
WHERE s_nationkey = n_nationkey AND n_regionkey = r_regionkey;

SELECT Q2.s_nation, COUNT(Q2.s_name)
FROM Q2 GROUP BY s_nation;
SELECT s_region, c_region, SUM(ROUND(l_extendedprice))
FROM Q1, Q2, lineitem, orders
WHERE
l_orderkey = o_orderkey AND
o_custkey = c_custkey AND
l_suppkey = s_suppkey
GROUP BY s_region, c_region;
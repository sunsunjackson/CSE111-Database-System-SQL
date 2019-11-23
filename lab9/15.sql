SELECT COUNT(DISTINCT o_orderkey)
FROM Q151, Q152, orders, lineitem
WHERE
l_orderkey == o_orderkey AND
o_custkey == c_custkey AND
l_suppkey NOT IN (SELECT s_suppkey FROM Q152)
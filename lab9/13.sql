select count(o_orderkey) from
(select distinct o_orderkey from orders, Q2, lineitem
where s_suppkey = l_suppkey and l_orderkey = o_orderkey and s_region = 'EUROPE' 
INTERSECT
select distinct o_orderkey from orders, Q1
where c_custkey = o_custkey and c_nation = 'CANADA');
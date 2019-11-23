SELECT count(distinct o_orderkey)
from orders, supplier, customer, lineitem
where c_custkey = o_custkey and s_suppkey = l_suppkey
and l_orderkey = o_orderkey
and c_acctbal < 0 and s_acctbal >= 0;
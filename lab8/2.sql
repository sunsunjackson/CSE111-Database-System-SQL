INSERT INTO customer_index(c_custkey, c_name, c_address, c_nationkey, c_phone,
c_acctbal, c_mktsegment, c_comment)
VALUES(1, '1', '1', 1, '111111', 10, 'customer_mktsegment_index', '10');

INSERT INTO lineitem_index(l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity,
l_extendedprice, l_discount, l_tax, l_returnflag, l_linestatus, l_shipdate,
l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment)
VALUES(1, 1, 1, 1, 1, '1', '1', '1', 'lineitem_returnflag_index', '1', '1',
'1', '1', '1', '1', '1');

INSERT INTO orders_index(o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate,
o_orderpriority, o_clerk, o_shippriority, o_comment)
VALUES(1, 1, '1', 1, '1', 'orders_priority_index', '1', '1', '1');
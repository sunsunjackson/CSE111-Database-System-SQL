INSERT INTO customer_index(c_custkey, c_name, c_address, c_nationkey, c_phone,
c_acctbal, c_mktsegment, c_comment)
VALUES(1, 'customer_name_index', '1', 1, '111111', 10, '10', '10');

INSERT INTO customer_index(c_custkey, c_name, c_address, c_nationkey, c_phone,
c_acctbal, c_mktsegment, c_comment)
SELECT c_custkey, c_name, c_address, c_nationkey, c_phone, c_acctbal, c_mktsegment,
c_comment
FROM customer;

INSERT INTO customer_noindex(c_custkey, c_name, c_address, c_nationkey, c_phone,
c_acctbal, c_mktsegment, c_comment)
SELECT c_custkey, c_name, c_address, c_nationkey, c_phone, c_acctbal, c_mktsegment,
c_comment
FROM customer;

INSERT INTO supplier_index(s_suppkey, s_name, s_address, s_nationkey, s_phone, s_acctbal,
s_comment)
VALUES(1, '1', '1', 1, '1111', 'supplier_acctbal_index', '1');

INSERT INTO supplier_index(s_suppkey, s_name, s_address, s_nationkey, s_phone, s_acctbal,
s_comment)
SELECT s_suppkey, s_name, s_address, s_nationkey, s_phone, s_acctbal, s_comment
FROM supplier;

INSERT INTO supplier_noindex(s_suppkey, s_name, s_address, s_nationkey, s_phone, s_acctbal,
s_comment)
SELECT s_suppkey, s_name, s_address, s_nationkey, s_phone, s_acctbal, s_comment
FROM supplier;

INSERT INTO orders_index(o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate,
o_orderpriority, o_clerk, o_shippriority, o_comment)
VALUES(1, 1, '1', 1, 'orders_orderdate_index', '1', '1', '1', '1');

INSERT INTO orders_index(o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate,
o_orderpriority, o_clerk, o_shippriority, o_comment)
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate,
o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders;

INSERT INTO orders_noindex(o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate,
o_orderpriority, o_clerk, o_shippriority, o_comment)
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate,
o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders;

INSERT INTO lineitem_index(l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity,
l_extendedprice, l_discount, l_tax, l_returnflag, l_linestatus, l_shipdate,
l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment)
VALUES(1, 1, 1, 1, 1, '1', 'lineitem_discount_index', '1', '1', '1', '1',
'1', '1', '1', '1', '1');

INSERT INTO lineitem_index(l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity,
l_extendedprice, l_discount, l_tax, l_returnflag, l_linestatus, l_shipdate,
l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment)
SELECT l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity,
l_extendedprice, l_discount, l_tax, l_returnflag, l_linestatus, l_shipdate,
l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment
FROM lineitem;

INSERT INTO lineitem_noindex(l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity,
l_extendedprice, l_discount, l_tax, l_returnflag, l_linestatus, l_shipdate,
l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment)
SELECT l_orderkey, l_partkey, l_suppkey, l_linenumber, l_quantity,
l_extendedprice, l_discount, l_tax, l_returnflag, l_linestatus, l_shipdate,
l_commitdate, l_receiptdate, l_shipinstruct, l_shipmode, l_comment
FROM lineitem;
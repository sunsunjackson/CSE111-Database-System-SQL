UPDATE lineitem_index
SET l_discount = l_discount + 0.05;

UPDATE lineitem_noindex
SET l_discount = l_discount + 0.05;

UPDATE supplier_index
SET s_acctbal = s_acctbal + 1000;

UPDATE supplier_noindex
SET s_acctbal = s_acctbal + 1000;
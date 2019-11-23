select max((l_extendedprice * (1-l_discount)))
from lineitem
where l_shipdate > '1994-10-02';
SELECT COUNT(DISTINCT C.c_custkey) 
  FROM customer C,
       orders O,
       (
           SELECT C.c_custkey AS TT
             FROM customer C,
                  orders O
            WHERE C.c_custkey = O.o_custkey AND 
                  O.o_orderdate LIKE '1995-08%'
            GROUP BY C.c_custkey
           HAVING COUNT(C.c_custkey) <= 2
       )
       T
 WHERE C.c_custkey = O.o_custkey AND 
       T.TT = C.c_custkey;
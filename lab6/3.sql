SELECT COUNT(DISTINCT P.p_partkey) 
  FROM nation N,
       part P,
       partsupp PS,
       supplier S,
       (
           SELECT p_partkey AS TT
             FROM nation,
                  part,
                  partsupp,
                  supplier
            WHERE n_nationkey = s_nationkey AND 
                  p_partkey = ps_partkey AND 
                  ps_suppkey = s_suppkey AND 
                  n_name = 'CANADA'
            GROUP BY p_partkey
           HAVING COUNT(s_name) > 1
       ) T
 WHERE N.n_nationkey = S.s_nationkey AND 
       P.p_partkey = PS.ps_partkey AND 
       PS.ps_suppkey = S.s_suppkey AND
       T.TT = P.p_partkey;

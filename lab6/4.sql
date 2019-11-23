SELECT COUNT(DISTINCT S.s_name) 
  FROM nation N,
       part P,
       partsupp PS,
       supplier S,
       (
           SELECT (s_name) AS TT
             FROM nation,
                  part,
                  partsupp,
                  supplier
            WHERE n_nationkey = s_nationkey AND 
                  p_partkey = ps_partkey AND 
                  ps_suppkey = s_suppkey AND
                  n_name = 'CANADA'
                  GROUP BY s_name
                  HAVING COUNT(p_name) >= 4
       )T
 WHERE N.n_nationkey = S.s_nationkey AND
       P.p_partkey = PS.ps_partkey AND 
       PS.ps_suppkey = S.s_suppkey AND
       T.TT = S.s_name;

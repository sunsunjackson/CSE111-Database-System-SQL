SELECT COUNT(P.p_name) 
  FROM nation N,
       part P,
       partsupp PS,
       supplier S
 WHERE S.s_nationkey = N.n_nationkey AND 
       S.s_suppkey = PS.p_ssuppkey AND 
       P.p_partkey = PS.p_spartkey AND 
       N.n_name = 'CANADA' AND 
       PS.p_ssupplycost * PS.p_savailqty IN
       (
           SELECT PS.p_ssupplycost * PS.p_savailqty
             FROM partsupp PS
            ORDER BY PS.p_ssupplycost * PS.p_savailqty DESC
            LIMIT (
                      SELECT COUNT( * ) * 0.03
                        FROM partsupp PS
                  )
       );

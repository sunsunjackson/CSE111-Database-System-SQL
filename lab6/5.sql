SELECT COUNT(DISTINCT S.s_suppkey) 
  FROM part P,
       partsupp PS,
       supplier S
 WHERE P.p_partkey = PS.ps_partkey AND 
       PS.ps_suppkey = S.s_suppkey AND 
       P.p_retailprice = (
             SELECT MIN(p_retailprice) 
               FROM part
                         );

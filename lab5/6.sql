SELECT P.p_mfgr FROM
(SELECT P.p_mfgr, MIN(PS.p_savailqty)
FROM part P, partsupp PS, supplier S
WHERE PS.p_spartkey = P.p_partkey AND S.s_suppkey = PS.p_ssuppkey
AND S.s_name = 'Supplier#000000053');
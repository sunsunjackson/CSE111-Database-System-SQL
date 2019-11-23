SELECT S.s_name, S.s_acctbal FROM supplier S, region R, nation N WHERE N.n_nationkey = S.s_nationkey
AND N.n_regionkey = R.r_regionkey AND R.r_name = 'ASIA' AND S.s_acctbal >= 1000;
SELECT N.n_name, COUNT(S.s_name), AVG(S.s_acctbal) FROM nation N, supplier S
WHERE N.n_nationkey = S.s_nationkey GROUP BY N.n_name HAVING COUNT (S.s_name) >= 5;
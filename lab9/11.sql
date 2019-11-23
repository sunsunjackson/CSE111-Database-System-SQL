SELECT Q2.s_region, Q2.s_name
FROM Q2
GROUP BY Q2.s_region HAVING MAX(Q2.s_acctbal);
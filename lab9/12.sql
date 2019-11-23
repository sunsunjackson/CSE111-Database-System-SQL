SELECT Q2.s_region, MAX(Q2.s_acctbal)
FROM Q2
GROUP BY Q2.s_region;
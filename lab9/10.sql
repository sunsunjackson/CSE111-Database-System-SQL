CREATE VIEW Q10 AS
SELECT p_type, MAX(l_discount) AS max_discount
FROM lineitem, part
WHERE lineitem.l_partkey = part.p_partkey
GROUP BY p_type;

SELECT Q10.p_type, max_discount
FROM Q10
WHERE Q10.p_type LIKE 'ECONOMY%'
GROUP BY Q10.p_type;
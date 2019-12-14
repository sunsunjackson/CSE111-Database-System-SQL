/* 1 */
SELECT s_address
FROM sender
WHERE s_sid = 1;

/* 2 */
select count(r_name) from recipient where r_address like 'a%';

/* 3 */
select count (e_eid) from emails, recipient, sender where r_name = s_name;


/* 4 */
select count(c_eid) from sender, category, emails 
where e_eid = s_sid and s_sid = 1 and c_name = 'Social';


/* 5 */
select count(e_sid) from sender, emails where e_date = '2019-11%' and s_sid = e_sid;

/* 6 */
select count (distinct s_sid) from sender, recipient where r_rid = 2;

/* 7 */
select count(e_eid) from sender, emails where e_sid = s_sid and s_sid = 1;

/* 8 */
select count (r_rid) from sender, recipient where r_address = s_address;

/* 9 */
select r_address, r_name from recipient where r_rid = 4;

/* 10 */
select s_address from sender, emails where e_date = '2019-11-11' and s_sid = e_sid;

/* 11 */
SELECT s_name FROM sender, emails
WHERE s_sid = e_sid
GROUP BY s_name
HAVING e_subject LIKE '%p%'

/* 12 */
SELECT COUNT(DISTINCT f_fid) FROM folder;

/* 13 */
SELECT COUNT(f_eid) FROM folder;

/* 14 */
SELECT COUNT(e_eid) FROM emails, sender, recipient
WHERE e_sid = s_sid AND e_rid = r_rid
AND s_name = 'DropBox' AND r_name = 'ZhuohongJackson Chen';

/* 15 */
SELECT COUNT(e_eid) FROM emails, sender
WHERE e_sid = s_sid
AND s_sid = 1 AND e_date LIKE '2019%';

/* 16 */
SELECT e_date FROM emails, sender
WHERE s_sid = 1 GROUP BY s_name
HAVING MAX(e_date);

/* 17 */
SELECT AVG(e_eid) FROM emails;

/* 18 */
SELECT COUNT(e_eid) FROM emails, sender
WHERE e_sid = s_sid
AND s_name = 'Joyce Truong'

/* 19 */
select count (n_nid) 
from recipient, note, emails 
where r_rid = 3 and n_rid = r_rid 
and n_rid = e_rid;

/* 20 */
select f_name from folder group by f_name;
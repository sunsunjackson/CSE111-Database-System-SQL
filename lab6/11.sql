SELECT n_name
  FROM nation,
       customer
 WHERE c_nationkey = n_nationkey
 GROUP BY n_name
HAVING count( * ) = (
                        SELECT max(n_cust) 
                          FROM (
                                   SELECT n_name,
                                          count( * ) AS n_cust
                                     FROM customer,
                                          nation
                                    WHERE c_nationkey = n_nationkey
                                    GROUP BY n_name
                               )
                    );

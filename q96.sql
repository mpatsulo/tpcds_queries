SELECT count(*)
FROM tpcds.store_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.store
WHERE ss_sold_time_sk = tpcds.time_dim.t_time_sk
  AND ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
  AND ss_store_sk = s_store_sk
  AND tpcds.time_dim.t_hour = 20
  AND tpcds.time_dim.t_minute >= 30
  AND tpcds.household_demographics.hd_dep_count = 7
  AND tpcds.store.s_store_name = 'ese'
ORDER BY count(*)
LIMIT 100

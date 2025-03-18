SELECT count(*)
FROM tpcds_sf1.store_sales, tpcds_sf1.household_demographics, tpcds_sf1.time_dim, tpcds_sf1.store
WHERE ss_sold_time_sk = tpcds_sf1.time_dim.t_time_sk
  AND ss_hdemo_sk = tpcds_sf1.household_demographics.hd_demo_sk
  AND ss_store_sk = s_store_sk
  AND tpcds_sf1.time_dim.t_hour = 20
  AND tpcds_sf1.time_dim.t_minute >= 30
  AND tpcds_sf1.household_demographics.hd_dep_count = 7
  AND tpcds_sf1.store.s_store_name = 'ese'
ORDER BY count(*)
LIMIT 100

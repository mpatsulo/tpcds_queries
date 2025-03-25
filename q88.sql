SELECT *
FROM
  (SELECT count(*) h8_30_to_9
  FROM tpcds.store_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.store
  WHERE ss_sold_time_sk = tpcds.time_dim.t_time_sk
    AND ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND ss_store_sk = s_store_sk
    AND tpcds.time_dim.t_hour = 8
    AND tpcds.time_dim.t_minute >= 30
    AND (
    (tpcds.household_demographics.hd_dep_count = 4 AND tpcds.household_demographics.hd_vehicle_count <= 4 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 2 AND tpcds.household_demographics.hd_vehicle_count <= 2 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 0 AND
        tpcds.household_demographics.hd_vehicle_count <= 0 + 2))
    AND tpcds.store.s_store_name = 'ese') s1,
  (SELECT count(*) h9_to_9_30
  FROM tpcds.store_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.store
  WHERE ss_sold_time_sk = tpcds.time_dim.t_time_sk
    AND ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND ss_store_sk = s_store_sk
    AND tpcds.time_dim.t_hour = 9
    AND tpcds.time_dim.t_minute < 30
    AND (
    (tpcds.household_demographics.hd_dep_count = 4 AND tpcds.household_demographics.hd_vehicle_count <= 4 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 2 AND tpcds.household_demographics.hd_vehicle_count <= 2 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 0 AND
        tpcds.household_demographics.hd_vehicle_count <= 0 + 2))
    AND tpcds.store.s_store_name = 'ese') s2,
  (SELECT count(*) h9_30_to_10
  FROM tpcds.store_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.store
  WHERE ss_sold_time_sk = tpcds.time_dim.t_time_sk
    AND ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND ss_store_sk = s_store_sk
    AND tpcds.time_dim.t_hour = 9
    AND tpcds.time_dim.t_minute >= 30
    AND (
    (tpcds.household_demographics.hd_dep_count = 4 AND tpcds.household_demographics.hd_vehicle_count <= 4 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 2 AND tpcds.household_demographics.hd_vehicle_count <= 2 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 0 AND
        tpcds.household_demographics.hd_vehicle_count <= 0 + 2))
    AND tpcds.store.s_store_name = 'ese') s3,
  (SELECT count(*) h10_to_10_30
  FROM tpcds.store_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.store
  WHERE ss_sold_time_sk = tpcds.time_dim.t_time_sk
    AND ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND ss_store_sk = s_store_sk
    AND tpcds.time_dim.t_hour = 10
    AND tpcds.time_dim.t_minute < 30
    AND (
    (tpcds.household_demographics.hd_dep_count = 4 AND tpcds.household_demographics.hd_vehicle_count <= 4 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 2 AND tpcds.household_demographics.hd_vehicle_count <= 2 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 0 AND
        tpcds.household_demographics.hd_vehicle_count <= 0 + 2))
    AND tpcds.store.s_store_name = 'ese') s4,
  (SELECT count(*) h10_30_to_11
  FROM tpcds.store_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.store
  WHERE ss_sold_time_sk = tpcds.time_dim.t_time_sk
    AND ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND ss_store_sk = s_store_sk
    AND tpcds.time_dim.t_hour = 10
    AND tpcds.time_dim.t_minute >= 30
    AND (
    (tpcds.household_demographics.hd_dep_count = 4 AND tpcds.household_demographics.hd_vehicle_count <= 4 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 2 AND tpcds.household_demographics.hd_vehicle_count <= 2 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 0 AND
        tpcds.household_demographics.hd_vehicle_count <= 0 + 2))
    AND tpcds.store.s_store_name = 'ese') s5,
  (SELECT count(*) h11_to_11_30
  FROM tpcds.store_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.store
  WHERE ss_sold_time_sk = tpcds.time_dim.t_time_sk
    AND ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND ss_store_sk = s_store_sk
    AND tpcds.time_dim.t_hour = 11
    AND tpcds.time_dim.t_minute < 30
    AND (
    (tpcds.household_demographics.hd_dep_count = 4 AND tpcds.household_demographics.hd_vehicle_count <= 4 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 2 AND tpcds.household_demographics.hd_vehicle_count <= 2 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 0 AND
        tpcds.household_demographics.hd_vehicle_count <= 0 + 2))
    AND tpcds.store.s_store_name = 'ese') s6,
  (SELECT count(*) h11_30_to_12
  FROM tpcds.store_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.store
  WHERE ss_sold_time_sk = tpcds.time_dim.t_time_sk
    AND ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND ss_store_sk = s_store_sk
    AND tpcds.time_dim.t_hour = 11
    AND tpcds.time_dim.t_minute >= 30
    AND (
    (tpcds.household_demographics.hd_dep_count = 4 AND tpcds.household_demographics.hd_vehicle_count <= 4 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 2 AND tpcds.household_demographics.hd_vehicle_count <= 2 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 0 AND
        tpcds.household_demographics.hd_vehicle_count <= 0 + 2))
    AND tpcds.store.s_store_name = 'ese') s7,
  (SELECT count(*) h12_to_12_30
  FROM tpcds.store_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.store
  WHERE ss_sold_time_sk = tpcds.time_dim.t_time_sk
    AND ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND ss_store_sk = s_store_sk
    AND tpcds.time_dim.t_hour = 12
    AND tpcds.time_dim.t_minute < 30
    AND (
    (tpcds.household_demographics.hd_dep_count = 4 AND tpcds.household_demographics.hd_vehicle_count <= 4 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 2 AND tpcds.household_demographics.hd_vehicle_count <= 2 + 2)
      OR
      (tpcds.household_demographics.hd_dep_count = 0 AND
        tpcds.household_demographics.hd_vehicle_count <= 0 + 2))
    AND tpcds.store.s_store_name = 'ese') s8

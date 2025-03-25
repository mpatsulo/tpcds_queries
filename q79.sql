SELECT
  c_last_name,
  c_first_name,
  substr(s_city, 1, 30),
  ss_ticket_number,
  amt,
  profit
FROM
  (SELECT
    ss_ticket_number,
    ss_customer_sk,
    tpcds.store.s_city,
    sum(ss_coupon_amt) amt,
    sum(ss_net_profit) profit
  FROM tpcds.store_sales, tpcds.date_dim, tpcds.store, tpcds.household_demographics
  WHERE tpcds.store_sales.ss_sold_date_sk = tpcds.date_dim.d_date_sk
    AND tpcds.store_sales.ss_store_sk = tpcds.store.s_store_sk
    AND tpcds.store_sales.ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND (tpcds.household_demographics.hd_dep_count = 6 OR
    tpcds.household_demographics.hd_vehicle_count > 2)
    AND tpcds.date_dim.d_dow = 1
    AND tpcds.date_dim.d_year IN (1999, 1999 + 1, 1999 + 2)
    AND tpcds.store.s_number_employees BETWEEN 200 AND 295
  GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, tpcds.store.s_city) ms, tpcds.customer
WHERE ss_customer_sk = c_customer_sk
ORDER BY c_last_name, c_first_name, substr(s_city, 1, 30), profit
LIMIT 100

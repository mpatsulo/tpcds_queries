SELECT
  c_last_name,
  c_first_name,
  ca_city,
  bought_city,
  ss_ticket_number,
  amt,
  profit
FROM
  (SELECT
    ss_ticket_number,
    ss_customer_sk,
    ca_city bought_city,
    sum(ss_coupon_amt) amt,
    sum(ss_net_profit) profit
  FROM tpcds.store_sales, tpcds.date_dim, tpcds.store, tpcds.household_demographics, tpcds.customer_address
  WHERE tpcds.store_sales.ss_sold_date_sk = tpcds.date_dim.d_date_sk
    AND tpcds.store_sales.ss_store_sk = tpcds.store.s_store_sk
    AND tpcds.store_sales.ss_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND tpcds.store_sales.ss_addr_sk = tpcds.customer_address.ca_address_sk
    AND (tpcds.household_demographics.hd_dep_count = 4 OR
    tpcds.household_demographics.hd_vehicle_count = 3)
    AND tpcds.date_dim.d_dow IN (6, 0)
    AND tpcds.date_dim.d_year IN (1999, 1999 + 1, 1999 + 2)
    AND tpcds.store.s_city IN ('Fairview', 'Midway', 'Fairview', 'Fairview', 'Fairview')
  GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, ca_city) dn, tpcds.customer,
  tpcds.customer_address current_addr
WHERE ss_customer_sk = c_customer_sk
  AND tpcds.customer.c_current_addr_sk = current_addr.ca_address_sk
  AND current_addr.ca_city <> bought_city
ORDER BY c_last_name, c_first_name, ca_city, bought_city, ss_ticket_number
LIMIT 100

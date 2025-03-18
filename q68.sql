SELECT
  c_last_name,
  c_first_name,
  ca_city,
  bought_city,
  ss_ticket_number,
  extended_price,
  extended_tax,
  list_price
FROM (SELECT
  ss_ticket_number,
  ss_customer_sk,
  ca_city bought_city,
  sum(ss_ext_sales_price) extended_price,
  sum(ss_ext_list_price) list_price,
  sum(ss_ext_tax) extended_tax
FROM tpcds_sf1.store_sales, tpcds_sf1.date_dim, tpcds_sf1.store, tpcds_sf1.household_demographics, tpcds_sf1.customer_address
WHERE tpcds_sf1.store_sales.ss_sold_date_sk = tpcds_sf1.date_dim.d_date_sk
  AND tpcds_sf1.store_sales.ss_store_sk = tpcds_sf1.store.s_store_sk
  AND tpcds_sf1.store_sales.ss_hdemo_sk = tpcds_sf1.household_demographics.hd_demo_sk
  AND tpcds_sf1.store_sales.ss_addr_sk = tpcds_sf1.customer_address.ca_address_sk
  AND tpcds_sf1.date_dim.d_dom BETWEEN 1 AND 2
  AND (tpcds_sf1.household_demographics.hd_dep_count = 4 OR
  tpcds_sf1.household_demographics.hd_vehicle_count = 3)
  AND tpcds_sf1.date_dim.d_year IN (1999, 1999 + 1, 1999 + 2)
  AND tpcds_sf1.store.s_city IN ('Midway', 'Fairview')
GROUP BY ss_ticket_number, ss_customer_sk, ss_addr_sk, ca_city) dn,
  tpcds_sf1.customer,
  tpcds_sf1.customer_address current_addr
WHERE ss_customer_sk = c_customer_sk
  AND tpcds_sf1.customer.c_current_addr_sk = current_addr.ca_address_sk
  AND current_addr.ca_city <> bought_city
ORDER BY c_last_name, ss_ticket_number
LIMIT 100

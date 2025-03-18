SELECT count(*)
FROM ((SELECT DISTINCT
  c_last_name,
  c_first_name,
  d_date
FROM tpcds_sf1.store_sales, tpcds_sf1.date_dim, tpcds_sf1.customer
WHERE tpcds_sf1.store_sales.ss_sold_date_sk = tpcds_sf1.date_dim.d_date_sk
  AND tpcds_sf1.store_sales.ss_customer_sk = tpcds_sf1.customer.c_customer_sk
  AND d_month_seq BETWEEN 1200 AND 1200 + 11)
      EXCEPT
      (SELECT DISTINCT
        c_last_name,
        c_first_name,
        d_date
      FROM tpcds_sf1.catalog_sales, tpcds_sf1.date_dim, tpcds_sf1.customer
      WHERE tpcds_sf1.catalog_sales.cs_sold_date_sk = tpcds_sf1.date_dim.d_date_sk
        AND tpcds_sf1.catalog_sales.cs_bill_customer_sk = tpcds_sf1.customer.c_customer_sk
        AND d_month_seq BETWEEN 1200 AND 1200 + 11)
      EXCEPT
      (SELECT DISTINCT
        c_last_name,
        c_first_name,
        d_date
      FROM tpcds_sf1.web_sales, tpcds_sf1.date_dim, tpcds_sf1.customer
      WHERE tpcds_sf1.web_sales.ws_sold_date_sk = tpcds_sf1.date_dim.d_date_sk
        AND tpcds_sf1.web_sales.ws_bill_customer_sk = tpcds_sf1.customer.c_customer_sk
        AND d_month_seq BETWEEN 1200 AND 1200 + 11)
     ) cool_cust

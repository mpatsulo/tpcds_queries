SELECT count(*)
FROM ((SELECT DISTINCT
  c_last_name,
  c_first_name,
  d_date
FROM tpcds.store_sales, tpcds.date_dim, tpcds.customer
WHERE tpcds.store_sales.ss_sold_date_sk = tpcds.date_dim.d_date_sk
  AND tpcds.store_sales.ss_customer_sk = tpcds.customer.c_customer_sk
  AND d_month_seq BETWEEN 1200 AND 1200 + 11)
      EXCEPT
      (SELECT DISTINCT
        c_last_name,
        c_first_name,
        d_date
      FROM tpcds.catalog_sales, tpcds.date_dim, tpcds.customer
      WHERE tpcds.catalog_sales.cs_sold_date_sk = tpcds.date_dim.d_date_sk
        AND tpcds.catalog_sales.cs_bill_customer_sk = tpcds.customer.c_customer_sk
        AND d_month_seq BETWEEN 1200 AND 1200 + 11)
      EXCEPT
      (SELECT DISTINCT
        c_last_name,
        c_first_name,
        d_date
      FROM tpcds.web_sales, tpcds.date_dim, tpcds.customer
      WHERE tpcds.web_sales.ws_sold_date_sk = tpcds.date_dim.d_date_sk
        AND tpcds.web_sales.ws_bill_customer_sk = tpcds.customer.c_customer_sk
        AND d_month_seq BETWEEN 1200 AND 1200 + 11)
     ) cool_cust

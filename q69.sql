SELECT
  cd_gender,
  cd_marital_status,
  cd_education_status,
  count(*) cnt1,
  cd_purchase_estimate,
  count(*) cnt2,
  cd_credit_rating,
  count(*) cnt3
FROM
  tpcds.customer c, tpcds.customer_address ca, tpcds.customer_demographics
WHERE
  c.c_current_addr_sk = ca.ca_address_sk AND
    ca_state IN ('KY', 'GA', 'NM') AND
    cd_demo_sk = c.c_current_cdemo_sk AND
    exists(SELECT *
           FROM tpcds.store_sales, tpcds.date_dim
           WHERE c.c_customer_sk = ss_customer_sk AND
             ss_sold_date_sk = d_date_sk AND
             d_year = 2001 AND
             d_moy BETWEEN 4 AND 4 + 2) AND
    (NOT exists(SELECT *
                FROM tpcds.web_sales, tpcds.date_dim
                WHERE c.c_customer_sk = ws_bill_customer_sk AND
                  ws_sold_date_sk = d_date_sk AND
                  d_year = 2001 AND
                  d_moy BETWEEN 4 AND 4 + 2) AND
      NOT exists(SELECT *
                 FROM tpcds.catalog_sales, tpcds.date_dim
                 WHERE c.c_customer_sk = cs_ship_customer_sk AND
                   cs_sold_date_sk = d_date_sk AND
                   d_year = 2001 AND
                   d_moy BETWEEN 4 AND 4 + 2))
GROUP BY cd_gender, cd_marital_status, cd_education_status,
  cd_purchase_estimate, cd_credit_rating
ORDER BY cd_gender, cd_marital_status, cd_education_status,
  cd_purchase_estimate, cd_credit_rating
LIMIT 100

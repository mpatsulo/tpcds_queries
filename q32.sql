SELECT 1 AS "excess discount amount "
FROM
  tpcds.catalog_sales, tpcds.item, tpcds.date_dim
WHERE
  i_manufact_id = 977
    AND i_item_sk = cs_item_sk
    AND d_date BETWEEN '2000-01-27' AND (cast('2000-01-27' AS DATE) + interval '90 days')
    AND d_date_sk = cs_sold_date_sk
    AND cs_ext_discount_amt > (
    SELECT 1.3 * avg(cs_ext_discount_amt)
    FROM tpcds.catalog_sales, tpcds.date_dim
    WHERE cs_item_sk = i_item_sk
      AND d_date BETWEEN '2000-01-27]' AND (cast('2000-01-27' AS DATE) + interval '90 days')
      AND d_date_sk = cs_sold_date_sk)
LIMIT 100

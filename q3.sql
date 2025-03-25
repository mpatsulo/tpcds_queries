SELECT
  dt.d_year,
  tpcds.item.i_brand_id brand_id,
  tpcds.item.i_brand brand,
  SUM(ss_ext_sales_price) sum_agg
FROM tpcds.date_dim dt, tpcds.store_sales, tpcds.item
WHERE dt.d_date_sk = tpcds.store_sales.ss_sold_date_sk
  AND tpcds.store_sales.ss_item_sk = tpcds.item.i_item_sk
  AND tpcds.item.i_manufact_id = 128
  AND dt.d_moy = 11
GROUP BY dt.d_year, tpcds.item.i_brand, tpcds.item.i_brand_id
ORDER BY dt.d_year, sum_agg DESC, brand_id
LIMIT 100

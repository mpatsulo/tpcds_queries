SELECT
  dt.d_year,
  tpcds.item.i_brand_id brand_id,
  tpcds.item.i_brand brand,
  sum(ss_ext_sales_price) ext_price
FROM tpcds.date_dim dt, tpcds.store_sales, tpcds.item
WHERE dt.d_date_sk = tpcds.store_sales.ss_sold_date_sk
  AND tpcds.store_sales.ss_item_sk = tpcds.item.i_item_sk
  AND tpcds.item.i_manager_id = 1
  AND dt.d_moy = 11
  AND dt.d_year = 2000
GROUP BY dt.d_year, tpcds.item.i_brand, tpcds.item.i_brand_id
ORDER BY dt.d_year, ext_price DESC, brand_id
LIMIT 100

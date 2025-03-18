SELECT
  dt.d_year,
  tpcds_sf1.item.i_category_id,
  tpcds_sf1.item.i_category,
  sum(ss_ext_sales_price)
FROM tpcds_sf1.date_dim dt, tpcds_sf1.store_sales, tpcds_sf1.item
WHERE dt.d_date_sk = tpcds_sf1.store_sales.ss_sold_date_sk
  AND tpcds_sf1.store_sales.ss_item_sk = tpcds_sf1.item.i_item_sk
  AND tpcds_sf1.item.i_manager_id = 1
  AND dt.d_moy = 11
  AND dt.d_year = 2000
GROUP BY dt.d_year
  , tpcds_sf1.item.i_category_id
  , tpcds_sf1.item.i_category
ORDER BY sum(ss_ext_sales_price) DESC, dt.d_year
  , tpcds_sf1.item.i_category_id
  , tpcds_sf1.item.i_category
LIMIT 100

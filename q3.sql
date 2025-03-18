SELECT
  dt.d_year,
  tpcds_sf1.item.i_brand_id brand_id,
  tpcds_sf1.item.i_brand brand,
  SUM(ss_ext_sales_price) sum_agg
FROM tpcds_sf1.date_dim dt, tpcds_sf1.store_sales, tpcds_sf1.item
WHERE dt.d_date_sk = tpcds_sf1.store_sales.ss_sold_date_sk
  AND tpcds_sf1.store_sales.ss_item_sk = tpcds_sf1.item.i_item_sk
  AND tpcds_sf1.item.i_manufact_id = 128
  AND dt.d_moy = 11
GROUP BY dt.d_year, tpcds_sf1.item.i_brand, tpcds_sf1.item.i_brand_id
ORDER BY dt.d_year, sum_agg DESC, brand_id
LIMIT 100

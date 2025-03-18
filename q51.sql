WITH web_v1 AS (
  SELECT
    ws_item_sk item_sk,
    d_date,
    sum(sum(ws_sales_price))
    OVER (PARTITION BY ws_item_sk
      ORDER BY d_date
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cume_sales
  FROM tpcds_sf1.web_sales, tpcds_sf1.date_dim
  WHERE ws_sold_date_sk = d_date_sk
    AND d_month_seq BETWEEN 1200 AND 1200 + 11
    AND ws_item_sk IS NOT NULL
  GROUP BY ws_item_sk, d_date),
    store_v1 AS (
    SELECT
      ss_item_sk item_sk,
      d_date,
      sum(sum(ss_sales_price))
      OVER (PARTITION BY ss_item_sk
        ORDER BY d_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cume_sales
    FROM tpcds_sf1.store_sales, tpcds_sf1.date_dim
    WHERE ss_sold_date_sk = d_date_sk
      AND d_month_seq BETWEEN 1200 AND 1200 + 11
      AND ss_item_sk IS NOT NULL
    GROUP BY ss_item_sk, d_date)
SELECT *
FROM (SELECT
  item_sk,
  d_date,
  web_sales,
  store_sales,
  max(web_sales)
  OVER (PARTITION BY item_sk
    ORDER BY d_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) web_cumulative,
  max(store_sales)
  OVER (PARTITION BY item_sk
    ORDER BY d_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) store_cumulative
FROM (SELECT
  CASE WHEN wb.item_sk IS NOT NULL
    THEN wb.item_sk
  ELSE str.item_sk END item_sk,
  CASE WHEN wb.d_date IS NOT NULL
    THEN wb.d_date
  ELSE str.d_date END d_date,
  wb.cume_sales web_sales,
  str.cume_sales store_sales
FROM web_v1 wb FULL OUTER JOIN store_v1 str ON (wb.item_sk = str.item_sk
  AND wb.d_date = str.d_date)
     ) x) y
WHERE web_cumulative > store_cumulative
ORDER BY item_sk, d_date
LIMIT 100

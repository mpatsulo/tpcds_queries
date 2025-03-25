SELECT cast(amc AS DECIMAL(15, 4)) / cast(pmc AS DECIMAL(15, 4)) am_pm_ratio
FROM (SELECT count(*) amc
FROM tpcds.web_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.web_page
WHERE ws_sold_time_sk = tpcds.time_dim.t_time_sk
  AND ws_ship_hdemo_sk = tpcds.household_demographics.hd_demo_sk
  AND ws_web_page_sk = tpcds.web_page.wp_web_page_sk
  AND tpcds.time_dim.t_hour BETWEEN 8 AND 8 + 1
  AND tpcds.household_demographics.hd_dep_count = 6
  AND tpcds.web_page.wp_char_count BETWEEN 5000 AND 5200) at,
  (SELECT count(*) pmc
  FROM tpcds.web_sales, tpcds.household_demographics, tpcds.time_dim, tpcds.web_page
  WHERE ws_sold_time_sk = tpcds.time_dim.t_time_sk
    AND ws_ship_hdemo_sk = tpcds.household_demographics.hd_demo_sk
    AND ws_web_page_sk = tpcds.web_page.wp_web_page_sk
    AND tpcds.time_dim.t_hour BETWEEN 19 AND 19 + 1
    AND tpcds.household_demographics.hd_dep_count = 6
    AND tpcds.web_page.wp_char_count BETWEEN 5000 AND 5200) pt
ORDER BY am_pm_ratio
LIMIT 100

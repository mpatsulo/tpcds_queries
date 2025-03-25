SELECT
  count(DISTINCT cs_order_number) AS "order count ",
  sum(cs_ext_ship_cost) AS "total shipping cost ",
  sum(cs_net_profit) AS "total net profit "
FROM
  tpcds.catalog_sales cs1, tpcds.date_dim, tpcds.customer_address, tpcds.call_center
WHERE
  d_date BETWEEN '2002-02-01' AND (CAST('2002-02-01' AS DATE) + INTERVAL '60 days')
    AND cs1.cs_ship_date_sk = d_date_sk
    AND cs1.cs_ship_addr_sk = ca_address_sk
    AND ca_state = 'GA'
    AND cs1.cs_call_center_sk = cc_call_center_sk
    AND cc_county IN
    ('Williamson County', 'Williamson County', 'Williamson County', 'Williamson County', 'Williamson County')
    AND EXISTS(SELECT *
               FROM tpcds.catalog_sales cs2
               WHERE cs1.cs_order_number = cs2.cs_order_number
                 AND cs1.cs_warehouse_sk <> cs2.cs_warehouse_sk)
    AND NOT EXISTS(SELECT *
                   FROM tpcds.catalog_returns cr1
                   WHERE cs1.cs_order_number = cr1.cr_order_number)
ORDER BY count(DISTINCT cs_order_number)
LIMIT 100

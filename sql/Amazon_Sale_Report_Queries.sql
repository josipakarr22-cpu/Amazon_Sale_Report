-- ============================================================
-- Amazon_Sale_Report | SQL Analysis Queries + Outputs
-- ============================================================
-- Source: notebooks/Amazon_Sale_Report_SQL.ipynb
-- Database: SQLite
-- Table: amazon_sales
--
-- Each query below is followed by the actual output captured
-- from the executed SQL notebook. Outputs are SQL comments so
-- this file remains executable while being fully reviewable on GitHub.
-- ============================================================

-- Query 1
SELECT name
FROM sqlite_master
WHERE type = 'table';

-- OUTPUT
--            name
-- 0  amazon_sales


-- Query 2
PRAGMA table_info(amazon_sales);

-- OUTPUT
--     cid                name       type  notnull dflt_value  pk
-- 0     0            order_id       TEXT        0       None   0
-- 1     1                date  TIMESTAMP        0       None   0
-- 2     2              status       TEXT        0       None   0
-- 3     3          fulfilment       TEXT        0       None   0
-- 4     4       sales_channel       TEXT        0       None   0
-- 5     5  ship_service_level       TEXT        0       None   0
-- 6     6               style       TEXT        0       None   0
-- 7     7                 sku       TEXT        0       None   0
-- 8     8            category       TEXT        0       None   0
-- 9     9                size       TEXT        0       None   0
-- 10   10                asin       TEXT        0       None   0
-- 11   11      courier_status       TEXT        0       None   0
-- 12   12                 qty    INTEGER        0       None   0
-- 13   13            currency       TEXT        0       None   0
-- 14   14              amount       REAL        0       None   0
-- 15   15           ship_city       TEXT        0       None   0
-- 16   16          ship_state       TEXT        0       None   0
-- 17   17    ship_postal_code    INTEGER        0       None   0
-- 18   18        ship_country       TEXT        0       None   0
-- 19   19       promotion_ids       TEXT        0       None   0
-- 20   20                 b2b    INTEGER        0       None   0
-- 21   21        fulfilled_by       TEXT        0       None   0
-- 22   22                year    INTEGER        0       None   0
-- 23   23               month    INTEGER        0       None   0
-- 24   24          month_name       TEXT        0       None   0
-- 25   25             quarter    INTEGER        0       None   0
-- 26   26         order_month       TEXT        0       None   0
-- 27   27        is_cancelled    INTEGER        0       None   0
-- 28   28         is_returned    INTEGER        0       None   0
-- 29   29       has_promotion    INTEGER        0       None   0
-- 30   30        status_group       TEXT        0       None   0


-- Query 3
SELECT *
FROM amazon_sales
LIMIT 10;

-- OUTPUT
--               order_id                 date                        status  \
-- 0  405-8078784-5731545  2022-04-30 00:00:00                     Cancelled   
-- 1  171-9198151-1101146  2022-04-30 00:00:00  Shipped - Delivered to Buyer   
-- 2  404-0687676-7273146  2022-04-30 00:00:00                       Shipped   
-- 3  403-9615377-8133951  2022-04-30 00:00:00                     Cancelled   
-- 4  407-1069790-7240320  2022-04-30 00:00:00                       Shipped   
-- 5  404-1490984-4578765  2022-04-30 00:00:00                       Shipped   
-- 6  408-5748499-6859555  2022-04-30 00:00:00                       Shipped   
-- 7  406-7807733-3785945  2022-04-30 00:00:00  Shipped - Delivered to Buyer   
-- 8  407-5443024-5233168  2022-04-30 00:00:00                     Cancelled   
-- 9  402-4393761-0311520  2022-04-30 00:00:00                       Shipped   
-- 
--   fulfilment sales_channel ship_service_level    style                  sku  \
-- 0   Merchant     Amazon.in           Standard   SET389       SET389-KR-NP-S   
-- 1   Merchant     Amazon.in           Standard  JNE3781      JNE3781-KR-XXXL   
-- 2     Amazon     Amazon.in          Expedited  JNE3371        JNE3371-KR-XL   
-- 3   Merchant     Amazon.in           Standard    J0341           J0341-DR-L   
-- 4     Amazon     Amazon.in          Expedited  JNE3671      JNE3671-TU-XXXL   
-- 5     Amazon     Amazon.in          Expedited   SET264      SET264-KR-NP-XL   
-- 6     Amazon     Amazon.in          Expedited    J0095          J0095-SET-L   
-- 7   Merchant     Amazon.in           Standard  JNE3405         JNE3405-KR-S   
-- 8     Amazon     Amazon.in          Expedited   SET200  SET200-KR-NP-A-XXXL   
-- 9     Amazon     Amazon.in          Expedited  JNE3461       JNE3461-KR-XXL   
-- 
--         category size  ... fulfilled_by  year  month month_name  quarter  \
-- 0            Set    S  ...    Easy Ship  2022      4      April        2   
-- 1          kurta  3XL  ...    Easy Ship  2022      4      April        2   
-- 2          kurta   XL  ...          NaN  2022      4      April        2   
-- 3  Western Dress    L  ...    Easy Ship  2022      4      April        2   
-- 4            Top  3XL  ...          NaN  2022      4      April        2   
-- 5            Set   XL  ...          NaN  2022      4      April        2   
-- 6            Set    L  ...          NaN  2022      4      April        2   
-- 7          kurta    S  ...    Easy Ship  2022      4      April        2   
-- 8            Set  3XL  ...          NaN  2022      4      April        2   
-- 9          kurta  XXL  ...          NaN  2022      4      April        2   
-- 
--   order_month is_cancelled  is_returned has_promotion         status_group  
-- 0     2022-04            1            0             0            Cancelled  
-- 1     2022-04            0            0             1  Completed / Shipped  
-- 2     2022-04            0            0             1  Completed / Shipped  
-- 3     2022-04            1            0             0            Cancelled  
-- 4     2022-04            0            0             0  Completed / Shipped  
-- 5     2022-04            0            0             1  Completed / Shipped  
-- 6     2022-04            0            0             1  Completed / Shipped  
-- 7     2022-04            0            0             1  Completed / Shipped  
-- 8     2022-04            1            0             1            Cancelled  
-- 9     2022-04            0            0             0  Completed / Shipped  
-- 
-- [10 rows x 31 columns]


-- Query 4
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM amazon_sales;

-- OUTPUT
--    total_orders
-- 0        120378


-- Query 5
SELECT
    COUNT(*) AS order_lines,
    COUNT(DISTINCT order_id) AS unique_orders
FROM amazon_sales;

-- OUTPUT
--    order_lines  unique_orders
-- 0       128969         120378


-- Query 6
SELECT
    order_month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(qty) AS total_units,
    ROUND(SUM(amount), 2) AS sales_amount
FROM amazon_sales
GROUP BY order_month
ORDER BY order_month;

-- OUTPUT
--   order_month  total_orders  total_units  sales_amount
-- 0     2022-03           158          156     101683.85
-- 1     2022-04         45858        44206   28838708.32
-- 2     2022-05         39221        38009   26225004.75
-- 3     2022-06         35141        34275   23424646.38


-- Query 7
SELECT
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(qty) AS total_units,
    ROUND(SUM(amount), 2) AS sales_amount
FROM amazon_sales
GROUP BY category
ORDER BY sales_amount DESC;

-- OUTPUT
--         category  total_orders  total_units  sales_amount
-- 0            Set         47845        45287   39202022.03
-- 1          kurta         46561        45044   21299013.70
-- 2  Western Dress         14994        13943   11216072.69
-- 3            Top         10155         9903    5347792.30
-- 4   Ethnic Dress          1148         1053     791217.66
-- 5         Blouse           897          863     458408.18
-- 6         Bottom           410          398     150667.98
-- 7          Saree           144          152     123933.76
-- 8        Dupatta             2            3        915.00


-- Query 8
SELECT
    COUNT(DISTINCT order_id) AS cancelled_orders
FROM amazon_sales
WHERE status = 'Cancelled';

-- OUTPUT
--    cancelled_orders
-- 0             17185


-- Query 9
SELECT
    COUNT(DISTINCT CASE
        WHEN status = 'Cancelled' THEN order_id
    END) AS cancelled_orders,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN status = 'Cancelled' THEN order_id
        END)
        / COUNT(DISTINCT order_id),
        2
    ) AS cancellation_rate
FROM amazon_sales;

-- OUTPUT
--    cancelled_orders  total_orders  cancellation_rate
-- 0             17185        120378              14.28


-- Query 10
SELECT
    status_group,
    COUNT(DISTINCT order_id) AS total_orders
FROM amazon_sales
GROUP BY status_group
ORDER BY total_orders DESC;

-- OUTPUT
--                  status_group  total_orders
-- 0         Completed / Shipped        100342
-- 1                   Cancelled         17185
-- 2  Returned / Failed Delivery          1997
-- 3                     Pending           854


-- Query 11
SELECT
    CASE
        WHEN status = 'Cancelled' THEN 'Cancelled'
        ELSE 'Not Cancelled'
    END AS cancellation_group,
    COUNT(DISTINCT order_id) AS total_orders
FROM amazon_sales
GROUP BY cancellation_group
ORDER BY total_orders DESC;

-- OUTPUT
--   cancellation_group  total_orders
-- 0      Not Cancelled        103193
-- 1          Cancelled         17185


-- Query 12
SELECT
    category,
    COUNT(DISTINCT order_id) AS total_orders
FROM amazon_sales
GROUP BY category
HAVING COUNT(DISTINCT order_id) > 1000
ORDER BY total_orders DESC;

-- OUTPUT
--         category  total_orders
-- 0            Set         47845
-- 1          kurta         46561
-- 2  Western Dress         14994
-- 3            Top         10155
-- 4   Ethnic Dress          1148


-- Query 13
SELECT
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(amount), 2) AS sales_amount,
    ROUND(
        SUM(amount) / COUNT(DISTINCT order_id),
        2
    ) AS aov
FROM amazon_sales
GROUP BY category
ORDER BY aov DESC;

-- OUTPUT
--         category  total_orders  sales_amount     aov
-- 0          Saree           144     123933.76  860.65
-- 1            Set         47845   39202022.03  819.35
-- 2  Western Dress         14994   11216072.69  748.04
-- 3   Ethnic Dress          1148     791217.66  689.21
-- 4            Top         10155    5347792.30  526.62
-- 5         Blouse           897     458408.18  511.05
-- 6        Dupatta             2        915.00  457.50
-- 7          kurta         46561   21299013.70  457.44
-- 8         Bottom           410     150667.98  367.48


-- Query 14
SELECT
    category,
    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT CASE
        WHEN status = 'Cancelled' THEN order_id
    END) AS cancelled_orders

FROM amazon_sales

GROUP BY category

ORDER BY cancelled_orders DESC;

-- OUTPUT
--         category  total_orders  cancelled_orders
-- 0            Set         47845              6990
-- 1          kurta         46561              6818
-- 2  Western Dress         14994              2070
-- 3            Top         10155              1231
-- 4   Ethnic Dress          1148               144
-- 5         Blouse           897               113
-- 6         Bottom           410                54
-- 7          Saree           144                21
-- 8        Dupatta             2                 0


-- Query 15
SELECT
    category,

    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT CASE
        WHEN status = 'Cancelled' THEN order_id
    END) AS cancelled_orders,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN status = 'Cancelled' THEN order_id
        END)
        / COUNT(DISTINCT order_id),
        2
    ) AS cancellation_rate

FROM amazon_sales

GROUP BY category

ORDER BY cancellation_rate DESC;

-- OUTPUT
--         category  total_orders  cancelled_orders  cancellation_rate
-- 0          kurta         46561              6818              14.64
-- 1            Set         47845              6990              14.61
-- 2          Saree           144                21              14.58
-- 3  Western Dress         14994              2070              13.81
-- 4         Bottom           410                54              13.17
-- 5         Blouse           897               113              12.60
-- 6   Ethnic Dress          1148               144              12.54
-- 7            Top         10155              1231              12.12
-- 8        Dupatta             2                 0               0.00


-- Query 16
SELECT
    category,
    COUNT(*) AS order_lines,
    SUM(qty) AS total_units,
    ROUND(AVG(qty), 2) AS avg_qty_per_line
FROM amazon_sales
GROUP BY category
ORDER BY avg_qty_per_line DESC;

-- OUTPUT
--         category  order_lines  total_units  avg_qty_per_line
-- 0        Dupatta            3            3              1.00
-- 1            Top        10622         9903              0.93
-- 2          Saree          164          152              0.93
-- 3         Blouse          926          863              0.93
-- 4   Ethnic Dress         1159         1053              0.91
-- 5          kurta        49874        45044              0.90
-- 6  Western Dress        15500        13943              0.90
-- 7            Set        50281        45287              0.90
-- 8         Bottom          440          398              0.90


-- Query 17
SELECT
    CASE
        WHEN has_promotion = 1 THEN 'With Promotion'
        ELSE 'Without Promotion'
    END AS promotion_group,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(SUM(amount), 2) AS sales_amount

FROM amazon_sales

GROUP BY promotion_group

ORDER BY sales_amount DESC;

-- OUTPUT
--      promotion_group  total_orders  sales_amount
-- 0     With Promotion         73464    53585800.0
-- 1  Without Promotion         46937    25004243.3


-- Query 18
SELECT
    CASE
        WHEN has_promotion = 1 THEN 'With Promotion'
        ELSE 'Without Promotion'
    END AS promotion_group,

    COUNT(DISTINCT order_id) AS total_orders,

    COUNT(DISTINCT CASE
        WHEN status = 'Cancelled' THEN order_id
    END) AS cancelled_orders,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN status = 'Cancelled' THEN order_id
        END)
        / COUNT(DISTINCT order_id),
        2
    ) AS cancellation_rate

FROM amazon_sales

GROUP BY promotion_group

ORDER BY cancellation_rate DESC;

-- OUTPUT
--      promotion_group  total_orders  cancelled_orders  cancellation_rate
-- 0  Without Promotion         46937             16914              36.04
-- 1     With Promotion         73464               271               0.37


-- Query 19
SELECT
    fulfilment,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(SUM(amount), 2) AS sales_amount,

    COUNT(DISTINCT CASE
        WHEN status = 'Cancelled' THEN order_id
    END) AS cancelled_orders,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN status = 'Cancelled' THEN order_id
        END)
        / COUNT(DISTINCT order_id),
        2
    ) AS cancellation_rate

FROM amazon_sales

GROUP BY fulfilment

ORDER BY sales_amount DESC;

-- OUTPUT
--   fulfilment  total_orders  sales_amount  cancelled_orders  cancellation_rate
-- 0     Amazon         84002    54319516.0             10803              12.86
-- 1   Merchant         36376    24270527.3              6382              17.54


-- Query 20
SELECT
    ship_state,

    COUNT(DISTINCT order_id) AS total_orders,

    SUM(qty) AS total_units,

    ROUND(SUM(amount), 2) AS sales_amount

FROM amazon_sales

GROUP BY ship_state

ORDER BY sales_amount DESC
LIMIT 10;

-- OUTPUT
--        ship_state  total_orders  total_units  sales_amount
-- 0     MAHARASHTRA         20780        20327   13334595.14
-- 1       KARNATAKA         16182        15901   10481114.37
-- 2       TELANGANA         10405        10253    6916615.65
-- 3   UTTAR PRADESH         10062         9498    6816109.08
-- 4      TAMIL NADU         10519        10412    6515650.11
-- 5           DELHI          6359         6156    4235215.97
-- 6          KERALA          6105         5813    3830227.58
-- 7     WEST BENGAL          5653         5318    3507880.44
-- 8  ANDHRA PRADESH          4979         4819    3219831.72
-- 9         HARYANA          4142         4066    2882092.99


-- Query 21
SELECT
    ship_state,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(SUM(amount), 2) AS sales_amount,

    COUNT(DISTINCT CASE
        WHEN status = 'Cancelled' THEN order_id
    END) AS cancelled_orders,

    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN status = 'Cancelled' THEN order_id
        END)
        / COUNT(DISTINCT order_id),
        2
    ) AS cancellation_rate

FROM amazon_sales

GROUP BY ship_state

ORDER BY sales_amount DESC

LIMIT 10;

-- OUTPUT
--        ship_state  total_orders  sales_amount  cancelled_orders  \
-- 0     MAHARASHTRA         20780   13334595.14              2778   
-- 1       KARNATAKA         16182   10481114.37              2097   
-- 2       TELANGANA         10405    6916615.65              1505   
-- 3   UTTAR PRADESH         10062    6816109.08              1531   
-- 4      TAMIL NADU         10519    6515650.11              1440   
-- 5           DELHI          6359    4235215.97               828   
-- 6          KERALA          6105    3830227.58              1086   
-- 7     WEST BENGAL          5653    3507880.44               846   
-- 8  ANDHRA PRADESH          4979    3219831.72               815   
-- 9         HARYANA          4142    2882092.99               525   
-- 
--    cancellation_rate  
-- 0              13.37  
-- 1              12.96  
-- 2              14.46  
-- 3              15.22  
-- 4              13.69  
-- 5              13.02  
-- 6              17.79  
-- 7              14.97  
-- 8              16.37  
-- 9              12.68


-- Query 22
SELECT
    category,
    ROUND(SUM(amount), 2) AS sales_amount
FROM amazon_sales
GROUP BY category
HAVING SUM(amount) > (
    SELECT AVG(category_sales)
    FROM (
        SELECT
            SUM(amount) AS category_sales
        FROM amazon_sales
        GROUP BY category
    )
)
ORDER BY sales_amount DESC;

-- OUTPUT
--         category  sales_amount
-- 0            Set   39202022.03
-- 1          kurta   21299013.70
-- 2  Western Dress   11216072.69


-- Query 23
WITH category_sales AS (
    SELECT
        category,
        SUM(amount) AS sales_amount
    FROM amazon_sales
    GROUP BY category
)

SELECT
    category,
    ROUND(sales_amount, 2) AS sales_amount
FROM category_sales
WHERE sales_amount > (
    SELECT AVG(sales_amount)
    FROM category_sales
)
ORDER BY sales_amount DESC;

-- OUTPUT
--         category  sales_amount
-- 0            Set   39202022.03
-- 1          kurta   21299013.70
-- 2  Western Dress   11216072.69


-- Query 24
SELECT
    category,
    ROUND(SUM(amount), 2) AS sales_amount,

    RANK() OVER (
        ORDER BY SUM(amount) DESC
    ) AS sales_rank

FROM amazon_sales

GROUP BY category

ORDER BY sales_rank;

-- OUTPUT
--         category  sales_amount  sales_rank
-- 0            Set   39202022.03           1
-- 1          kurta   21299013.70           2
-- 2  Western Dress   11216072.69           3
-- 3            Top    5347792.30           4
-- 4   Ethnic Dress     791217.66           5
-- 5         Blouse     458408.18           6
-- 6         Bottom     150667.98           7
-- 7          Saree     123933.76           8
-- 8        Dupatta        915.00           9


-- Query 25
SELECT
    category,
    ROUND(SUM(amount), 2) AS sales_amount,

    ROW_NUMBER() OVER (
        ORDER BY SUM(amount) DESC
    ) AS row_number

FROM amazon_sales

GROUP BY category

ORDER BY row_number;

-- OUTPUT
--         category  sales_amount  row_number
-- 0            Set   39202022.03           1
-- 1          kurta   21299013.70           2
-- 2  Western Dress   11216072.69           3
-- 3            Top    5347792.30           4
-- 4   Ethnic Dress     791217.66           5
-- 5         Blouse     458408.18           6
-- 6         Bottom     150667.98           7
-- 7          Saree     123933.76           8
-- 8        Dupatta        915.00           9


-- Query 26
SELECT
    category,
    sku,
    ROUND(SUM(amount), 2) AS sales_amount,

    RANK() OVER (
        PARTITION BY category
        ORDER BY SUM(amount) DESC
    ) AS sku_rank

FROM amazon_sales

GROUP BY
    category,
    sku

ORDER BY
    category,
    sku_rank;

-- OUTPUT
--    category            sku  sales_amount  sku_rank
-- 0    Blouse     J0217-BL-M      24288.90         1
-- 1    Blouse     J0217-BL-L      20908.33         2
-- 2    Blouse     J0217-BL-S      20670.99         3
-- 3    Blouse    J0217-BL-XL      20212.00         4
-- 4    Blouse  BL021-71BLACK      16745.00         5
-- 5    Blouse     J0219-BL-M      15460.48         6
-- 6    Blouse   J0219-BL-XXL      13543.00         7
-- 7    Blouse   J0215-BL-XXL      13374.00         8
-- 8    Blouse     J0216-BL-S      12082.00         9
-- 9    Blouse     J0219-BL-S      12007.92        10
-- 10   Blouse    J0216-BL-XL      11213.00        11
-- 11   Blouse   J0216-BL-XXL      10798.24        12
-- 12   Blouse    J0219-BL-XL      10787.91        13
-- 13   Blouse     J0215-BL-M      10510.05        14
-- 14   Blouse   J0217-BL-XXL      10323.00        15
-- 15   Blouse    J0220-BL-XL       9482.00        16
-- 16   Blouse     J0216-BL-M       9204.48        17
-- 17   Blouse     J0216-BL-L       8920.00        18
-- 18   Blouse     J0219-BL-L       8502.00        19
-- 19   Blouse     J0215-BL-S       8452.10        20


-- Query 27
WITH sku_ranking AS (
    SELECT
        category,
        sku,
        ROUND(SUM(amount), 2) AS sales_amount,

        RANK() OVER (
            PARTITION BY category
            ORDER BY SUM(amount) DESC
        ) AS sku_rank

    FROM amazon_sales

    GROUP BY
        category,
        sku
)

SELECT
    category,
    sku,
    sales_amount,
    sku_rank

FROM sku_ranking

WHERE sku_rank <= 3

ORDER BY
    category,
    sku_rank;

-- OUTPUT
--          category                         sku  sales_amount  sku_rank
-- 0          Blouse                  J0217-BL-M      24288.90         1
-- 1          Blouse                  J0217-BL-L      20908.33         2
-- 2          Blouse                  J0217-BL-S      20670.99         3
-- 3          Bottom                 BTM038-PP-S       2989.90         1
-- 4          Bottom              BTM039-PP-XXXL       2862.86         2
-- 5          Bottom                 BTM039-PP-M       2828.58         3
-- 6         Dupatta                      DPT052        305.00         1
-- 7         Dupatta                      DPT041        305.00         1
-- 8         Dupatta                      DPT032        305.00         1
-- 9    Ethnic Dress                 J0006-SET-M      73072.95         1
-- 10   Ethnic Dress                J0006-SET-XL      51465.48         2
-- 11   Ethnic Dress                 J0006-SET-S      50827.04         3
-- 12          Saree                      SAR069      13124.57         1
-- 13          Saree                      SAR062       6193.19         2
-- 14          Saree  JNE09210-PINK-SR-JP8101RNV       5154.00         3
-- 15            Set                 J0230-SKD-M     526536.20         1
-- 16            Set                 J0230-SKD-S     479937.14         2
-- 17            Set                 J0230-SKD-L     305616.95         3
-- 18            Top               J0119-TP-XXXL      99739.16         1
-- 19            Top                 J0119-TP-XL      99432.00         2
-- 20            Top                J0119-TP-XXL      93150.29         3
-- 21  Western Dress                JNE3797-KR-L     524581.77         1
-- 22  Western Dress                JNE3797-KR-M     454290.16         2
-- 23  Western Dress                JNE3797-KR-S     407302.57         3
-- 24          kurta                JNE3405-KR-L     194645.29         1
-- 25          kurta                JNE3405-KR-S     169808.87         2
-- 26          kurta                JNE3405-KR-M     146626.29         3


-- Query 28
SELECT
    category,
    ROUND(SUM(amount), 2) AS sales_amount,

    ROUND(
        100.0 * SUM(amount)
        / SUM(SUM(amount)) OVER (),
        2
    ) AS sales_share

FROM amazon_sales

GROUP BY category

ORDER BY sales_amount DESC;

-- OUTPUT
--         category  sales_amount  sales_share
-- 0            Set   39202022.03        49.88
-- 1          kurta   21299013.70        27.10
-- 2  Western Dress   11216072.69        14.27
-- 3            Top    5347792.30         6.80
-- 4   Ethnic Dress     791217.66         1.01
-- 5         Blouse     458408.18         0.58
-- 6         Bottom     150667.98         0.19
-- 7          Saree     123933.76         0.16
-- 8        Dupatta        915.00         0.00


-- Query 29
SELECT
    order_month,

    ROUND(SUM(amount), 2) AS sales_amount,

    ROUND(
        LAG(SUM(amount)) OVER (
            ORDER BY order_month
        ),
        2
    ) AS previous_month_sales

FROM amazon_sales

GROUP BY order_month

ORDER BY order_month;

-- OUTPUT
--   order_month  sales_amount  previous_month_sales
-- 0     2022-03     101683.85                   NaN
-- 1     2022-04   28838708.32             101683.85
-- 2     2022-05   26225004.75           28838708.32
-- 3     2022-06   23424646.38           26225004.75


-- Query 30
WITH monthly_sales AS (
    SELECT
        order_month,
        SUM(amount) AS sales_amount
    FROM amazon_sales
    GROUP BY order_month
),

monthly_comparison AS (
    SELECT
        order_month,
        sales_amount,

        LAG(sales_amount) OVER (
            ORDER BY order_month
        ) AS previous_month_sales

    FROM monthly_sales
)

SELECT
    order_month,

    ROUND(sales_amount, 2) AS sales_amount,

    ROUND(previous_month_sales, 2) AS previous_month_sales,

    ROUND(
        100.0 * (sales_amount - previous_month_sales)
        / previous_month_sales,
        2
    ) AS mom_change_percent

FROM monthly_comparison

ORDER BY order_month;

-- OUTPUT
--   order_month  sales_amount  previous_month_sales  mom_change_percent
-- 0     2022-03     101683.85                   NaN                 NaN
-- 1     2022-04   28838708.32             101683.85            28261.15
-- 2     2022-05   26225004.75           28838708.32               -9.06
-- 3     2022-06   23424646.38           26225004.75              -10.68


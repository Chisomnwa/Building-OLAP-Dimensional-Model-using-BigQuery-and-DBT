SELECT
    FORMAT_DATE('%F', d) AS id,
    d                    AS full_date,
    EXTRACT(YEAR FROM d) AS year,
    EXTRACT(WEEK FROM d) AS year_week,
    EXTRACT(DAY FROM d)  AS year_day,
    EXTRACT(YEAR FROM d) AS fiscal_year,
    FORMAT_DATE('%Q', d) AS fiscal_qtr,
    EXTRACT(MONTH FROM d) AS month,
    FORMAT_DATE('%B', d) AS month_name,
    FORMAT_DATE('%w', d) AS week_day,
    FORMAT_DATE('%A', d) AS day_name,
    (CASE WHEN FORMAT_DATE('%A', d) IN ('Sunday', 'Saturday') THEN 0 ELSE 1 END) AS day_is_weekday,
FROM (
    SELECT 
        *
    FROM
        UNNEST(GENERATE_DATE_ARRAY('2014-01-01', '2050-01-01', INTERVAL 1 DAY)) as D
)
    
    

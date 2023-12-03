WITH source AS (
    SELECT  
        p.id AS product_id,
        p.product_code,
        p.product_name,
        p.description,
        s.company AS supplier_company,
        p.standard_cost,
        p.list_price,
        p.reorder_level,
        p.target_level,
        p.quantity_per_unit,
        p.discontinued,
        p.minimum_reorder_quantity,
        p.category,
        p.attachments,
        current_timestamp() AS insertion_timestamp,
    FROM {{ ref('stg_products') }} P
    LEFT JOIN {{ ref('stg_suppliers') }} S
    ON S.id = P.supplier_id
),

unique_source AS (
    SELECT *,
            row_number() OVER(PARTITION BY product_id) AS row_number
    FROM source
)

SELECT *
EXCEPT (row_number)
FROM unique_source
WHERE row_number = 1
 


with Orders as (

    select * from {{ ref('stg_orders') }}

),
Payments as (

    select * from {{ ref('stg_payments') }}

),

Order_Payments AS(

    SELECT 
        SUM(Amount) as Amount,
        Order_ID
    FROM Payments
    WHERE Status <> 'fail'
    GROUP BY Order_ID
), 

Final AS(

SELECT 
    o.customer_id,
    o.order_id,
    o.status,
    op.Amount,
    o.order_date
FROM Orders o
    LEFT JOIN Order_Payments op  
    ON o.Order_ID = op.Order_ID
)




SELECT *
FROM Final

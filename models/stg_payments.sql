
SELECT 
    ID as Payment_ID,
    OrderID as Order_ID,
    PaymentMethod as Payment_Method,
    (Amount / 100) as Amount,
    Status,
    Created as Created_At,
    _Batched_AT
FROM raw.stripe.payment



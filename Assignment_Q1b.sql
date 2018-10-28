--Server=myServerAddress;Database=Oddle;Uid=myUsername;Pwd=myPassword;

-- This view allows us to see a more wholistic perspective on each customer id, if they placed orders or not.

SELECT orders_csv.'basket_size', orders_csv.'menu_id',orders_csv.'merchant_type', orders_csv.'organisation_name_provided' as 'corporate' ,cust_csv.'index' as 'Customer ID', cust_csv.'age', cust_csv.'gender', cust_csv.'created_on' as 'signedup_on', orders_csv.'submitted_on'
FROM 'Oddle_Assignment Customers Data' AS cust_csv
LEFT JOIN 'Oddle_Assignment Orders Data' AS orders_csv
ON  cust_csv.'index' = orders_csv.'customer_index'
--WHERE  (orders_csv.'basket_size' is null)  --if we want to see those customers that signed up but no orders placed
WHERE  (orders_csv.'basket_size' is not null)  --if we want to see those customers that have orders placed
--Server=myServerAddress;Database=Oddle;Uid=myUsername;Pwd=myPassword;

SELECT orders_csv.'basket_size', orders_csv.'menu_id', orders_csv.'submitted_on' as 'order_date',  orders_csv.'organisation_name_provided' as 'corporate' ,cust_csv.'index' as 'Customer ID', cust_csv.'created_on' as 'signedup_on'
FROM 'orders_cleaned' AS orders_csv
LEFT JOIN 'Oddle_Assignment Customers Data' AS cust_csv
ON orders_csv.'customer_index' = cust_csv.'index'
WHERE orders_csv.'submitted_on'  BETWEEN '2015-12-31' AND '2017-07-01' --between the dates (not including)
AND orders_csv.'menu_id' = 4 --Select Merchant 4
ORDER BY datetime(orders_csv.'submitted_on') ASC; --want to see it sorted by the earliest date
--ORDER BY datetime(orders_csv.'submitted_on') DESC; --want to see it sorted by the latest date
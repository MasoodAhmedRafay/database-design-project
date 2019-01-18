SELECT name,short_description,`price_incl._tax`, avg(rating)
FROM products
INNER JOIN
reviews
ON id = product_id
WHERE department_id = n;

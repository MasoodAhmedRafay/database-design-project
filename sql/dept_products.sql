select name,short_description,`price_incl._tax`, avg(rating)
from products
inner join
reviews
on id = product_id
where department_id = 5;

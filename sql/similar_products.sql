select * from products
where id=
      (select product_id from products_keywords where keyword_id =
      	      (select keyword_id from product_keywords where product_id=given_id))
and id != given_id;

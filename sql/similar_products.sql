select * from products
where id=
      (select product_id from product_keyword where keyword_id =
      	      (select keyword_id from product_keyword where product_id=given_id))
and id != given_id

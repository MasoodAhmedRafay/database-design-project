SELECT (name, `price_incl._tax`, short_description) from products
INNER JOIN product_keywords on id = product_id
where keyword_id IN (
      SELECT keyword_id FROM product_keywords WHERE product_id = n)
group by product_id;

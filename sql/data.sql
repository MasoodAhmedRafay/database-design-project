
	----------------------------------Insert INTO-------------------------------------------
----Departments---------	
INSERT INTO `fall18_project_it30`.`departments` (`id`, `name`, `short_description`, `detail_description`) VALUES ('1', 'Electronics', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit.');
INSERT INTO `fall18_project_it30`.`departments` (`id`, `name`, `short_description`, `detail_description`, `parent_id`) VALUES ('2', 'Computer and Electronics', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit.', '1');
INSERT INTO `fall18_project_it30`.`departments` (`id`, `name`, `short_description`, `detail_description`, `parent_id`) VALUES ('3', 'TV and Videos', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit.', '1');
INSERT INTO `fall18_project_it30`.`departments` (`id`, `name`, `short_description`, `detail_description`, `parent_id`) VALUES ('4', 'Desktop', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit.', '2');
INSERT INTO `fall18_project_it30`.`departments` (`id`, `name`, `short_description`, `detail_description`, `parent_id`) VALUES ('5', 'Tablets', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit.', '2');
INSERT INTO `fall18_project_it30`.`departments` (`id`, `name`, `short_description`, `detail_description`, `parent_id`) VALUES ('6', 'Laptops', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit.', '2');
INSERT INTO `fall18_project_it30`.`departments` (`id`, `name`, `short_description`, `detail_description`, `parent_id`) VALUES ('7', 'TVs', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit.', '3');
INSERT INTO `fall18_project_it30`.`departments` (`name`, `short_description`, `detail_description`, `parent_id`) VALUES ('Projectors', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit.', '3');
INSERT INTO `fall18_project_it30`.`departments` (`name`, `short_description`, `detail_description`, `parent_id`) VALUES ('Accessories', 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit.', '3');

----Products---------
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('1', 'HP 20-C102IL ( CDC, 4 GB, 1 TB, DOS)', '24,495', '', '20', '1', '0', '4');
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('2', 'HP 280 G3 MT (Intel Pentium,4GB,500GB,DOS)', '21,495', '', '25', '1', '0', '4');
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('3', 'LG 32LK526BPTA 32 Inch HD Ready Smart LED TV', '15,259', '', '12', '0', '0', '7');
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('4', 'LG 32LK616BPTB 32 Inch 4K Ultra HD Smart LED TV', '23,177', '', '14', '0', '0', '7');
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('5', 'Apple iPad 6 (Wi-Fi)', '22,997', '', '13', '0', '0', '5');
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('6', 'Apple iPad 9.7 128GB (Wi-Fi)', '21,416', '', '16', '0', '1', '5');
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('7', 'Apple MQD32HN/A MacBook Air (13.3 Inch|Core I5|8 GB|Mac OS)', '58,897', '', '25', '1', '0', '6');
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('8', 'Apple MPXQ2 MacBook Pro (13 Inch|Core I5|8 GB|Mac OS)', '99,699', '', '35', '1', '0', '6');
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('9', 'HP (15Q-BU015TU) Laptop (15.6 Inch|8 GB|Win 10 Home|1 TB)', '21,591', '', '43', '1', '0', '6');
INSERT INTO `fall18_project_it30`.`products` (`id`, `name`, `base_price`, `tax%`, `price_incl._tax`, `stock_count`, `featured`, `hidden`, `department_id`) VALUES ('10', 'HP 15-DA0326TU Laptop (15.6 Inch|Core I3|4 GB|Win 10 Home|1 TB)', '28,490', '', '', '65', '0', '1', '6');
INSERT INTO `fall18_project_it30`.`products` (`tax%`, `stock_count`, `featured`) VALUES ('', '', '');


-----------Users----------
INSERT INTO `fall18_project_it30`.`users` (`id`, `ssn`, `email`, `password`, `last_name`, `first_name`, `house_no`, `street`, `postal_code`, `contact_no`) VALUES ('1', '1234567891', 'abc@123.com', '12345', 'John', 'Marshall', '12-A', 'Karlsrogatan', '75238', '00000000');
INSERT INTO `fall18_project_it30`.`users` (`id`, `ssn`, `email`, `password`, `last_name`, `first_name`, `house_no`, `street`, `postal_code`, `contact_no`) VALUES ('2', '2345678910', '789@xyz.com', '67890', 'Robert', 'Greek', '13-A', 'Karlsrogatan', '75238', '11111111');


----------reviews-----------
INSERT INTO `fall18_project_it30`.`reviews` (`text`, `rating`, `user_id`, `product_id`) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam orci enim, laoreet vel pharetra in, posuere vitae urna. Nam ac risus lacinia, lacinia ipsum a, tincidunt dui. Vivamus pulvinar, erat ac euismod euismod, sem diam lacinia lectus, in viverra urna erat ac augue. Duis lorem turpis, fermentum eu metus sit amet, ultrices eleifend ipsum. Etiam quis magna posuere, vulputate odio quis, elementum sem. Mauris condimentum tortor', '4', '1', '5');
INSERT INTO `fall18_project_it30`.`reviews` (`text`, `rating`, `user_id`, `product_id`) VALUES ('Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '3', '2', '10');

----------orders_mst------------
INSERT INTO `fall18_project_it30`.`orders_mst` (`id`, `payment_ref`, `status`, `user_id`) VALUES ('1', 'abc-123', 'delivered', '1');


CREATE TABLE `fall18_project_it30`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ssn` INT(10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `house_no` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `contact_no` VARCHAR(45) NULL,
  PRIMARY KEY (`id`);
  
  
CREATE TABLE `fall18_project_it30`.`departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `short_description` VARCHAR(45) NULL,
  `detail_description` VARCHAR(45) NULL,
  `parent_id` INT NULL,
  PRIMARY KEY (`id`);

CREATE TABLE `fall18_project_it30`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `base_price` DOUBLE NULL,
  `tax%` DECIMAL NULL,
  `price_incl._tax` FLOAT NULL,
  `price_excl._tax` DOUBLE NULL,
  `stock_count` REAL NULL,
  `short_description` VARCHAR(500) NULL,
  `detail_description` VARCHAR(1000) NULL,
  `featured` TINYINT NULL,
  `hidden` TINYINT NULL,
  `department_id` INT NULL,
  PRIMARY KEY (`id`);

CREATE TABLE `fall18_project_it30`.`orders_mst` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `placement_date` DATE NULL,
  `payment_ref` VARCHAR(45) NULL,
  `tracking_no` VARCHAR(14) NULL,
  `status` TINYINT NULL,
  `user_id` INT NULL,
  `last_modified` TIMESTAMP NULL,
  PRIMARY KEY (`id`);

Create TABLE `fall18_project_it30`.`orders_detail` (
 `order_id` INT NOT NULL ,
 `product_id` INT NOT NULL ,
 `quantity` INT NOT NULL ,
 `price` DOUBLE NOT NULL ,
 PRIMARY KEY orders_detail(`order_id`, `product_id`);
 
CREATE TABLE `fall18_project_it30`.`reviews` (
  `text` VARCHAR(100) NULL,
  `rating` TINYINT NULL,
  `user_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `fall18_project_it30`.`products`(`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `fareviewsll18_project_it30`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	
CREATE TABLE `fall18_project_it30`.`keywords` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL,
  PRIMARY KEY (`id`);
  
  
CREATE TABLE `fall18_project_it30`.`product_keyword` (
  `keyword_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`keyword_id`, `product_id`),
  CONSTRAINT `keyword_id`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `fall18_project_it30`.`keywords` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `fall18_project_it30`.`products` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);



CREATE TABLE `fall18_project_it30`.`product_keywords` (
  `keyword_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`keyword_id`, `product_id`),
  CONSTRAINT `keyword_id`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `fall18_project_it30`.`keywords` (`id`)
    ON DELETE CASCADE
    ON UPDATE RESTRICT);

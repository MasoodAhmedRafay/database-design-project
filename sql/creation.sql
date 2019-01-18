USE `fall18_project_it30` ;

-- -----------------------------------------------------
-- Table `fall18_project_it30`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fall18_project_it30`.`departments` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `short_description` VARCHAR(45) NULL DEFAULT NULL,
  `detail_description` VARCHAR(45) NULL DEFAULT NULL,
  `parent_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `parent_id_idx` (`parent_id` ASC) ,
  INDEX `inx_dept_name` (`name` ASC) ,
  CONSTRAINT `parent_id`
    FOREIGN KEY (`parent_id`)
    REFERENCES `fall18_project_it30`.`departments` (`id`));


-- -----------------------------------------------------
-- Table `fall18_project_it30`.`keywords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fall18_project_it30`.`keywords` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `text_UNIQUE` (`text` ASC) );


-- -----------------------------------------------------
-- Table `fall18_project_it30`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fall18_project_it30`.`products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `base_price` DOUBLE NULL DEFAULT NULL,
  `tax%` DECIMAL(10,0) NULL DEFAULT NULL,
  `price_incl._tax` FLOAT NULL DEFAULT NULL,
  `price_excl._tax` DOUBLE NULL DEFAULT NULL,
  `stock_count` DOUBLE NULL DEFAULT NULL,
  `short_description` VARCHAR(500) NULL DEFAULT NULL,
  `detail_description` VARCHAR(1000) NULL DEFAULT NULL,
  `featured` TINYINT(4) NULL DEFAULT NULL,
  `hidden` TINYINT(4) NULL DEFAULT NULL,
  `department_id` INT(11) NULL DEFAULT NULL,
  `discount` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `department_id_idx` (`department_id` ASC) ,
  INDEX `idx_stock` (`stock_count` ASC) ,
  INDEX `featured_idx` (`featured` ASC) ,
  CONSTRAINT `department_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `fall18_project_it30`.`departments` (`id`));


-- -----------------------------------------------------
-- Table `fall18_project_it30`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fall18_project_it30`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `ssn` INT(10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `house_no` VARCHAR(45) NULL DEFAULT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `postal_code` VARCHAR(45) NULL DEFAULT NULL,
  `contact_no` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `SSN_UNIQUE` (`ssn` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) );


-- -----------------------------------------------------
-- Table `fall18_project_it30`.`orders_mst`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fall18_project_it30`.`orders_mst` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `placement_date` DATE NULL DEFAULT NULL,
  `payment_ref` VARCHAR(45) NULL DEFAULT NULL,
  `tracking_no` VARCHAR(14) NULL DEFAULT NULL,
  `status` TINYINT(4) NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `last_modified` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  CONSTRAINT `orders_mst_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `fall18_project_it30`.`users` (`id`));


-- -----------------------------------------------------
-- Table `fall18_project_it30`.`orders_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fall18_project_it30`.`orders_detail` (
  `id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `price` DOUBLE NOT NULL,
  `order_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `product_id` (`product_id` ASC) ,
  INDEX `order_id` (`order_id` ASC) ,
  CONSTRAINT `orders_detail_ibfk_1`
    FOREIGN KEY (`product_id`)
    REFERENCES `fall18_project_it30`.`products` (`id`),
  CONSTRAINT `orders_detail_ibfk_2`
    FOREIGN KEY (`order_id`)
    REFERENCES `fall18_project_it30`.`orders_mst` (`id`));


-- -----------------------------------------------------
-- Table `fall18_project_it30`.`products_keywords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fall18_project_it30`.`products_keywords` (
  `keyword_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE INDEX `keyword_id_UNIQUE` (`keyword_id` ASC) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  CONSTRAINT `keyword_id`
    FOREIGN KEY (`keyword_id`)
    REFERENCES `fall18_project_it30`.`keywords` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `products_keywords_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `fall18_project_it30`.`users` (`id`));


-- -----------------------------------------------------
-- Table `fall18_project_it30`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fall18_project_it30`.`reviews` (
  `text` VARCHAR(100) NULL DEFAULT NULL,
  `rating` TINYINT(4) NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `product_id` INT(11) NULL DEFAULT NULL,
  INDEX `product_id` (`product_id` ASC) ,
  INDEX `user_id` (`user_id` ASC) ,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `fall18_project_it30`.`products` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `fall18_project_it30`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

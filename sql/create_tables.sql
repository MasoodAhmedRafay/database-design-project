
--------------------------Foreign Keys------------------------------------

------------------departments---------------
ALTER TABLE `fall18_project_it30`.`departments` 
ADD INDEX `parent_id_idx` (`parent_id` ASC);

ALTER TABLE `fall18_project_it30`.`departments` 
ADD CONSTRAINT `parent_id`
  FOREIGN KEY (`parent_id`)
  REFERENCES `fall18_project_it30`.`departments` (`id`);

  
  ---------------------------products---------------------------------
ALTER TABLE `fall18_project_it30`.`products` 
ADD INDEX `department_id_idx` (`department_id` ASC);
;
ALTER TABLE `fall18_project_it30`.`products` 
ADD CONSTRAINT `department_id`
  FOREIGN KEY (`department_id`)
  REFERENCES `fall18_project_it30`.`departments` (`id`);

ALTER TABLE `fall18_project_it30`.`products` 
ADD COLUMN `discount` FLOAT NULL AFTER `department_id`;


UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '1');
UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '2');
UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '3');
UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '4');
UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '5');
UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '6');
UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '7');
UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '8');
UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '9');
UPDATE `fall18_project_it30`.`products` SET `discount` = '10%' WHERE (`id` = '10');
UPDATE `fall18_project_it30`.`products` SET `tax%` = '', `discount` = '' WHERE (`id` = '11');








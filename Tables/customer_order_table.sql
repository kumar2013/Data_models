SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ifoodbagi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ifoodbagi` ;

-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_o_customer_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_o_customer_type` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_o_customer_type` (
  `customer_type_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `customer_type_name` VARCHAR(20) NULL ,
  PRIMARY KEY (`customer_type_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_o_customer_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_o_customer_orders` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_o_customer_orders` (
  `customer_order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `customer_id` INT UNSIGNED NOT NULL ,
  `order_date` DATE NOT NULL ,
  `customer_type_id` TINYINT UNSIGNED NOT NULL ,
  `no_of_people` TINYINT NOT NULL ,
  PRIMARY KEY (`customer_order_id`) ,
  INDEX `customer_type_id_idx` (`customer_type_id` ASC) ,
  CONSTRAINT `customer_type_id`
    FOREIGN KEY (`customer_type_id` )
    REFERENCES `ifoodbagi`.`i_o_customer_type` (`customer_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_o_meal_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_o_meal_types` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_o_meal_types` (
  `meal_type_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `meal_type_name` VARCHAR(20) NOT NULL ,
  PRIMARY KEY (`meal_type_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_o_week_days`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_o_week_days` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_o_week_days` (
  `week_day_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `week_day_name` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`week_day_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_o_items_ordered`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_o_items_ordered` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_o_items_ordered` (
  `customer_order_id` INT UNSIGNED NOT NULL ,
  `meal_type_id` TINYINT UNSIGNED NOT NULL ,
  `week_day_id` TINYINT UNSIGNED NOT NULL ,
  `recipe_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`customer_order_id`, `meal_type_id`, `week_day_id`) ,
  INDEX `customer_order_id_idx` (`customer_order_id` ASC) ,
  INDEX `meal_type_id_idx` (`meal_type_id` ASC) ,
  INDEX `week_day_id_idx` (`week_day_id` ASC) ,
  CONSTRAINT `customer_order_id`
    FOREIGN KEY (`customer_order_id` )
    REFERENCES `ifoodbagi`.`i_o_customer_orders` (`customer_order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `meal_type_id`
    FOREIGN KEY (`meal_type_id` )
    REFERENCES `ifoodbagi`.`i_o_meal_types` (`meal_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `week_day_id`
    FOREIGN KEY (`week_day_id` )
    REFERENCES `ifoodbagi`.`i_o_week_days` (`week_day_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ifoodbagi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

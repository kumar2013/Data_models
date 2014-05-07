SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ifoodbagi` DEFAULT CHARACTER SET latin1 ;
USE `ifoodbagi` ;

-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_c_image_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_c_image_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_c_image_info` (
  `c_image_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `c_image_name` BLOB NOT NULL ,
  PRIMARY KEY (`c_image_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_c_recipe_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_c_recipe_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_c_recipe_info` (
  `c_recipe_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `c_recipe_name` VARCHAR(45) NOT NULL ,
  `short_description` TEXT NOT NULL ,
  `c_Total_time` VARCHAR(5) NOT NULL ,
  `c_portion` TINYINT NOT NULL ,
  `c_image_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `c_meal_type_id` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`c_recipe_id`) ,
  UNIQUE INDEX `c_recipe_name_UNIQUE` (`c_recipe_name` ASC) ,
  INDEX `FK_c_recipe_image_idx` (`c_image_id` ASC) ,
  INDEX `FK_c_recipe_meal_type_idx` (`c_meal_type_id` ASC) ,
  CONSTRAINT `FK_c_recipe_image`
    FOREIGN KEY (`c_image_id` )
    REFERENCES `ifoodbagi`.`i_c_image_info` (`c_image_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_c_recipe_meal_type`
    FOREIGN KEY (`c_meal_type_id` )
    REFERENCES `ifoodbagi`.`i_meal_types` (`meal_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_c_recipe_ingredient_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_c_recipe_ingredient_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_c_recipe_ingredient_map` (
  `c_recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `c_product_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `amount` SMALLINT NOT NULL ,
  `c_unit_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`c_recipe_id`, `c_product_id`) ,
  INDEX `FK_c_map_recipe_info_idx` (`c_recipe_id` ASC) ,
  INDEX `FK_c_map_product_info_idx` (`c_product_id` ASC) ,
  INDEX `FK_c_map_unit_idx` (`c_unit_id` ASC) ,
  CONSTRAINT `FK_c_map_recipe_info`
    FOREIGN KEY (`c_recipe_id` )
    REFERENCES `ifoodbagi`.`i_c_recipe_info` (`c_recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_c_map_product_info`
    FOREIGN KEY (`c_product_id` )
    REFERENCES `ifoodbagi`.`i_product_info` (`product_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_c_map_unit`
    FOREIGN KEY (`c_unit_id` )
    REFERENCES `ifoodbagi`.`i_unit_info` (`unit_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_c_kitchen_tool_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_c_kitchen_tool_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_c_kitchen_tool_map` (
  `c_recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `c_kitchen_tool_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`c_recipe_id`, `c_kitchen_tool_id`) ,
  INDEX `FK_c_recipe_kitchen_map_idx` (`c_recipe_id` ASC) ,
  INDEX `FK_c_info_map_kitchen_idx` (`c_kitchen_tool_id` ASC) ,
  CONSTRAINT `FK_c_recipe_kitchen_map`
    FOREIGN KEY (`c_recipe_id` )
    REFERENCES `ifoodbagi`.`i_c_recipe_info` (`c_recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_c_info_map_kitchen`
    FOREIGN KEY (`c_kitchen_tool_id` )
    REFERENCES `ifoodbagi`.`i_kitchen_tool_info` (`kitchen_tool_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_c_preparation_process`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_c_preparation_process` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_c_preparation_process` (
  `p_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `c_recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `preparation_process` TEXT NOT NULL ,
  INDEX `FK_c_recipe_preparation_idx` (`c_recipe_id` ASC) ,
  PRIMARY KEY (`p_id`) ,
  CONSTRAINT `FK_c_recipe_preparation`
    FOREIGN KEY (`c_recipe_id` )
    REFERENCES `ifoodbagi`.`i_c_recipe_info` (`c_recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_c_cooking_instruction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_c_cooking_instruction` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_c_cooking_instruction` (
  `c_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `c_recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `cooking_instruction` TEXT NOT NULL ,
  INDEX `FK_c_instruction_recipe_idx` (`c_recipe_id` ASC) ,
  PRIMARY KEY (`c_id`) ,
  CONSTRAINT `FK_c_instruction_recipe`
    FOREIGN KEY (`c_recipe_id` )
    REFERENCES `ifoodbagi`.`i_c_recipe_info` (`c_recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_c_recipe_category_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_c_recipe_category_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_c_recipe_category_map` (
  `c_recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `c_category_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`c_recipe_id`, `c_category_id`) ,
  INDEX `FK_c_category_map_recipe_idx` (`c_recipe_id` ASC) ,
  INDEX `FK_c_map_category_info_idx` (`c_category_id` ASC) ,
  CONSTRAINT `FK_c_category_map_recipe`
    FOREIGN KEY (`c_recipe_id` )
    REFERENCES `ifoodbagi`.`i_c_recipe_info` (`c_recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_c_map_category_info`
    FOREIGN KEY (`c_category_id` )
    REFERENCES `ifoodbagi`.`i_category_info` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ifoodbagi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_author_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_author_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_author_info` (
  `author_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `author_name` VARCHAR(45) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`author_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_category_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_category_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_category_info` (
  `category_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `category_name` VARCHAR(45) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_language_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_language_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_language_info` (
  `language_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `language_prefix` VARCHAR(20) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`language_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_image_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_image_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_image_info` (
  `image_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `image_name` BLOB NULL DEFAULT NULL ,
  PRIMARY KEY (`image_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_recipe_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_recipe_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_recipe_info` (
  `recipe_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `recipe_name` VARCHAR(45) NOT NULL DEFAULT '' ,
  `cooking_time` VARCHAR(45) NOT NULL DEFAULT '' ,
  `total_cost` VARCHAR(45) NOT NULL DEFAULT '' ,
  `health_content` VARCHAR(45) NOT NULL DEFAULT '' ,
  `cooking_method` TEXT NULL DEFAULT NULL ,
  `portion` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `image_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `author_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `language_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`recipe_id`) ,
  INDEX `FK_recipe_language` (`language_id` ASC) ,
  INDEX `author_id_idx` (`author_id` ASC) ,
  INDEX `fk_recipe_image_idx` (`image_id` ASC) ,
  CONSTRAINT `FK_recipe_language`
    FOREIGN KEY (`language_id` )
    REFERENCES `ifoodbagi`.`i_language_info` (`language_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_recipe_author`
    FOREIGN KEY (`author_id` )
    REFERENCES `ifoodbagi`.`i_author_info` (`author_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_recipe_image`
    FOREIGN KEY (`image_id` )
    REFERENCES `ifoodbagi`.`i_image_info` (`image_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_ground_recipe_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_ground_recipe_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_ground_recipe_info` (
  `ground_recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`ground_recipe_id`) ,
  INDEX `FK_ground_recipe_info_recipe` (`recipe_id` ASC) ,
  CONSTRAINT `FK_ground_recipe_info_recipe`
    FOREIGN KEY (`recipe_id` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_product_group_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_product_group_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_product_group_info` (
  `product_group_id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `product_group_name` VARCHAR(45) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`product_group_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_sorting_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_sorting_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_sorting_info` (
  `sorting_option_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `sorting_option_name` VARCHAR(45) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`sorting_option_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_product_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_product_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_product_info` (
  `product_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `product_name` VARCHAR(45) NOT NULL DEFAULT '' ,
  `description` TEXT NOT NULL DEFAULT '' ,
  `bar_code` TINYINT NOT NULL DEFAULT '0' ,
  `product_group_id` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' ,
  `sorting_option_id` TINYINT UNSIGNED NOT NULL DEFAULT '0' ,
  `in_stock` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' ,
  `available` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' ,
  `place_stored` VARCHAR(45) NOT NULL DEFAULT '0' ,
  `price` MEDIUMINT(6) UNSIGNED NOT NULL DEFAULT '0' ,
  `currency_id` TINYINT UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`product_id`) ,
  INDEX `FK_product_info_group_idx` (`product_group_id` ASC) ,
  INDEX `FK_product_sorting_idx` (`sorting_option_id` ASC) ,
  CONSTRAINT `FK_product_info_group`
    FOREIGN KEY (`product_group_id` )
    REFERENCES `ifoodbagi`.`i_product_group_info` (`product_group_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_product_sorting`
    FOREIGN KEY (`sorting_option_id` )
    REFERENCES `ifoodbagi`.`i_sorting_info` (`sorting_option_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_kitchen_tool_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_kitchen_tool_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_kitchen_tool_info` (
  `kitchen_tool_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `kitchen_tool_name` VARCHAR(45) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`kitchen_tool_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_meal_type_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_meal_type_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_meal_type_info` (
  `meal_type_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `meal_type_name` VARCHAR(45) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`meal_type_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_recipe_category_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_recipe_category_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_recipe_category_map` (
  `recipe_id_fk` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `category_id_fk` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `meal_type_id_fk` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`recipe_id_fk`, `category_id_fk`) ,
  INDEX `FK_category_map_category` (`category_id_fk` ASC) ,
  INDEX `FK_category_map_meal_type_idx` (`meal_type_id_fk` ASC) ,
  CONSTRAINT `FK_category_map_category`
    FOREIGN KEY (`category_id_fk` )
    REFERENCES `ifoodbagi`.`i_category_info` (`category_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_category_map_recipe_info`
    FOREIGN KEY (`recipe_id_fk` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_category_map_meal_type`
    FOREIGN KEY (`meal_type_id_fk` )
    REFERENCES `ifoodbagi`.`i_meal_type_info` (`meal_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_recipe_ground_recipe_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_recipe_ground_recipe_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_recipe_ground_recipe_map` (
  `recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `ground_recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`recipe_id`, `ground_recipe_id`) ,
  INDEX `FK_ground_recipe_map_ground_recipe` (`ground_recipe_id` ASC) ,
  CONSTRAINT `FK_ground_recipe_map_ground_recipe`
    FOREIGN KEY (`ground_recipe_id` )
    REFERENCES `ifoodbagi`.`i_ground_recipe_info` (`ground_recipe_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ground_recipe_map_recipe`
    FOREIGN KEY (`recipe_id` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_unit_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_unit_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_unit_info` (
  `unit_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `unit_name` VARCHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY (`unit_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_recipe__map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_recipe__map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_recipe__map` (
  `recipe_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `product_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `amount` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `unit_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`recipe_id`, `product_id`) ,
  INDEX `FK_ingredient_map_product` (`product_id` ASC) ,
  INDEX `FK_ingredient_map_unit` (`unit_id` ASC) ,
  CONSTRAINT `FK_ingredient_map_product`
    FOREIGN KEY (`product_id` )
    REFERENCES `ifoodbagi`.`i_product_info` (`product_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ingredient_map_recipe`
    FOREIGN KEY (`recipe_id` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_ingredient_map_unit`
    FOREIGN KEY (`unit_id` )
    REFERENCES `ifoodbagi`.`i_unit_info` (`unit_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_recipe_kitchen_tool_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_recipe_kitchen_tool_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_recipe_kitchen_tool_map` (
  `recipe_id_fk` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `kitchen_tool_id_fk` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`recipe_id_fk`, `kitchen_tool_id_fk`) ,
  INDEX `FK_recipe_kitchen_tool_map_kitchen_tool` (`kitchen_tool_id_fk` ASC) ,
  CONSTRAINT `FK_recipe_kitchen_tool_map_kitchen_tool`
    FOREIGN KEY (`kitchen_tool_id_fk` )
    REFERENCES `ifoodbagi`.`i_kitchen_tool_info` (`kitchen_tool_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_recipe_kitchen_tool_map_recipe`
    FOREIGN KEY (`recipe_id_fk` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

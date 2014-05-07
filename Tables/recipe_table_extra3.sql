SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ifoodbagi` DEFAULT CHARACTER SET latin1 ;
USE `ifoodbagi` ;

-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_recipe_category_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_recipe_category_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_recipe_category_map` (
  `recipe_id_fk` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `category_id_fk` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  PRIMARY KEY (`recipe_id_fk`, `category_id_fk`) ,
  INDEX `FK_category_map_category` (`category_id_fk` ASC) ,
  CONSTRAINT `FK_category_map_category`
    FOREIGN KEY (`category_id_fk` )
    REFERENCES `ifoodbagi`.`i_category_info` (`category_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_category_map_recipe_info`
    FOREIGN KEY (`recipe_id_fk` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_recipe_meal_type_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_recipe_meal_type_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_recipe_meal_type_map` (
  `recipe_id` INT(10) UNSIGNED NOT NULL ,
  `meal_type_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`recipe_id`, `meal_type_id`) ,
  INDEX `FK_meal_recipe_info_idx` (`recipe_id` ASC) ,
  INDEX `FK_type_meal_map_idx` (`meal_type_id` ASC) ,
  CONSTRAINT `FK_meal_recipe_info_map`
    FOREIGN KEY (`recipe_id` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_type_meal_map`
    FOREIGN KEY (`meal_type_id` )
    REFERENCES `ifoodbagi`.`i_meal_type_info` (`meal_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ifoodbagi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

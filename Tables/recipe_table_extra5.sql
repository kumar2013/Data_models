SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ifoodbagi` DEFAULT CHARACTER SET latin1 ;
USE `ifoodbagi` ;

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
  PRIMARY KEY (`c_recipe_id`) ,
  UNIQUE INDEX `c_recipe_name_UNIQUE` (`c_recipe_name` ASC) ,
  INDEX `FK_c_recipe_image_idx` (`c_image_id` ASC) ,
  CONSTRAINT `FK_c_recipe_image`
    FOREIGN KEY (`c_image_id` )
    REFERENCES `ifoodbagi`.`i_c_image_info` (`c_image_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_c_recipe_meal_type_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_c_recipe_meal_type_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_c_recipe_meal_type_map` (
  `c_recipe_id` INT(10) UNSIGNED NOT NULL ,
  `c_meal_type_id` TINYINT(3) UNSIGNED NOT NULL ,
  PRIMARY KEY (`c_recipe_id`, `c_meal_type_id`) ,
  INDEX `FK_c_map_recipe_info_idx` (`c_recipe_id` ASC) ,
  INDEX `FK_c_map_meal_type_idx` (`c_meal_type_id` ASC) ,
  CONSTRAINT `FK_c_map_recipe_info`
    FOREIGN KEY (`c_recipe_id` )
    REFERENCES `ifoodbagi`.`i_c_recipe_info` (`c_recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_c_map_meal_type`
    FOREIGN KEY (`c_meal_type_id` )
    REFERENCES `ifoodbagi`.`i_meal_types` (`meal_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ifoodbagi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

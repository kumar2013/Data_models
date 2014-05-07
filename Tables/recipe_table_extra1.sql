SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ifoodbagi` DEFAULT CHARACTER SET latin1 ;
USE `ifoodbagi` ;

-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_recipe_instruction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_recipe_instruction` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_recipe_instruction` (
  `instruction_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `recipe_id_fk` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `instructions` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`instruction_id`) ,
  INDEX `FK_recipe_info_instruction_idx` (`recipe_id_fk` ASC) ,
  CONSTRAINT `FK_recipe_info_instruction`
    FOREIGN KEY (`recipe_id_fk` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_recipe_preparation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_recipe_preparation` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_recipe_preparation` (
  `preparation_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `recipe_id_fk` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
  `preparation_list` TEXT NULL DEFAULT NULL ,
  PRIMARY KEY (`preparation_id`) ,
  INDEX `FK_recipe_info_preparation_idx` (`recipe_id_fk` ASC) ,
  CONSTRAINT `FK_recipe_info_preparation`
    FOREIGN KEY (`recipe_id_fk` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ifoodbagi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

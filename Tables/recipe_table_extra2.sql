SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ifoodbagi` DEFAULT CHARACTER SET latin1 ;
USE `ifoodbagi` ;

-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_currency_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_currency_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_currency_info` (
  `currency_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `currency_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`currency_id`) )
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
  INDEX `FK_product_currency_idx` (`currency_id` ASC) ,
  CONSTRAINT `FK_product_info_group`
    FOREIGN KEY (`product_group_id` )
    REFERENCES `ifoodbagi`.`i_product_group_info` (`product_group_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_product_sorting`
    FOREIGN KEY (`sorting_option_id` )
    REFERENCES `ifoodbagi`.`i_sorting_info` (`sorting_option_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_product_currency`
    FOREIGN KEY (`currency_id` )
    REFERENCES `ifoodbagi`.`i_currency_info` (`currency_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;

USE `ifoodbagi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

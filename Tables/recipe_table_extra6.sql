SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ifoodbagi` DEFAULT CHARACTER SET latin1 ;
USE `ifoodbagi` ;

-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_product_quantity_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_product_quantity_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_product_quantity_info` (
  `all_product_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `product_id_fk` INT(10) UNSIGNED NOT NULL ,
  `quantity` VARCHAR(10) NOT NULL ,
  `unit_id_fk` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`all_product_id`) ,
  INDEX `FK_quant_product_info_idx` (`product_id_fk` ASC) ,
  INDEX `FK_quant_unit_info_idx` (`unit_id_fk` ASC) ,
  CONSTRAINT `FK_quant_product_info`
    FOREIGN KEY (`product_id_fk` )
    REFERENCES `ifoodbagi`.`i_product_info` (`product_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_quant_unit_info`
    FOREIGN KEY (`unit_id_fk` )
    REFERENCES `ifoodbagi`.`i_recipe_unit_info` (`unit_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ifoodbagi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ifoodbagi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ifoodbagi` ;

-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_o_recipe_ordered`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_o_recipe_ordered` ;



CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_o_recipe_ordered` (
  `r_o_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `customer_order_id` INT UNSIGNED NOT NULL ,
  `meal_type_id` TINYINT UNSIGNED NOT NULL ,
  `week_day_id` TINYINT UNSIGNED NOT NULL ,
  `recipe_id` INT UNSIGNED NOT NULL ,
  INDEX `customer_order_id_idx` (`customer_order_id` ASC) ,
  INDEX `meal_type_id_idx` (`meal_type_id` ASC) ,
  INDEX `week_day_id_idx` (`week_day_id` ASC) ,
  PRIMARY KEY (`r_o_id`) ,
  CONSTRAINT `FK_ordered_customer`
    FOREIGN KEY (`customer_order_id` )
    REFERENCES `ifoodbagi`.`i_o_customer_orders` (`customer_order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ordered_meal_type`
    FOREIGN KEY (`meal_type_id` )
    REFERENCES `ifoodbagi`.`i_o_meal_types` (`meal_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ordered_week`
    FOREIGN KEY (`week_day_id` )
    REFERENCES `ifoodbagi`.`i_o_week_days` (`week_day_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ordered_recipe_info`
    FOREIGN KEY (`recipe_id` )
    REFERENCES `ifoodbagi`.`i_recipe_info` (`recipe_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


USE `ifoodbagi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ifoodbagi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ifoodbagi` ;

-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_o_product_ordered`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_o_product_ordered` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_o_product_ordered` (
  `customer_order_id` INT(10) UNSIGNED NOT NULL ,
  `product_id` INT(10) UNSIGNED NOT NULL ,
  `amount` INT(10) NOT NULL ,
  `unit_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`customer_order_id`, `product_id`) ,
  INDEX `FK_product_order_customer_idx` (`customer_order_id` ASC) ,
  CONSTRAINT `FK_product_order_customer`
    FOREIGN KEY (`customer_order_id` )
    REFERENCES `ifoodbagi`.`i_o_customer_orders` (`customer_order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ordered_product`
    FOREIGN KEY (`product_id` )
    REFERENCES `ifoodbagi`.`i_product_info` (`product_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ordered_unit_info`
    FOREIGN KEY (`unit_id` )
    REFERENCES `ifoodbagi`.`i_recipe_unit_info` (`unit_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


USE `ifoodbagi` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

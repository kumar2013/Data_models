SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_o_customer_fav_menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_o_customer_fav_menu` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_o_customer_fav_menu` (
  `menu_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `customer_id` INT(10) UNSIGNED NOT NULL ,
  `menu_name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`menu_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbagi`.`i_o_customer_fav_recipes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbagi`.`i_o_customer_fav_recipes` ;

CREATE  TABLE IF NOT EXISTS `ifoodbagi`.`i_o_customer_fav_recipes` (
  `f_r_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `menu_id` INT(10) UNSIGNED NOT NULL ,
  `meal_type_id` TINYINT UNSIGNED NOT NULL ,
  `week_day_id` TINYINT UNSIGNED NOT NULL ,
  `recipe_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`f_r_id`) ,
  INDEX `FK_fav_recipe_menu_idx` (`menu_id` ASC) ,
  INDEX `FK_fav_recipe_meal_type_idx` (`meal_type_id` ASC) ,
  INDEX `FK_fav_recipe_week_idx` (`week_day_id` ASC) ,
  CONSTRAINT `FK_fav_recipe_menu`
    FOREIGN KEY (`menu_id` )
    REFERENCES `ifoodbagi`.`i_o_customer_fav_menu` (`menu_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fav_recipe_meal_type`
    FOREIGN KEY (`meal_type_id` )
    REFERENCES `ifoodbagi`.`i_meal_types` (`meal_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_fav_recipe_week`
    FOREIGN KEY (`week_day_id` )
    REFERENCES `ifoodbagi`.`i_o_week_days` (`week_day_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

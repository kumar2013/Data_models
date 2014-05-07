SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `ifoodbag`.`i_customer_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbag`.`i_customer_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbag`.`i_customer_info` (
  `customer_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NOT NULL ,
  `last_name` VARCHAR(45) NOT NULL ,
  `personal_number` VARCHAR(11) NOT NULL ,
  `email` VARCHAR(55) NULL DEFAULT NULL ,
  `mobile_number` VARCHAR(45) NOT NULL ,
  `user_name` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `regdate` DATE NOT NULL ,
  `last_login` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`customer_id`) ,
  UNIQUE INDEX `person_number_UNIQUE` (`personal_number` ASC) ,
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbag`.`i_customer_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbag`.`i_customer_address` ;

CREATE  TABLE IF NOT EXISTS `ifoodbag`.`i_customer_address` (
  `address_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `customer_id` INT(10) UNSIGNED NOT NULL ,
  `address` VARCHAR(65) NOT NULL ,
  `city` VARCHAR(30) NOT NULL ,
  `zip_code` VARCHAR(5) NOT NULL ,
  PRIMARY KEY (`address_id`) ,
  INDEX `FK_address_customer_info_idx` (`customer_id` ASC) ,
  CONSTRAINT `FK_address_customer_info`
    FOREIGN KEY (`customer_id` )
    REFERENCES `ifoodbag`.`i_customer_info` (`customer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbag`.`i_customer_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbag`.`i_customer_group` ;

CREATE  TABLE IF NOT EXISTS `ifoodbag`.`i_customer_group` (
  `group_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `group_title` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`group_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbag`.`i_customer_group_map`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbag`.`i_customer_group_map` ;

CREATE  TABLE IF NOT EXISTS `ifoodbag`.`i_customer_group_map` (
  `customer_id` INT(10) UNSIGNED NOT NULL ,
  `group_id` INT(10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`customer_id`, `group_id`) ,
  INDEX `FK_map_customer_info_idx` (`customer_id` ASC) ,
  INDEX `FK_map_customer_group_idx` (`group_id` ASC) ,
  CONSTRAINT `FK_map_customer_info`
    FOREIGN KEY (`customer_id` )
    REFERENCES `ifoodbag`.`i_customer_info` (`customer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_map_customer_group`
    FOREIGN KEY (`group_id` )
    REFERENCES `ifoodbag`.`i_customer_group` (`group_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbag`.`i_survey_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbag`.`i_survey_info` ;

CREATE  TABLE IF NOT EXISTS `ifoodbag`.`i_survey_info` (
  `survey_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `customer_id` INT(10) UNSIGNED NOT NULL ,
  `date` DATETIME NOT NULL ,
  PRIMARY KEY (`survey_id`) ,
  INDEX `FK_survey_customer_info_idx` (`customer_id` ASC) ,
  CONSTRAINT `FK_survey_customer_info`
    FOREIGN KEY (`customer_id` )
    REFERENCES `ifoodbag`.`i_customer_info` (`customer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbag`.`i_survey_questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbag`.`i_survey_questions` ;

CREATE  TABLE IF NOT EXISTS `ifoodbag`.`i_survey_questions` (
  `question_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `question` VARCHAR(100) NOT NULL ,
  `question_type` TINYINT NOT NULL ,
  `question_content` TEXT NOT NULL ,
  PRIMARY KEY (`question_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ifoodbag`.`i_survey_answer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ifoodbag`.`i_survey_answer` ;

CREATE  TABLE IF NOT EXISTS `ifoodbag`.`i_survey_answer` (
  `survey_id` INT(10) UNSIGNED NOT NULL ,
  `question_id` TINYINT UNSIGNED NOT NULL ,
  `answer` TEXT NOT NULL ,
  PRIMARY KEY (`survey_id`, `question_id`) ,
  INDEX `FK_answer_survey_info_idx` (`survey_id` ASC) ,
  INDEX `FK_answer_questions_idx` (`question_id` ASC) ,
  CONSTRAINT `FK_answer_survey_info`
    FOREIGN KEY (`survey_id` )
    REFERENCES `ifoodbag`.`i_survey_info` (`survey_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_answer_questions`
    FOREIGN KEY (`question_id` )
    REFERENCES `ifoodbag`.`i_survey_questions` (`question_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

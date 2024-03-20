-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ticket_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ticket_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ticket_system` DEFAULT CHARACTER SET utf8 ;
USE `ticket_system` ;

-- -----------------------------------------------------
-- Table `ticket_system`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ticket_system`.`user` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));
  



-- -----------------------------------------------------
-- Table `ticket_system`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ticket_system`.`ticket` (
  `id` INT AUTO_INCREMENT NOT NULL,
  `ticketname` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

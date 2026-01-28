-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema excercici2.A
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema excercici2.A
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `excercici2.A` ;
USE `excercici2.A` ;

-- -----------------------------------------------------
-- Table `excercici2.A`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `excercici2.A`.`PACIENT` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `Telefon Mobil` VARCHAR(13) NULL,
  `Dirreccio` VARCHAR(100) NULL,
  `NumeroSS` VARCHAR(25) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `excercici2.A`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `excercici2.A`.`Metge` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(100) NOT NULL,
  `NombreColegiat` VARCHAR(25) NOT NULL,
  `Epecialitat` VARCHAR(100) NULL,
  `Carrec` VARCHAR(100) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `excercici2.A`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `excercici2.A`.`Consulta` (
  `Data` DATE NULL,
  `Despatx` VARCHAR(45) NULL,
  `Diagnostic` VARCHAR(255) NULL,
  `PACIENT_ID` INT NOT NULL,
  `Metge_ID` INT NOT NULL,
  `ID` INT NOT NULL,
  INDEX `fk_Consulta_PACIENT_idx` (`PACIENT_ID` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_ID` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_PACIENT`
    FOREIGN KEY (`PACIENT_ID`)
    REFERENCES `excercici2.A`.`PACIENT` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_ID`)
    REFERENCES `excercici2.A`.`Metge` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

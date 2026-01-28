-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici5` ;
USE `Exercici5` ;

-- -----------------------------------------------------
-- Table `Exercici5`.`TipusVehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`TipusVehicle` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Vehicle` (
  `ID` INT NOT NULL,
  `NumBastidor` VARCHAR(25) NULL,
  `Marca` VARCHAR(50) NULL,
  `Model` VARCHAR(50) NULL,
  `Matricula` VARCHAR(20) NULL,
  `TipusVehicle_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Vehicle_TipusVehicle_idx` (`TipusVehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_TipusVehicle`
    FOREIGN KEY (`TipusVehicle_ID`)
    REFERENCES `Exercici5`.`TipusVehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Client` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(100) NULL,
  `Dirrecio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(14) NULL,
  `poblacio` VARCHAR(100) NULL,
  `Email` VARCHAR(100) NULL,
  `Usuari` VARCHAR(50) NULL,
  `Contrasenya` VARCHAR(50) NULL,
  `Vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Client_Vehicle1_idx` (`Vehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Vehicle1`
    FOREIGN KEY (`Vehicle_ID`)
    REFERENCES `Exercici5`.`Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Cita` (
  `ID` INT NOT NULL,
  `Dia` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Vehicle_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_ID`)
    REFERENCES `Exercici5`.`Vehicle` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici7` ;
USE `Exercici7` ;

-- -----------------------------------------------------
-- Table `Exercici7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Producte` (
  `ID` INT NOT NULL,
  `Descripcio` VARCHAR(45) NULL,
  `PreuUnitat` VARCHAR(45) NULL,
  `Quantitiat` VARCHAR(45) NULL,
  `CodiBarres` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `PVP` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Venedor` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Dirreccio` VARCHAR(45) NULL,
  `DataNeixament` VARCHAR(45) NULL,
  `Telefon` VARCHAR(14) NULL,
  `DNI` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Client` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Dirreccio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`Tiquet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`Tiquet` (
  `ID` INT NOT NULL,
  `NumFactura` VARCHAR(45) NULL,
  `Data` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Total` VARCHAR(45) NULL,
  `Venedor_ID` INT NOT NULL,
  `Client_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Tiquet_Venedor1_idx` (`Venedor_ID` ASC) VISIBLE,
  INDEX `fk_Tiquet_Client1_idx` (`Client_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Tiquet_Venedor1`
    FOREIGN KEY (`Venedor_ID`)
    REFERENCES `Exercici7`.`Venedor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tiquet_Client1`
    FOREIGN KEY (`Client_ID`)
    REFERENCES `Exercici7`.`Client` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici7`.`LiniaTiquet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici7`.`LiniaTiquet` (
  `ID` INT NOT NULL,
  `Unitat` VARCHAR(45) NULL,
  `Descomte` VARCHAR(45) NULL,
  `Producte_ID` INT NOT NULL,
  `Tiquet_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_LiniaTiquet_Producte_idx` (`Producte_ID` ASC) VISIBLE,
  INDEX `fk_LiniaTiquet_Tiquet1_idx` (`Tiquet_ID` ASC) VISIBLE,
  CONSTRAINT `fk_LiniaTiquet_Producte`
    FOREIGN KEY (`Producte_ID`)
    REFERENCES `Exercici7`.`Producte` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LiniaTiquet_Tiquet1`
    FOREIGN KEY (`Tiquet_ID`)
    REFERENCES `Exercici7`.`Tiquet` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici4` ;
USE `Exercici4` ;

-- -----------------------------------------------------
-- Table `Exercici4`.`TiposPolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`TiposPolissa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Venedor` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(100) NULL,
  `Dirreccio` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `telefon` VARCHAR(14) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`Polisa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Polisa` (
  `ID` INT NOT NULL,
  `Numero` VARCHAR(25) NULL,
  `Preu` INT NULL,
  `TiposPagament` VARCHAR(100) NULL,
  `DataContractacio` DATE NULL,
  `DataInici` DATE NULL,
  `DataFinal` DATE NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Client` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(100) NULL,
  `Dirreccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(14) NULL,
  `VIP` TINYINT NULL,
  `TiposPolissa_ID` INT NOT NULL,
  `Venedor_ID` INT NOT NULL,
  `Polisa_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Client_TiposPolissa1_idx` (`TiposPolissa_ID` ASC) VISIBLE,
  INDEX `fk_Client_Venedor1_idx` (`Venedor_ID` ASC) VISIBLE,
  INDEX `fk_Client_Polisa1_idx` (`Polisa_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Client_TiposPolissa1`
    FOREIGN KEY (`TiposPolissa_ID`)
    REFERENCES `Exercici4`.`TiposPolissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Venedor1`
    FOREIGN KEY (`Venedor_ID`)
    REFERENCES `Exercici4`.`Venedor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Polisa1`
    FOREIGN KEY (`Polisa_ID`)
    REFERENCES `Exercici4`.`Polisa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`VIP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`VIP` (
  `ID` INT NOT NULL,
  `SI` VARCHAR(45) NULL,
  `NO` VARCHAR(45) NULL,
  `Client_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_VIP_Client_idx` (`Client_ID` ASC) VISIBLE,
  CONSTRAINT `fk_VIP_Client`
    FOREIGN KEY (`Client_ID`)
    REFERENCES `Exercici4`.`Client` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici6` ;
USE `Exercici6` ;

-- -----------------------------------------------------
-- Table `Exercici6`.`Avions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Avions` (
  `ID` INT NOT NULL,
  `Model` VARCHAR(100) NULL,
  `Fabricant` VARCHAR(255) NULL,
  `Capacitat` INT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Passatger` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(100) NULL,
  `DNI` VARCHAR(45) NULL,
  `Dirreccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(14) NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Vols`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Vols` (
  `ID` INT NOT NULL,
  `NumVol` VARCHAR(7) NULL,
  `Orgien` VARCHAR(100) NULL,
  `Desti` VARCHAR(100) NULL,
  `DataSortida` VARCHAR(45) NULL,
  `DataArribada` VARCHAR(45) NULL,
  `HoraSortida` VARCHAR(45) NULL,
  `HoraArribada` VARCHAR(45) NULL,
  `Avions_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Vols_Avions1_idx` (`Avions_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vols_Avions1`
    FOREIGN KEY (`Avions_ID`)
    REFERENCES `Exercici6`.`Avions` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici6`.`Reserva` (
  `ID` INT NOT NULL,
  `Identificador` VARCHAR(45) NULL,
  `DataReserva` VARCHAR(45) NULL,
  `Import` VARCHAR(45) NULL,
  `Codi` VARCHAR(10) NULL,
  `Passatger_ID` INT NOT NULL,
  `Vols_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Reserva_Passatger_idx` (`Passatger_ID` ASC) VISIBLE,
  INDEX `fk_Reserva_Vols1_idx` (`Vols_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Passatger`
    FOREIGN KEY (`Passatger_ID`)
    REFERENCES `Exercici6`.`Passatger` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Vols1`
    FOREIGN KEY (`Vols_ID`)
    REFERENCES `Exercici6`.`Vols` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

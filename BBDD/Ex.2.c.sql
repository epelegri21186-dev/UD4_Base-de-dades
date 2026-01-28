-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2.C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2.C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2.C` ;
USE `Exercici2.C` ;

-- -----------------------------------------------------
-- Table `Exercici2.C`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.C`.`Alumne` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(100) NULL,
  `DNI` VARCHAR(9) NULL,
  `Dirreccio` VARCHAR(100) NULL,
  `Telefon` VARCHAR(14) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.C`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.C`.`Departament` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(100) NULL,
  `Dirreccio` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.C`.`Modul`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.C`.`Modul` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Credits` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.C`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.C`.`Profesor` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(100) NULL,
  `Dirreccio` VARCHAR(255) NULL,
  `Telefon` VARCHAR(14) NULL,
  `Especialitat` VARCHAR(45) NULL,
  `Departament_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Profesor_Departament1_idx` (`Departament_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Profesor_Departament1`
    FOREIGN KEY (`Departament_ID`)
    REFERENCES `Exercici2.C`.`Departament` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.C`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.C`.`Matricula` (
  `ID` INT NOT NULL,
  `CursAcademic` VARCHAR(45) NULL,
  `Alumne_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE,
  INDEX `fk_Matricula_Alumne_idx` (`Alumne_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumne`
    FOREIGN KEY (`Alumne_ID`)
    REFERENCES `Exercici2.C`.`Alumne` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici2.C`.`ModulMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.C`.`ModulMatricula` (
  `ID` INT NOT NULL,
  `Matricula_ID` INT NOT NULL,
  `Modul_ID` INT NOT NULL,
  `Profesor_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_ModulMatricula_Matricula1_idx` (`Matricula_ID` ASC) VISIBLE,
  INDEX `fk_ModulMatricula_Modul1_idx` (`Modul_ID` ASC) VISIBLE,
  INDEX `fk_ModulMatricula_Profesor1_idx` (`Profesor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ModulMatricula_Matricula1`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `Exercici2.C`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModulMatricula_Modul1`
    FOREIGN KEY (`Modul_ID`)
    REFERENCES `Exercici2.C`.`Modul` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModulMatricula_Profesor1`
    FOREIGN KEY (`Profesor_ID`)
    REFERENCES `Exercici2.C`.`Profesor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

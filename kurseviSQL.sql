-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema kursevi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kursevi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kursevi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `kursevi` ;

-- -----------------------------------------------------
-- Table `kursevi`.`Grupa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Grupa` (
  `idGrupa` INT NOT NULL AUTO_INCREMENT,
  `tip` VARCHAR(45) NOT NULL,
  `velicina` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGrupa`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Jezik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Jezik` (
  `idJezik` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idJezik`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Kategorija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Kategorija` (
  `idKategorija` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idKategorija`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Komentar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Komentar` (
  `idKomentar` INT NOT NULL AUTO_INCREMENT,
  `opis` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idKomentar`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Nivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Nivo` (
  `idNivo` INT NOT NULL AUTO_INCREMENT,
  `oznaka` VARCHAR(30) NOT NULL,
  `opis` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idNivo`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Profesor` (
  `idProfesor` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NULL DEFAULT NULL,
  `prezime` VARCHAR(45) NULL DEFAULT NULL,
  `jmbg` VARCHAR(45) NULL DEFAULT NULL,
  `datumRodjenja` DATE NULL DEFAULT NULL,
  `adresa` VARCHAR(45) NULL DEFAULT NULL,
  `telefon` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `plata` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`idProfesor`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`VrstaKursa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`VrstaKursa` (
  `idVrstaKursa` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVrstaKursa`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Kurs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Kurs` (
  `idKurs` INT NOT NULL AUTO_INCREMENT,
  `idJezik` INT NOT NULL,
  `idVrstaKursa` INT NOT NULL,
  `idGrupa` INT NULL DEFAULT NULL,
  `idNivo` INT NULL DEFAULT NULL,
  `trajanje` VARCHAR(45) NULL DEFAULT NULL,
  `opis` VARCHAR(45) NULL DEFAULT NULL,
  `cena` DOUBLE NULL DEFAULT NULL,
  `idProfesor` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idKurs`),
  INDEX `fk_Kurs_idJezik_idx` (`idJezik` ASC) VISIBLE,
  INDEX `fk_Kurs_idVrstaKursa_idx` (`idVrstaKursa` ASC) VISIBLE,
  INDEX `fk_Kurs_idGrupa_idx` (`idGrupa` ASC) VISIBLE,
  INDEX `fk_Kurs_idNivo_idx` (`idNivo` ASC) VISIBLE,
  INDEX `fk_Kurs_Profesor1_idx` (`idProfesor` ASC) VISIBLE,
  CONSTRAINT `fk_Kurs_Grupa1`
    FOREIGN KEY (`idGrupa`)
    REFERENCES `kursevi`.`Grupa` (`idGrupa`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_Kurs_Jezik1`
    FOREIGN KEY (`idJezik`)
    REFERENCES `kursevi`.`Jezik` (`idJezik`),
  CONSTRAINT `fk_Kurs_Nivo1`
    FOREIGN KEY (`idNivo`)
    REFERENCES `kursevi`.`Nivo` (`idNivo`),
  CONSTRAINT `fk_Kurs_Profesor1`
    FOREIGN KEY (`idProfesor`)
    REFERENCES `kursevi`.`Profesor` (`idProfesor`),
  CONSTRAINT `fk_Kurs_VrstaKursa1`
    FOREIGN KEY (`idVrstaKursa`)
    REFERENCES `kursevi`.`VrstaKursa` (`idVrstaKursa`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Uloga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Uloga` (
  `idUloga` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idUloga`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Osoba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Osoba` (
  `idOsoba` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `jmbg` VARCHAR(45) NULL DEFAULT NULL,
  `datumRodjenja` DATE NULL DEFAULT NULL,
  `brojTel` VARCHAR(45) NULL DEFAULT NULL,
  `idUloga` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idOsoba`),
  INDEX `fk_Osoba_uloga1_idx` (`idUloga` ASC) VISIBLE,
  CONSTRAINT `fk_Osoba_Uloga1`
    FOREIGN KEY (`idUloga`)
    REFERENCES `kursevi`.`Uloga` (`idUloga`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Ponuda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Ponuda` (
  `idPonuda` INT NOT NULL AUTO_INCREMENT,
  `idKurs` INT NULL DEFAULT NULL,
  `pocetakDatum` DATE NULL DEFAULT NULL,
  `krajDatum` DATE NULL DEFAULT NULL,
  `maxOsoba` INT NULL DEFAULT NULL,
  `rok` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idPonuda`),
  INDEX `fk_AktivniKursevi_Kurs1_idx` (`idKurs` ASC) VISIBLE,
  CONSTRAINT `fk_AktivniKursevi_Kurs1`
    FOREIGN KEY (`idKurs`)
    REFERENCES `kursevi`.`Kurs` (`idKurs`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `kursevi`.`Upis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kursevi`.`Upis` (
  `idUpis` INT NOT NULL AUTO_INCREMENT,
  `idOsoba` INT NULL DEFAULT NULL,
  `idKurs` INT NULL DEFAULT NULL,
  `idKategorija` INT NULL DEFAULT NULL,
  `idNivo` INT NULL DEFAULT NULL,
  `idKomentar` INT NULL DEFAULT NULL,
  `datumUpisa` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idUpis`),
  INDEX `fk_Upis_Osoba1_idx` (`idOsoba` ASC) VISIBLE,
  INDEX `fk_Upis_Kategorija1_idx` (`idKategorija` ASC) VISIBLE,
  INDEX `fk_Upis_Nivo1_idx` (`idNivo` ASC) VISIBLE,
  INDEX `fk_Upis_Komentar_idx` (`idKomentar` ASC) VISIBLE,
  INDEX `fk_Upis_Kurs1_idx` (`idKurs` ASC) VISIBLE,
  CONSTRAINT `fk_Upis_Kategorija1`
    FOREIGN KEY (`idKategorija`)
    REFERENCES `kursevi`.`Kategorija` (`idKategorija`),
  CONSTRAINT `fk_Upis_Komentar`
    FOREIGN KEY (`idKomentar`)
    REFERENCES `kursevi`.`Komentar` (`idKomentar`),
  CONSTRAINT `fk_Upis_Kurs1`
    FOREIGN KEY (`idKurs`)
    REFERENCES `kursevi`.`Kurs` (`idKurs`),
  CONSTRAINT `fk_Upis_Nivo1`
    FOREIGN KEY (`idNivo`)
    REFERENCES `kursevi`.`Nivo` (`idNivo`),
  CONSTRAINT `fk_Upis_Osoba1`
    FOREIGN KEY (`idOsoba`)
    REFERENCES `kursevi`.`Osoba` (`idOsoba`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Bill_Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill_Payment` (
  `idBill_Payment` INT NOT NULL,
  `BillID` INT NULL,
  `PaymentID` INT NULL,
  PRIMARY KEY (`idBill_Payment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `idBill` INT NOT NULL,
  `TotalBill` INT NULL,
  `BillID` INT NULL,
  PRIMARY KEY (`idBill`),
  INDEX `BillID_idx` (`BillID` ASC),
  CONSTRAINT `BillID`
    FOREIGN KEY (`BillID`)
    REFERENCES `mydb`.`Bill_Payment` (`idBill_Payment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dokter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dokter` (
  `idDokter` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Date_of_birth` DATE NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Salary` VARCHAR(45) NULL,
  `BillID` INT NULL,
  PRIMARY KEY (`idDokter`),
  INDEX `BillID_idx` (`BillID` ASC),
  CONSTRAINT `BillID`
    FOREIGN KEY (`BillID`)
    REFERENCES `mydb`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `idMedical` INT NOT NULL,
  `Overtime_rate` VARCHAR(45) NULL,
  `MedicalID` INT NULL,
  PRIMARY KEY (`idMedical`),
  INDEX `MedicalID_idx` (`MedicalID` ASC),
  CONSTRAINT `MedicalID`
    FOREIGN KEY (`MedicalID`)
    REFERENCES `mydb`.`Dokter` (`idDokter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `idSpecialist` INT NOT NULL,
  `Field_area` VARCHAR(45) NULL,
  `SpecialistID` INT NULL,
  PRIMARY KEY (`idSpecialist`),
  INDEX `SpecialistID_idx` (`SpecialistID` ASC),
  CONSTRAINT `SpecialistID`
    FOREIGN KEY (`SpecialistID`)
    REFERENCES `mydb`.`Dokter` (`idDokter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `idPayment` INT NOT NULL,
  `Details` VARCHAR(45) NULL,
  `Method` VARCHAR(45) NULL,
  `PaymentID` INT NULL,
  PRIMARY KEY (`idPayment`),
  INDEX `PaymentID_idx` (`PaymentID` ASC),
  CONSTRAINT `PaymentID`
    FOREIGN KEY (`PaymentID`)
    REFERENCES `mydb`.`Bill_Payment` (`idBill_Payment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `NamePatient` VARCHAR(45) NULL,
  `AddressPatient` VARCHAR(45) NULL,
  `Phone_numberPatient` VARCHAR(45) NULL,
  `Date_of_birthPatient` VARCHAR(45) NULL,
  `PaymentID` INT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `PaymentID_idx` (`PaymentID` ASC),
  CONSTRAINT `PaymentID`
    FOREIGN KEY (`PaymentID`)
    REFERENCES `mydb`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `DateAppointment` DATE NULL,
  `TimeAppointment` VARCHAR(45) NULL,
  `AppointmentID` INT NULL,
  `PatientID` INT NULL,
  `DokterID` INT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `PatientID_idx` (`PatientID` ASC),
  INDEX `DokterID_idx` (`DokterID` ASC),
  CONSTRAINT `PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DokterID`
    FOREIGN KEY (`DokterID`)
    REFERENCES `mydb`.`Dokter` (`idDokter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `idMedical` INT NOT NULL,
  `Overtime_rate` VARCHAR(45) NULL,
  `MedicalID` INT NULL,
  PRIMARY KEY (`idMedical`),
  INDEX `MedicalID_idx` (`MedicalID` ASC),
  CONSTRAINT `MedicalID`
    FOREIGN KEY (`MedicalID`)
    REFERENCES `mydb`.`Dokter` (`idDokter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `idSpecialist` INT NOT NULL,
  `Field_area` VARCHAR(45) NULL,
  `SpecialistID` INT NULL,
  PRIMARY KEY (`idSpecialist`),
  INDEX `SpecialistID_idx` (`SpecialistID` ASC),
  CONSTRAINT `SpecialistID`
    FOREIGN KEY (`SpecialistID`)
    REFERENCES `mydb`.`Dokter` (`idDokter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `DateAppointment` DATE NULL,
  `TimeAppointment` VARCHAR(45) NULL,
  `AppointmentID` INT NULL,
  `PatientID` INT NULL,
  `DokterID` INT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `PatientID_idx` (`PatientID` ASC),
  INDEX `DokterID_idx` (`DokterID` ASC),
  CONSTRAINT `PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DokterID`
    FOREIGN KEY (`DokterID`)
    REFERENCES `mydb`.`Dokter` (`idDokter`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

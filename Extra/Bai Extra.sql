DROP DATABASE IF EXISTS quanlyfresher;
CREATE DATABASE Quanlyfresher;
use quanlyfresher;

DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
TraineeID INT AUTO_INCREMENT PRIMARY KEY,
Full_Name VARCHAR(50),
Birth_Date DATE,
Gender	ENUM('Male', 'Female', 'Unknown'),
ET_IQ    INT,
ET_Gmath 	INT,
ET_English	INT,
Training_Class	INT,
Evaluation_Notes TEXT
);

alter table Trainee
ADD VTI_Account VARCHAR(50);

INSERT INTO Trainee (Gender) VALUES ('Male');


CREATE TABLE Datatypes(
ID INT PRIMARY KEY AUTO_INCREMENT,	
Namee VARCHAR(50),
Codes VARCHAR(5),
ModifiedDate Datetime Default now()

);


CREATE TABLE Datatypes2(
ID INT PRIMARY KEY AUTO_INCREMENT,	
Namee VARCHAR(50),
Gender VARCHAR(10),

IsDeletedFlag BOOL
);
INSERT INTO Datatypes2 (Gender) VALUES (1);

UPDATE Datatypes2
SET Gender = CASE
WHEN Gender = 0 then 'Male'
WHEN Gender = 1 then 'Female'
When Gender = null then 'Unknown'
else Gender END;

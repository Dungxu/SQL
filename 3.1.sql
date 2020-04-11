
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
TraineeID 		INT AUTO_INCREMENT PRIMARY KEY,
Full_Name 		VARCHAR(50)NOT NULL,
Birth_Date 		DATE NOT NULL,
Gender			ENUM('Male', 'Female', 'Unknown') NOT NULL,
ET_IQ    		INT,
ET_Gmath 		INT,
ET_English		INT,
Training_Class	INT,
Evaluation_Notes TEXT 
);
INSERT INTO Trainee (Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class )
VALUES               ('Dung',    '1999-1-5', 'Male' , 15,    15 ,       30,          2 );
                     ('Cuong',   '1999-9-26','Male',   9,     9 ,       31 ,         3);
                     ('Lam',     '1999-12-30', 'Male', 10 ,   10 ,       32         ,5);
                     ('Tuan',    '1999-10-2', 'Male', 11,     11 ,        33,       2);
                     ('Dai',     '1999-9-14', 'Male', 7 ,      7 ,        27 ,       3);
                     ('Lan',     '1999-12-3', 'Female', 6     ,6 ,        26,         5);
                     ('Linh',    '1999-4-13', 'Female', 5,     5,         25,        2);
                     ('Hoa',     '1999-4-9', 'Female', 14,    14,        34,        3);
                     ('Mai',     '1999-4-8', 'Female', 16,     16,        23,       5);
                     ('Dao',     '1999-1-10', 'Female', 2,     2,         12,       2);
 SELECT * 
FROM Trainee
WHERE ET_IQ >= 8 and ET_Gmath >= 8 AND ET_IQ + ET_Gmath >= 20 AND ET_English >= 18 GROUP BY Birth_Date;

SELECT  TraineeID, Full_Name, year(current_date()) - YEAR(Birth_Date) AS 'Tuoi', Gender, ET_IQ, ET_Gmath, ET_English, Training_Class
FROM Trainee
where length(Full_Name) = (select Max(length(Full_Name)) from Trainee);

DELETE FROM Trainee WHERE TraineeID = 3 ;

UPDATE Trainee
SET Training_Class = 2
WHERE TraineeID = 5;


USE baithidauvao;
CREATE TABLE Department(
DepartmentID  				INT AUTO_INCREMENT PRIMARY KEY,
DepartmentName 				VARCHAR(50) 
);

CREATE TABLE Positions (
PositionID 					INT AUTO_INCREMENT PRIMARY KEY,
PositionName 				VARCHAR(20)

);

CREATE TABLE Accounts(
AccountID 					INT auto_increment PRIMARY KEY,		
Emails  						VARCHAR(50),
FullName 					VARCHAR(50),
DepartmentID 				INT  NOT NULL,
PositionID 					INT	NOT NULL,
CreateDate 					DATETIME DEFAULT now(),

FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID) ,
FOREIGN KEY (PositionID) REFERENCES Positions (PositionID) 
) ;

CREATE TABLE Groups(
GroupID  					INT AUTO_INCREMENT PRIMARY KEY ,
GroupName  					VARCHAR(50),
CreatorID	 				INT NOT NULL,
CreateDate 					DATETIME DEFAULT now()
);

CREATE TABLE GroupAccount(
GroupID   					INT AUTO_INCREMENT  NOT NULL,
AccountID					INT	NOT NULL,
JoinDate 					DATETIME DEFAULT now(),
FOREIGN KEY (GroupID) REFERENCES Groups (GroupID),
FOREIGN KEY (AccountID) REFERENCES Accounts (AccountID)

);

CREATE TABLE TypeQuestion(
TypeID						INT AUTO_INCREMENT PRIMARY KEY,
TypeName					VARCHAR(50)
);

CREATE TABLE CategoryQuestion(
CategoryID					INT AUTO_INCREMENT PRIMARY KEY,
CategoryName				VARCHAR(50)
);

CREATE TABLE Question(
QuestionID					INT AUTO_INCREMENT PRIMARY KEY,
Content						VARCHAR(100),
CategoryID					INT NOT NULL,
TypeID						INT NOT NULL,
CreatorID					INT NOT NULL,
CreateDate					DATETIME DEFAULT now(),
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID)
);

CREATE TABLE Answer(
AnswerID					INT AUTO_INCREMENT PRIMARY KEY,
Content						VARCHAR(100),
QuestionID					INT NOT NULL,
isCorrect 					BOOL,
FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);

CREATE TABLE Exam(
ExamID						INT AUTO_INCREMENT PRIMARY KEY,
CodeExam					INT NOT NULL,
Title						VARCHAR(50),
CategoryID					INT NOT NULL,
Duration					INT NOT NULL,
CreatorID					INT NOT NULL,
CreateDate					DATETIME DEFAULT now()
);

CREATE TABLE ExamQuestion(
ExamID						INT AUTO_INCREMENT ,
QuestionID					INT NOT NULL,
FOREIGN KEY (ExamID) REFERENCES Exam (ExamID),
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);



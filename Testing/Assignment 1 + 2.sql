-- Create Testingsystem Databese--
DROP DATABASE IF EXISTS Testingsystem;
CREATE DATABASE  		Testingsystem;
USE 					Testingsystem;

-- Create Department Table --
DROP TABLE IF EXISTS         Department;
CREATE  TABLE IF NOT EXISTS  Department (
		Department_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
		Department_name		NVARCHAR(50) NOT NULL
);

-- Creat Position Table --
DROP TABLE IF EXISTS        `Position`;
CREATE 	TABLE IF NOT EXISTS `Position` (
		Position_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Position_name 	NVARCHAR(50) NOT NULL
);

-- Create Account Table --
DROP TABLE IF EXISTS `Account`;
CREATE TABLE IF NOT EXISTS		 `Account`(
		Account_id		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
        Email			NVARCHAR(50) NOT NULL UNIQUE,
        Username		VARCHAR(10) NOT NULL,
        Fullname  		NVARCHAR(30) NOT NULL,
        Department_id 	TINYINT UNSIGNED NOT NULL ,
        Position_id		TINYINT UNSIGNED NOT NULL ,
        Create_date 	DATETIME DEFAULT NOW(),
        FOREIGN KEY (Department_id) REFERENCES Department (Department_id),
        FOREIGN KEY (Position_id) REFERENCES `Position`(Position_id)
);

-- Create `Group` Table --
DROP TABLE IF EXISTS `Group`;
CREATE TABLE IF NOT EXISTS	 `Group` (
		Group_id 		TINYINT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,  
		Group_name  	NVARCHAR(50) NOT NULL,
        Creator_id  	TINYINT NOT NULL, 
        Create_date		DATETIME DEFAULT NOW()
);  

-- Create GroupAccount Table --
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE IF NOT EXISTS		 GroupAccount (
		ID			TINYINT AUTO_INCREMENT PRIMARY KEY,
		Group_id    TINYINT UNSIGNED NOT NULL,
        Account_id  TINYINT UNSIGNED NOT NULL,
        Join_date   DATETIME DEFAULT NOW(),
        FOREIGN KEY (Group_id) REFERENCES `Group` (Group_id),
        FOREIGN KEY (Account_id) REFERENCES `Account`(Account_id)
);

-- Create TypeQuestion Table --
DROP TABLE IF EXISTS  TypeQuestion;
CREATE TABLE IF NOT EXISTS		  TypeQuestion (
		Type_id      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Type_name    NVARCHAR(100) NOT NULL 
 );
 
 -- Create CategoryQuestion Table --
 DROP TABLE IF EXISTS         CategoryQuestion;
 CREATE TABLE IF NOT EXISTS   CategoryQuestion (
		Category_id   TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Category_name NVARCHAR(100) NOT NULL
);

-- Create Question Table --
DROP TABLE IF EXISTS        Question;
CREATE TABLE IF NOT EXISTS  Question (
		Question_id  TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Content 	 TEXT NOT NULL,
        Category_id  TINYINT UNSIGNED NOT NULL,
        Type_id      TINYINT UNSIGNED NOT NULL,
        Creator_id   TINYINT UNSIGNED NOT NULL,
        Create_date  DATETIME DEFAULT NOW(),
        FOREIGN KEY (Type_id ) REFERENCES TypeQuestion (Type_id),
        FOREIGN KEY (Category_id) REFERENCES CategoryQuestion (Category_id)
);

-- Create Answer Table --
DROP TABLE IF EXISTS         Answer;
CREATE TABLE IF NOT EXISTS   Answer (
		Answer_id      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Content       TEXT NOT NULL,
        Question_id   TINYINT UNSIGNED NOT NULL,
        isCorrect     ENUM('True', 'False') NOT NULL, 
        FOREIGN KEY (Question_id) REFERENCES Question (Question_id)
);

-- Create Exam Table --
DROP TABLE IF EXISTS         Exam;
CREATE TABLE IF NOT EXISTS   Exam (
		Exam_id      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        `Code`       INT UNSIGNED UNIQUE,
        Title     	 VARCHAR(500) NOT NULL,
		Category_id  TINYINT UNSIGNED NOT NULL,
        Duration     TINYINT UNSIGNED  NOT NULL,                                                           
		Creator_id   TINYINT UNSIGNED NOT NULL,
        Create_date  DATETIME DEFAULT NOW() NOT NULL,

        FOREIGN KEY (Category_id) REFERENCES CategoryQuestion (Category_id)
);

-- Create ExamQuestion Table --
DROP TABLE IF EXISTS         ExamQuestion;
CREATE TABLE IF NOT EXISTS   ExamQuestion (
		Exam_id     TINYINT UNSIGNED NOT NULL,
        Question_id TINYINT UNSIGNED NOT NULL,
        PRIMARY KEY (Exam_id, Question_id),
		FOREIGN KEY (Exam_id) REFERENCES Exam (Exam_id),
        FOREIGN KEY (Question_id) REFERENCES Question (Question_id)
);


USE 				Testingsystem;
    -- Create Department Table --
INSERT INTO 		Department( Department_name)
VALUES                        ( 'Marketing'       ),       
							  ( 'sale'            ),       
							  ( 'Manager'         ),       
                              ( 'Accounting'      ),       
                              ( 'Administration'  ),       
                              ( 'Training'        ),       
                              ( 'Human Resource'  ),       
                              ( 'Customer Service'),       
                              ( 'Client Service'  ),       
							  ('Production'       );		
                              
                              
    -- Creat Position Table -- 
INSERT INTO 		`Position`(Position_name)
VALUES						  ( 'Customers Service' ),
                              ( 'Saleman'        ),
                              ( 'ScrumMaster' ),
                              ( 'PM'          ),
                              ('Developer') ;
		
        
	-- Create Account Table --
 INSERT INTO 		`Account`(       Email                  ,    Username ,    Fullname            , Department_id, Position_id)
 VALUES                      ('Cuong.do@gmail.com',		'Cuong',			'Do Van Cuong',				10,				3      ),
							 ('Lam.nguyen@gmail.com',   'Lam',				'Nguyen Xuan Lam ',			2,				2      ),     
                             ('Dung.nguyen@gmail.com',	'Dung',   			'Nguyen Cong Dung',			10,			  	5      ),    
                             ('Tuan.le@gmail.com',		'Tuan',				'Le Anh Tuan',				1,				1      ),     
                             ('Dai.nguyen@gmail.com',   'Dai',				'Nguyen Duy Dai',			9,				2      ),     
                             ('Thanh.do@gmail.com',		'Thanh',			'Do Tien Thanh',			3,				2      ),     
                             ('Hung.nguyen@gmail.com',	'Hung',				'Nguyen Cong Hung',			9,				5      ),          
                             ('Nhan.cung@gmail.com',    'Nhan',				'Cung Dai Nhan',			9,				1      ),     
                             ('Tran.ly@gmail.com',		'Tran',				'Ly Tran Tran',				1,				2      ),     
                             ('Linh.phan@gmail.com',	'Linh',				'Phan Quang Linh',			2,				4      );     
                             

	-- Create `Group` Table --
INSERT INTO 		`Group`  ( Group_name   ,   Creator_id )   
VALUES 				         ( 'Group A '   ,     	1        ),       
							 ( 'Group B '   ,     	3        ),       
							 ( 'Group C '   ,     	2        ),       
							 ( 'Group D '   ,     	5        ),       
							 ( 'Group E '   ,     	4        ),       
                             ( 'Group F '   ,	  	2       ),       
                             ( 'Group G '   ,		3        ),        
                             ( 'Group H '   ,		5        ),       
                             ( 'Group J '   ,		4        ),       
                             ( 'Group K'   ,		2      );       
                            -- 
-- Create GroupAccount Table --
INSERT INTO  	GroupAccount (  Group_id    ,    Account_id  )              
 VALUES                      (     3        ,       6        ),      
							 (     2        ,       5        ),      
                             (     1        ,       3        ),      
						     (     5        ,       4        ),      
                             (     4        ,       2        ),      
                             (     5        ,       1        ),      
                             (     3        ,       7        ),      
                             (     2        ,       8        ),      
                             (     1        ,       9       ),       
                             (     4        ,       1        );      
                             
-- Create TypeQuestion Table --
INSERT INTO    TypeQuestion  (   Type_name    )
VALUES                       ( 'Essay'        ),
                             ('Numerica'       ),
                             ('Multiple-Choice'),
                             ('Description'    ),
                             ( 'Stack'         ),
                             ('Caculated'      ),
                             ('Short Answer'   ),
                             ('Yes or No'      );
							

INSERT INTO  CategoryQuestion  ( Category_name)
VALUES                         (    'JAVA'      ),
                               (     'NET'      ),
							   (     'Ruby'     ),
                               (    'Postman'   ),
							   (     'HTML'     ),
                               (     'CSS'		), 
                               ( 'JavaScript'   ),
                               ( 'C++ '         ),
                               ( 'Ruby '		);
                               
-- Create Question Table --
INSERT INTO 		Question   (   Content      ,   Category_id  ,   Type_id    ,   Creator_id   )
VALUES                         ( 'JAVA ' ,				1        ,		1         ,      1         ),
							   ( 'SQL  '  ,				2        ,		8         ,      2         ),
                               ( '.NET' ,				3       ,		2         ,      4         ),
                               ('Postman ',				4        ,		2         ,      3         ),
					           ( 'HTML '  ,				5		,		4         ,	 	 4			),
                               (  'CSS '  ,				6		,		5         ,      1         ),
                               ('JavaScript',			7		,		2         ,	  	 5			),
                               ( 'C++ '  ,				8        ,		1         ,      1         ),
                               ('Ruby '   ,				9        ,		6         ,      2         );
                               
-- Create Answer Table --
INSERT INTO         Answer     (Content            , Question_id ,   isCorrect )
VALUES                         ('JAVA',						3   ,      'False'      ),
                               ('SQL  ',					2   ,      'True'      ),
                               ('.Net Framework ',			1   ,      'True'      ),
                               ('Postman ' ,				4   ,      'False'      ),
                               ('HTML',						5   ,      'False'   ),
							   ('CSS',						8   ,     	'True'		),
                               ('JavaScript' ,				9	,     'False'    ),
                               ( 'C++',						1	,    'True'	 );
                               
                               
                               
-- Create Exam Table --
INSERT INTO         Exam       (  `Code` ,     Title        ,    Category_id    ,   Duration          ,   Creator_id   )
VALUES                         (12 		, 'KIEM TRA'  ,         2         ,   		180      ,      1         ),    
                               (13 		, 'KIEM TRA'  ,         1         ,  	     80      ,      3         ),     
                               (14 		, 'KIEM TRA'  ,         4         ,   	    60      ,      4         ),                                    
                               (15  	, 'KIEM TRA'  ,         3         ,   		90       ,      2         ),
                               (16  	, 'KIEM TRA'  ,         2         ,   		60       ,      2         ),	
                               (17  	, 'KIEM TRA'  ,         2         ,   		90       ,      1         ), 	
                               (18      , 'KIEM TRA'  ,         3         ,   		60      ,      2         ),		
                               (19  	, 'KIEM TRA'  ,         1         ,   		90       ,      3         ),	
                               (20  	, 'KIEM TRA'  ,         3         ,   		120      ,      2         );	


    -- Create ExamQuestion Table --
INSERT INTO       ExamQuestion (     Exam_id    ,     Question_id   )
VALUES                         (       2        ,       2           ),     
							   (       1        ,       3           ),
                               (       3        ,       9           ),
                               (       4        ,       5           ),
						       (       4        ,       6           ),
                               (       3        ,       7           ),
							   (       3        ,       8           ),
							   (       1        ,       9           );











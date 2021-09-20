
use La_Festi_DB

CREATE TABLE tbl_CATEGORY (cat_id INT PRIMARY KEY, cat_name VARCHAR(30) NOT NULL, cat_img VARBINARY(MAX) NOT NULL)

alter table tbl_CATEGORY add IsActive bit not null default 0 

CREATE PROCEDURE PROC_CATEGORY @cat_id INT, @cat_name VARCHAR(30), @cat_img VARBINARY(MAX), @IsActive BIT
AS
BEGIN
INSERT INTO tbl_CATEGORY VALUES (@cat_id, @cat_name, @cat_img, @IsActive)
END;

EXEC PROC_CATEGORY 1, 'CHINESE', 


CREATE TABLE tbl_OUTLET (out_id INT PRIMARY KEY, out_name VARCHAR(30) NOT NULL, out_img VARBINARY(MAX) NOT NULL)

DROP TABLE tbl_OUTLET


SELECT * FROM tbl_CATEGORY

SELECT * FROM tbl_OUTLET


INSERT INTO tbl_CATEGORY VALUES(NEXT VALUE FOR seq_CATEGORY_ID, 'CHINESE','C:\Users\merit\Desktop\Preethi\Task 2\Images\chinese.jpg',1,GETDATE(),GETDATE())
INSERT INTO tbl_CATEGORY VALUES(NEXT VALUE FOR seq_CATEGORY_ID, 'EGYPTIAN','C:\Users\merit\Desktop\Preethi\Task 2\Images\Egyptian-food.jpg',1,GETDATE(),GETDATE())
INSERT INTO tbl_CATEGORY VALUES(NEXT VALUE FOR seq_CATEGORY_ID, 'ITALY','C:\Users\merit\Desktop\Preethi\Task 2\Images\Italy.jpg',1,GETDATE(),GETDATE())
INSERT INTO tbl_CATEGORY VALUES(NEXT VALUE FOR seq_CATEGORY_ID, 'MEXICAN','C:\Users\merit\Desktop\Preethi\Task 2\Images\Mexican.jpg',1,GETDATE(),GETDATE())
INSERT INTO tbl_CATEGORY VALUES(NEXT VALUE FOR seq_CATEGORY_ID, 'SRI LANKAN','C:\Users\merit\Desktop\Preethi\Task 2\Images\srilankan.jpg',1,GETDATE(),GETDATE())
INSERT INTO tbl_CATEGORY VALUES(NEXT VALUE FOR seq_CATEGORY_ID, 'THAI','C:\Users\merit\Desktop\Preethi\Task 2\Images\Thai.jpg',1,GETDATE(),GETDATE())
INSERT INTO tbl_CATEGORY VALUES(NEXT VALUE FOR seq_CATEGORY_ID, 'TURKISH','C:\Users\merit\Desktop\Preethi\Task 2\Images\turkish.jpg',1,GETDATE(),GETDATE())



SELECT * FROM tbl_CATEGORY

INSERT INTO tbl_OUTLET VALUES(NEXT VALUE FOR seq_OUTLET_ID, 'ANNA NAGAR','C:\Users\merit\Desktop\Preethi\Task 2\Images\Anna nagar tower.jpeg',1,GETDATE(),GETDATE())
INSERT INTO tbl_OUTLET VALUES(NEXT VALUE FOR seq_OUTLET_ID, 'CHENNAI AIRPORT','C:\Users\merit\Desktop\Preethi\Task 2\Images\Chennai Airport.jpeg',1,GETDATE(),GETDATE())
INSERT INTO tbl_OUTLET VALUES(NEXT VALUE FOR seq_OUTLET_ID, 'CHENNAI CENTRAL','C:\Users\merit\Desktop\Preethi\Task 2\Images\Chennai Central.jpeg',1,GETDATE(),GETDATE())
INSERT INTO tbl_OUTLET VALUES(NEXT VALUE FOR seq_OUTLET_ID, 'CMBT','C:\Users\merit\Desktop\Preethi\Task 2\Images\CMBT.jpeg',1,GETDATE(),GETDATE())
INSERT INTO tbl_OUTLET VALUES(NEXT VALUE FOR seq_OUTLET_ID, 'KATHIPARA','C:\Users\merit\Desktop\Preethi\Task 2\Images\Kathipara.jpeg',1,GETDATE(),GETDATE())
INSERT INTO tbl_OUTLET VALUES(NEXT VALUE FOR seq_OUTLET_ID, 'MADRAS HIGH COURT','C:\Users\merit\Desktop\Preethi\Task 2\Images\Madras High Court.jpeg',1,GETDATE(),GETDATE())
INSERT INTO tbl_OUTLET VALUES(NEXT VALUE FOR seq_OUTLET_ID, 'MARINA','C:\Users\merit\Desktop\Preethi\Task 2\Images\Marina.jpeg',1,GETDATE(),GETDATE())




SELECT * FROM tbl_OUTLET

-----------------CATEGORY---------------------------

CREATE TABLE tbl_CATEGORY (cat_id INT PRIMARY KEY, 
						   cat_name NVARCHAR(50) NOT NULL, 
						   cat_img IMAGE NOT NULL,
						   IsActive BIT NOT NULL,
						   created_date DATETIME,
						   modified_time DATETIME
						  )

-----------------SEQUENCE---------------------------

CREATE SEQUENCE seq_CATEGORY_ID
AS INT 
START WITH 1 INCREMENT BY 1

----------------SELECT ALL--------------------------

CREATE PROCEDURE SELECT_CATEGORY
AS 
BEGIN
SELECT * FROM tbl_CATEGORY
END

EXEC SELECT_CATEGORY

---------------SELECT-------------------------------

CREATE PROCEDURE SELECT_PART_CATEGORY
@cat_name NVARCHAR(50)
AS 
BEGIN
SELECT * FROM tbl_CATEGORY WHERE cat_name = @cat_name
END

EXEC [dbo].[SELECT_PART_CATEGORY]
@cat_name = 'CHINESE'

---------------INSERT--------------------------------

CREATE PROCEDURE INSERT_CATEGORY
@cat_name NVARCHAR(50),
@cat_img IMAGE,
@IsActive BIT
AS 
BEGIN
INSERT INTO tbl_CATEGORY(cat_id,cat_name,cat_img,IsActive,created_date,modified_time)
VALUES(NEXT VALUE FOR seq_CATEGORY_ID,@cat_name, @cat_img, @IsActive, GETDATE(),GETDATE())
END


EXEC [dbo].[INSERT_CATEGORY]
@cat_name = 'INDIAN',
@cat_img = 'C:\Users\merit\Desktop\Preethi\Task 2\Images\indian.jpg',
@IsActive = 1;

--------------UPDATE-----------------------------

CREATE PROCEDURE UPDATE_CATEGORY
@cat_id INT,
@cat_name NVARCHAR(50),
@cat_img IMAGE,
@IsActive BIT
AS 
BEGIN
UPDATE tbl_CATEGORY SET cat_name = @cat_name, 
						cat_img = @cat_img, 
						IsActive = @IsActive, 
						created_date = GETDATE(), 
						modified_time = GETDATE() 
						WHERE 
						cat_id = @cat_id;
END

EXEC [dbo].[UPDATE_CATEGORY]
@cat_id = 2,
@cat_name = 'INDIAN',
@cat_img = 'C:\Users\merit\Desktop\Preethi\Task 2\Images\indian.jpg',
@IsActive = 0

------------------DELETE------------------------

CREATE PROCEDURE DELETE_CATEGORY
@cat_id INT
AS
BEGIN
DELETE FROM tbl_CATEGORY WHERE cat_id = @cat_id
END

EXEC [dbo].[DELETE_CATEGORY]
@cat_id = 2


--------------- --OUTLET------------------------

CREATE TABLE tbl_OUTLET (id INT PRIMARY KEY, 
						 o_name NVARCHAR(50) NOT NULL, 
						 img IMAGE NOT NULL,
						 IsActive BIT NOT NULL,
						 created_date DATETIME,
						 modified_time DATETIME
						 )

-----------------SEQUENCE--------------------------

CREATE SEQUENCE seq_OUTLET_ID
AS INT 
START WITH 1 INCREMENT BY 1

----------------SELECT ALL-------------------------

CREATE PROCEDURE SELECT_OUTLET
AS 
BEGIN
SELECT * FROM tbl_OUTLET
END

EXEC SELECT_OUTLET

-----------------SELECT-----------------------------

CREATE PROCEDURE SELECT_PART_OUTLET
@o_name NVARCHAR(50)
AS 
BEGIN
SELECT * FROM tbl_OUTLET WHERE o_name = @o_name
END
 
EXEC [dbo].[SELECT_PART_OUTLET]
@o_name = 'ANNA NAGAR'

-----------------INSERT-----------------------------

CREATE PROCEDURE INSERT_OUTLET
@o_name NVARCHAR(50),
@img IMAGE,
@IsActive BIT
AS 
BEGIN
INSERT INTO tbl_OUTLET(id,o_name,img,IsActive,created_date,modified_time)
VALUES(NEXT VALUE FOR seq_CATEGORY_ID,@o_name, @img, @IsActive, GETDATE(),GETDATE())
END


EXEC [dbo].[INSERT_OUTLET]
@o_name = 'KATHIPARA',
@img = 'C:\Users\merit\Desktop\Preethi\Task 2\Images\Kathipara.jpeg',
@IsActive = 1;

-----------------UPDATE-------------------------

CREATE PROCEDURE UPDATE_OUTLET
@id INT,
@o_name NVARCHAR(50),
@img IMAGE,
@IsActive BIT
AS 
BEGIN
UPDATE tbl_OUTLET SET o_name = @o_name, 
						img = @img, 
						IsActive = @IsActive, 
						created_date = GETDATE(), 
						modified_time = GETDATE() 
						WHERE 
						id = @id;
END

EXEC [dbo].[UPDATE_OUTLET]
@id = 4,
@o_name = 'KATHIPARA',
@img = 'C:\Users\merit\Desktop\Preethi\Task 2\Images\Kathipara.jpeg',
@IsActive = 0;

----------------DELETE----------------------------

CREATE PROCEDURE DELETE_OUTLET
@id INT
AS
BEGIN
DELETE FROM tbl_OUTLET WHERE id = @id
END

EXEC [dbo].[DELETE_OUTLET]
@id = 4

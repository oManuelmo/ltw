
/*******************************************************************************
   Chinook Database - Version 1.4
   Script: Chinook_Sqlite.sql
   Description: Creates and populates the Chinook database.
   DB Server: Sqlite
   Author: Luis Rocha
   License: http://www.codeplex.com/ChinookDatabase/license
********************************************************************************/

DROP TABLE IF EXISTS VideoGames;
DROP TABLE IF EXISTS Consoles;
DROP TABLE IF EXISTS Controllers;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Images;
DROP TABLE IF EXISTS ProductImage;

/*******************************************************************************
   Create Tables
********************************************************************************/

CREATE TABLE Products (
   ProductId INTEGER NOT NULL,
   Name NVARCHAR(160) NOT NULL,
   Company NVARCHAR(120),
   LaunchYear INTEGER NOT NULL,
   CONSTRAINT PK_Products PRIMARY KEY (ProductId)
);

CREATE TABLE VideoGames (
   ProductId INTEGER PRIMARY KEY,
   UnitPrice NUMERIC(10,2) NOT NULL,
   FOREIGN KEY (ProductId) REFERENCES Products (ProductId)
);

CREATE TABLE Consoles (
   ProductId INTEGER PRIMARY KEY,
   FOREIGN KEY (ProductId) REFERENCES Products (ProductId)
);

CREATE TABLE Controllers (
   ProductId INTEGER PRIMARY KEY,
   ConsoleId INTEGER,
   FOREIGN KEY (ProductId) REFERENCES Products (ProductId),
   FOREIGN KEY (ConsoleId) REFERENCES Consoles (ProductId) -- Assuming ConsoleId in Consoles table
);

CREATE TABLE Users (
   UserId INTEGER  NOT NULL,
   FirstName NVARCHAR(40)  NOT NULL,
   LastName NVARCHAR(20)  NOT NULL,
   Address NVARCHAR(70),
   City NVARCHAR(40),
   State NVARCHAR(40),
   Country NVARCHAR(40),
   PostalCode NVARCHAR(10),
   Phone NVARCHAR(24),
   Email NVARCHAR(60) NOT NULL,
   Password NVARCHAR(40) NOT NULL,
   CONSTRAINT PK_Users PRIMARY KEY (UserId)
);

CREATE TABLE Images (
   ImageId INTEGER PRIMARY KEY,
   ImageURL NVARCHAR(255) NOT NULL, -- URL to access the image
   UploadDate DATE NOT NULL -- Date when the image was uploaded
);

CREATE TABLE ProductImage (
   ProductId INTEGER,
   UserId INTEGER,
   ImageId INTEGER,
   PRIMARY KEY (ProductId, UserId),
   FOREIGN KEY (ProductId) REFERENCES Products (ProductId),
   FOREIGN KEY (UserId) REFERENCES Users (UserId),
   FOREIGN KEY (ImageId) REFERENCES Images (ImageId)
);


/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
CREATE INDEX IFK_VideoGameConsoleId ON VideoGames (ConsoleId);

CREATE INDEX IFK_ControllerConsoleId ON Controllers (ConsoleId);

/*******************************************************************************
   Populate Tables
********************************************************************************/

-- Insert more data into Products table
INSERT INTO Products (ProductId, Name, Company, LaunchYear) VALUES
(5, 'Super Mario Odyssey', 'Nintendo', 2017),
(6, 'The Last of Us Part II', 'Sony', 2020),
(7, 'Nintendo Switch', 'Nintendo', 2017),
(8, 'Xbox One X', 'Microsoft', 2017),
(9, 'PlayStation 4 Pro', 'Sony', 2016),
(10, 'Nintendo Switch Pro Controller', 'Nintendo', 2017);

-- Insert more data into VideoGames table
INSERT INTO VideoGames (ProductId, UnitPrice) VALUES
(5, 49.99),
(6, 59.99);

-- Insert more data into Consoles table
INSERT INTO Consoles (ProductId) VALUES
(7),
(8),
(9);

-- Insert more data into Controllers table
INSERT INTO Controllers (ProductId, ConsoleId) VALUES
(10, 7);  -- Assuming product 10 (Controller) is for console 7 (Nintendo Switch)

-- Insert more data into Users table
INSERT INTO Users (UserId, FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Email, Password) VALUES
(2, 'Jane', 'Smith', '5678 Avenue', 'Los Angeles', 'CA', 'USA', '90001', '987-654-3210', 'jane.smith@email.com', 'password456');

-- Insert more data into Images table
INSERT INTO Images (ImageId, ImageURL, UploadDate) VALUES
(2, 'http://example.com/images/mario.jpg', '2024-04-18'),
(3, 'http://example.com/images/lastofus2.jpg', '2024-04-18');

-- Insert more data into ProductImage table
INSERT INTO ProductImage (ProductId, UserId, ImageId) VALUES
(5, 1, 2),  -- Linking the image of Super Mario Odyssey to user 1 and product 5
(6, 1, 3);  -- Linking the image of The Last of Us Part II to user 1 and product 6

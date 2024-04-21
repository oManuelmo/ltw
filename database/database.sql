
/*******************************************************************************
   Chinook Database - Version 1.4
   Script: Chinook_Sqlite.sql
   Description: Creates and populates the Chinook database.
   DB Server: Sqlite
   Author: Luis Rocha
   License: http://www.codeplex.com/ChinookDatabase/license
********************************************************************************/
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS VideoGames;
DROP TABLE IF EXISTS Consoles;
DROP TABLE IF EXISTS Controllers;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Images;
DROP TABLE IF EXISTS ProductImage;
DROP TABLE IF EXISTS UserProduct;
DROP TABLE IF EXISTS UserProductImage;

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
   Country NVARCHAR(40),
   PostalCode NVARCHAR(10),
   Phone NVARCHAR(24),
   Email NVARCHAR(60) NOT NULL,
   Password NVARCHAR(40) NOT NULL,
   CONSTRAINT PK_Users PRIMARY KEY (UserId)
);

CREATE TABLE Images (
   ImageId INTEGER PRIMARY KEY,
   ImageURL NVARCHAR(255) NOT NULL
);


CREATE TABLE UserProduct (
   ProductId INTEGER NOT NULL,
   UserId INTEGER NOT NULL,
   UnitPrice NUMERIC(10,2),
   DESCRIPTION NVARCHAR(1000),
   PRIMARY KEY (ProductId, UserId),
   FOREIGN KEY (ProductId) REFERENCES Products (ProductId),
   FOREIGN KEY (UserId) REFERENCES Users (UserId)
);


CREATE TABLE UserProductImage (
   ProductId INTEGER NOT NULL,
   UserId INTEGER NOT NULL,
   ImageId INTEGER NOT NULL,
   PRIMARY KEY (ProductId, UserId),
   FOREIGN KEY (ProductId) REFERENCES Products (ProductId),
   FOREIGN KEY (UserId) REFERENCES Users (UserId),
   FOREIGN KEY (ImageId) REFERENCES Images (ImageId)
);


/*******************************************************************************
   Create Foreign Keys
********************************************************************************/


/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO Users (FirstName, LastName, Address, City, Country, PostalCode, Phone, Email, Password)
VALUES
('John', 'Doe', '123 Main St', 'Anytown', 'USA', '12345', '123-456-7890', 'john@example.com', 'password123'),
('Jane', 'Smith', '456 Elm St', 'Otherville', 'Canada', '67890', '987-654-3210', 'jane@example.com', 'securepass'),
('Alice', 'Johnson', '789 Oak St', 'Sometown', 'UK', '54321', '555-123-4567', 'alice@example.com', 'p@ssw0rd'),
('Bob', 'Brown', '321 Maple St', 'Anothercity', 'Australia', '13579', '111-222-3333', 'bob@example.com', 'letmein');



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
   UnitPrice INTEGER NOT NULL,
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
   ProductId INTEGER,
   ImageURL NVARCHAR(255) NOT NULL, -- URL to access the image
   FOREIGN KEY (ProductId) REFERENCES Products (ProductId)
);




/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
CREATE INDEX IFK_VideoGameConsoleId ON VideoGames (ConsoleId);

CREATE INDEX IFK_ControllerConsoleId ON Controllers (ConsoleId);

/*******************************************************************************
   Populate Tables
********************************************************************************/

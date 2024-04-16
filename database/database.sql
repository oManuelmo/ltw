
/*******************************************************************************
   Chinook Database - Version 1.4
   Script: Chinook_Sqlite.sql
   Description: Creates and populates the Chinook database.
   DB Server: Sqlite
   Author: Luis Rocha
   License: http://www.codeplex.com/ChinookDatabase/license
********************************************************************************/

DROP TABLE IF EXISTS VideoGame;
DROP TABLE IF EXISTS Console;
DROP TABLE IF EXISTS Controller;
DROP TABLE IF EXISTS Customer;

/*******************************************************************************
   Create Tables
********************************************************************************/

CREATE TABLE VideoGame
(
    GameId INTEGER  NOT NULL,
    Title NVARCHAR(160)  NOT NULL,
    LaunchYear INTEGER  NOT NULL,
    UnitPrice NUMERIC(10,2)  NOT NULL,
    CONSTRAINT PK_CONSOLE PRIMARY KEY (ConsoleId),
    FOREIGN KEY (ConsoleId) REFERENCES Console (ConsoleId)
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Console
(
    ConsoleId INTEGER  NOT NULL,
    Name NVARCHAR(120),
    Company NVARCHAR(120),
    LaunchYear INTEGER NOT NULL,
    UnitPrice NUMERIC(10,2)  NOT NULL,
    CONSTRAINT PK_Console PRIMARY KEY (ConsoleId)
);

CREATE TABLE Customer
(
    CustomerId INTEGER  NOT NULL,
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
    CONSTRAINT PK_Customer PRIMARY KEY  (CustomerId)
);

CREATE TABLE Controller
(
    ControllerId INTEGER  NOT NULL,
    AlbumId INTEGER,
    UnitPrice NUMERIC(10,2)  NOT NULL,
    CONSTRAINT PK_Controller PRIMARY KEY  (ControllerId),
    FOREIGN KEY (ConsoleId) REFERENCES  Console (ConsoleId) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);


/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
CREATE INDEX IFK_VideoGameConsoleId ON VideoGame (ConsoleId);

CREATE INDEX IFK_ControllerConsoleId ON Controller (ConsoleId);

/*******************************************************************************
   Populate Tables
********************************************************************************/

INSERT INTO Console (ConsoleId, Name, Company, LaunchYear, UnitPrice) 
VALUES 
(1, 'PlayStation 4', 'Sony', 2013, 299.99),
(2, 'Xbox One', 'Microsoft', 2013, 299.99),
(3, 'Nintendo Switch', 'Nintendo', 2017, 299.99),
(4, 'PlayStation 5', 'Sony', 2020, 499.99),
(5, 'Xbox Series X', 'Microsoft', 2020, 499.99),
(6, 'PlayStation 3', 'Sony', 2006, 299.99),
(7, 'Xbox 360', 'Microsoft', 2005, 299.99),
(8, 'Nintendo Wii', 'Nintendo', 2006, 249.99),
(9, 'PlayStation 2', 'Sony', 2000, 199.99),
(10, 'Nintendo GameCube', 'Nintendo', 2001, 199.99),
(11, 'Xbox', 'Microsoft', 2001, 199.99),
(12, 'PlayStation', 'Sony', 1994, 299.99),
(13, 'Sega Genesis', 'Sega', 1989, 199.99),
(14, 'Super Nintendo Entertainment System (SNES)', 'Nintendo', 1990, 199.99),
(15, 'Nintendo Entertainment System (NES)', 'Nintendo', 1985, 199.99),
(16, 'Atari 2600', 'Atari', 1977, 199.99),
(17, 'Intellivision', 'Mattel', 1979, 199.99),
(18, 'Game Boy', 'Nintendo', 1989, 89.99),
(19, 'Game Boy Color', 'Nintendo', 1998, 79.99),
(20, 'Game Boy Advance', 'Nintendo', 2001, 99.99),
(21, 'Nintendo DS', 'Nintendo', 2004, 149.99),
(22, 'PlayStation Portable (PSP)', 'Sony', 2004, 199.99),
(23, 'GameCube', 'Nintendo', 2001, 199.99),
(24, 'Nintendo 64', 'Nintendo', 1996, 199.99),
(25, 'Sega Saturn', 'Sega', 1994, 399.99),
(26, 'Dreamcast', 'Sega', 1999, 199.99);

-- Populate VideoGame table
INSERT INTO VideoGame (GameId, Title, LaunchYear, UnitPrice, ConsoleId) 
VALUES 
(1, 'The Last of Us Part II', 2020, 59.99, 1),
(2, 'Red Dead Redemption 2', 2018, 59.99, 1),
(3, 'God of War', 2018, 59.99, 1),
(4, 'Halo Infinite', 2021, 59.99, 2),
(5, 'The Legend of Zelda: Breath of the Wild', 2017, 59.99, 3),
(6, 'Super Mario Odyssey', 2017, 59.99, 3),
(7, 'Spider-Man: Miles Morales', 2020, 49.99, 1),
(8, 'Cyberpunk 2077', 2020, 59.99, 1),
(9, 'Assassin''s Creed Valhalla', 2020, 59.99, 1),
(10, 'Call of Duty: Black Ops Cold War', 2020, 59.99, 1),
(11, 'FIFA 21', 2020, 59.99, 1),
(12, 'NBA 2K21', 2020, 59.99, 1),
(13, 'Forza Horizon 4', 2018, 49.99, 2),
(14, 'Gears 5', 2019, 59.99, 2),
(15, 'Minecraft', 2014, 29.99, 2),
(16, 'Animal Crossing: New Horizons', 2020, 59.99, 3),
(17, 'Pokémon Sword and Shield', 2019, 59.99, 3),
(18, 'Super Smash Bros. Ultimate', 2018, 59.99, 3),
(19, 'Demon''s Souls', 2020, 69.99, 4),
(20, 'Marvel''s Spider-Man: Remastered', 2020, 69.99, 4),
(21, 'Astro''s Playroom', 2020, 0.00, 4),
(22, 'Demon''s Souls', 2020, 69.99, 5),
(23, 'Halo Infinite', 2021, 59.99, 5),
(24, 'Grand Theft Auto V', 2013, 59.99, 1),
(25, 'The Elder Scrolls V: Skyrim', 2011, 39.99, 1),
(26, 'Uncharted 4: A Thief''s End', 2016, 59.99, 1),
(27, 'The Witcher 3: Wild Hunt', 2015, 39.99, 1),
(28, 'Gears of War 3', 2011, 29.99, 2),
(29, 'Mass Effect 2', 2010, 19.99, 2),
(30, 'The Legend of Zelda: Twilight Princess', 2006, 49.99, 3),
(31, 'Super Smash Bros. Melee', 2001, 49.99, 3),
(32, 'Final Fantasy X', 2001, 49.99, 6),
(33, 'Halo 3', 2007, 29.99, 7),
(34, 'Super Mario Galaxy', 2007, 49.99, 8),
(35, 'Metal Gear Solid 3: Snake Eater', 2004, 29.99, 9),
(36, 'Halo 2', 2004, 29.99, 7),
(37, 'The Legend of Zelda: The Wind Waker', 2002, 49.99, 10),
(38, 'Fable', 2004, 19.99, 7),
(39, 'Super Mario Sunshine', 2002, 49.99, 10),
(40, 'Star Wars: Knights of the Old Republic', 2003, 19.99, 7),
(41, 'Shadow of the Colossus', 2005, 29.99, 9),
(42, 'Red Dead Redemption', 2010, 29.99, 2),
(43, 'Portal 2', 2011, 19.99, 2),
(44, 'Batman: Arkham City', 2011, 19.99, 1),
(45, 'BioShock', 2007, 19.99, 7),
(46, 'Super Mario Bros.', 1985, 29.99, 15),
(47, 'The Legend of Zelda', 1986, 39.99, 15),
(48, 'Sonic the Hedgehog', 1991, 19.99, 13),
(49, 'Street Fighter II', 1991, 29.99, 14),
(50, 'Mortal Kombat', 1992, 29.99, 12),
(51, 'Pac-Man', 1980, 19.99, 16),
(52, 'Space Invaders', 1978, 19.99, 16),
(53, 'Tetris', 1984, 19.99, 17),
(54, 'Donkey Kong', 1981, 19.99, 15),
(55, 'Final Fantasy VII', 1997, 49.99, 12),
(56, 'Metal Gear Solid', 1998, 49.99, 12),
(57, 'Gran Turismo', 1997, 39.99, 12),
(58, 'Resident Evil', 1996, 29.99, 12),
(59, 'GoldenEye 007', 1997, 39.99, 13),
(60, 'Pokémon Red and Blue', 1996, 29.99, 14),
(61, 'Diablo II', 2000, 39.99, 12),
(62, 'Half-Life', 1998, 29.99, 12),
(63, 'Age of Empires II', 1999, 29.99, 12),
(64, 'SimCity', 1989, 19.99, 13),
(65, 'Castlevania', 1986, 19.99, 15),
(66, 'Metroid', 1986, 19.99, 14),
(67, 'Prince of Persia', 1989, 19.99, 12),
(68, 'The Sims', 2000, 39.99, 12),
(69, 'Doom', 1993, 19.99, 12),
(70, 'Command & Conquer', 1995, 29.99, 12),
(71, 'Super Mario Land', 1989, 19.99, 18),
(72, 'Pokémon Gold and Silver', 1999, 29.99, 19),
(73, 'The Legend of Zelda: Oracle of Ages/Seasons', 2001, 39.99, 20),
(74, 'New Super Mario Bros.', 2006, 39.99, 21),
(75, 'Grand Theft Auto: Liberty City Stories', 2005, 29.99, 22),
(76, 'The Legend of Zelda: Four Swords Adventures', 2004, 49.99, 23),
(77, 'Fire Emblem: Awakening', 2012, 39.99, 21),
(78, 'Mario Kart: Super Circuit', 2001, 29.99, 19),
(79, 'Final Fantasy Tactics Advance', 2003, 39.99, 20),
(80, 'Kingdom Hearts: Chain of Memories', 2004, 29.99, 21),
(81, 'WarioWare, Inc.: Mega Microgames!', 2003, 19.99, 20),
(82, 'Tetris DS', 2006, 29.99, 21),
(83, 'Metal Gear Solid: Portable Ops', 2006, 29.99, 22),
(84, 'Animal Crossing: Wild World', 2005, 29.99, 21),
(85, 'Mario & Luigi: Superstar Saga', 2003, 29.99, 20),
(86, 'Advance Wars', 2001, 29.99, 20),
(87, 'Tony Hawk''s Pro Skater 2', 2000, 19.99, 23),
(88, 'Lumines', 2004, 19.99, 22),
(89, 'Castlevania: Aria of Sorrow', 2003, 29.99, 20),
(90, 'Pokémon Ruby and Sapphire', 2002, 29.99, 19),
(91, 'Metroid Fusion', 2002, 29.99, 21),
(92, 'Final Fantasy IV Advance', 2005, 29.99, 20),
(93, 'Golden Sun', 2001, 29.99, 20),
(94, 'Super Mario 64', 1996, 49.99, 24),
(95, 'GoldenEye 007', 1997, 39.99, 24),
(96, 'Mario Kart 64', 1996, 49.99, 24),
(97, 'The Legend of Zelda: Ocarina of Time', 1998, 49.99, 24),
(98, 'Resident Evil 2', 1998, 29.99, 24),
(99, 'Final Fantasy VII', 1997, 49.99, 24),
(100, 'Gran Turismo', 1997, 39.99, 9),
(101, 'Metal Gear Solid 2: Sons of Liberty', 2001, 49.99, 9),
(102, 'Grand Theft Auto: San Andreas', 2004, 49.99, 9),
(103, 'Final Fantasy X', 2001, 49.99, 9),
(104, 'Halo: Combat Evolved', 2001, 29.99, 7),
(105, 'Gears of War', 2006, 39.99, 7),
(106, 'The Elder Scrolls IV: Oblivion', 2006, 39.99, 7),
(107, 'Uncharted: Drake''s Fortune', 2007, 49.99, 6),
(108, 'God of War II', 2007, 49.99, 6),
(109, 'Call of Duty 4: Modern Warfare', 2007, 39.99, 7),
(110, 'Assassin''s Creed', 2007, 39.99, 7),
(111, 'The Legend of Zelda: Twilight Princess', 2006, 49.99, 6),
(112, 'Super Smash Bros. Melee', 2001, 49.99, 24),
(113, 'Tony Hawk''s Pro Skater', 1999, 29.99, 24),
(114, 'Sonic Adventure', 1998, 29.99, 26),
(115, 'Dead or Alive 2', 1999, 29.99, 25),
(116, 'Street Fighter Alpha 3', 1998, 29.99, 25),
(117, 'Shenmue', 1999, 49.99, 26);

INSERT INTO Customer (CustomerId, FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Email, Password) 
VALUES 
(1, 'John', 'Doe', '123 Main St', 'Anytown', 'CA', 'USA', '12345', '123-456-7890', 'john.doe@example.com', 'password123'),
(2, 'Jane', 'Smith', '456 Elm St', 'Othertown', 'NY', 'USA', '67890', '987-654-3210', 'jane.smith@example.com', 'password456'),
(3, 'Alice', 'Johnson', '789 Oak St', 'Smalltown', 'TX', 'USA', '54321', '555-555-5555', 'alice.johnson@example.com', 'password789'),
(4, 'Bob', 'Williams', '101 Pine St', 'Cityville', 'IL', 'USA', '98765', '111-222-3333', 'bob.williams@example.com', 'passwordabc');
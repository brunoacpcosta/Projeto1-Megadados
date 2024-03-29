DROP DATABASE IF EXISTS socialNetwork;
CREATE DATABASE socialNetwork;
USE socialNetwork;


CREATE TABLE Users (
	idUser INT NOT NULL AUTO_INCREMENT,
	fullName VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	city VARCHAR(30) NOT NULL,
	activeUser TINYINT(1) NOT NULL DEFAULT 1,
	PRIMARY KEY (idUser)
);

CREATE TABLE Posts (
	idPost INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL UNIQUE,
	postText VARCHAR(100),
	urlPhoto VARCHAR(100),
	idUser INT NOT NULL,
	activePost TINYINT(1) NOT NULL DEFAULT 1,
	PRIMARY KEY (idPost),
	FOREIGN KEY (idUser)
	REFERENCES Users (idUser) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Birds (
	idBird INT NOT NULL AUTO_INCREMENT,
	birdType VARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY (idBird)
);

CREATE TABLE Preferences (
	idUser INT NOT NULL,
	idBird INT NOT NULL,
	activePreference TINYINT(1) NOT NULL DEFAULT 1,
	PRIMARY KEY (idUser, idBird),
	FOREIGN KEY (idUser)
	REFERENCES Users (idUser) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idBird)
	REFERENCES Birds (idBird) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Mentions (
	idPost INT NOT NULL,
	idUser INT NOT NULL,
	activeMention TINYINT(1) NOT NULL DEFAULT 1,
	PRIMARY KEY (idPost, idUser),
	FOREIGN KEY (idPost)
	REFERENCES Posts (idPost) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idUser)
	REFERENCES Users (idUser) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Tags (
	idPost INT NOT NULL,
	idBird INT NOT NULL,
	activeTag TINYINT(1) NOT NULL DEFAULT 1,
	PRIMARY KEY (idPost, idBird),
	FOREIGN KEY (idPost)
	REFERENCES Posts (idPost) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idBird)
	REFERENCES Birds (idBird) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Views (
	device VARCHAR(50) NOT NULL,
	viewDate DATETIME NOT NULL,
	browser VARCHAR(50) NOT NULL,
    IP VARCHAR(100) NOT NULL,
	idUser INT NOT NULL,
	idPost INT NOT NULL,
	PRIMARY KEY (idUser, idPost),
	FOREIGN KEY (idUser)
	REFERENCES Users (idUser) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idPost)
	REFERENCES Posts (idPost) ON DELETE CASCADE ON UPDATE CASCADE
);
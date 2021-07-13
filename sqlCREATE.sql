CREATE TABLE if not exists Performers (
	Id SERIAL PRIMARY KEY, 
	Performer VARCHAR(40) UNIQUE
);

CREATE TABLE IF NOT EXISTS Names_of_performers (
	Id SERIAL PRIMARY KEY,
	Artist_name VARCHAR(60) NOT NULL,
	CategoryId INTEGER REFERENCES Performers(Id) NOT NULL
);


CREATE TABLE IF NOT EXISTS Albums (
	Id SERIAL PRIMARY KEY,
	Album_title VARCHAR(60) NOT NULL,
	Year_of_issue INTEGER NOT NULL CHECK(Year_of_issue > 0)
);

CREATE TABLE IF NOT EXISTS List_of_songs (
	Id SERIAL PRIMARY KEY,
	Song_title VARCHAR(60) NOT NULL,
	Album_id  INTEGER REFERENCES Albums (Id) NOT NULL,
	Duration INTEGER NOT NULL CHECK(Duration > 0)
);

CREATE TABLE if not exists Genres (
	Id SERIAL PRIMARY KEY, 
	Genre VARCHAR(40) UNIQUE
);

CREATE TABLE if not exists Performers_and_Genre_ID (
	Id SERIAL PRIMARY KEY,
	Performers_id INTEGER REFERENCES Performers (Id) NOT NULL,
	Genre_id INTEGER REFERENCES Genres (Id) NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection (
	Id SERIAL PRIMARY KEY,
	Collection_title VARCHAR(60) NOT NULL,
	Year_of_issue INTEGER NOT NULL CHECK(Year_of_issue > 0)
);

CREATE TABLE if not exists Collection_and_song_ID (
	Id SERIAL PRIMARY KEY,
	Collection_ID INTEGER REFERENCES Collection (Id) NOT NULL,
	Song_ID INTEGER REFERENCES List_of_songs (Id) NOT NULL
);

CREATE TABLE if not exists Artist_and_Album_ID (
	Id SERIAL PRIMARY KEY,
	Id_Artist INTEGER REFERENCES Performers (Id) NOT NULL,
	Album_id INTEGER REFERENCES Albums (Id) NOT NULL
);






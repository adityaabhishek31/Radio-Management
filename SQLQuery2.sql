CREATE DATABASE Radio

CREATE TABLE States(
    state_name varchar(100) PRIMARY KEY
    );

CREATE TABLE Places(
    city_name  varchar(100) PRIMARY KEY,
    state_name varchar(100) NOT NULL,
    FOREIGN KEY(state_name) REFERENCES States(state_name) 
	ON DELETE CASCADE  ON UPDATE CASCADE
    );
    
CREATE TABLE UserProfile(
    user_id int PRIMARY KEY,
    username varchar(100) NOT NULL UNIQUE,
    first_name varchar(100) NOT NULL,
    last_name varchar(100),
    date_of_birth date NOT NULL,
    city varchar(100),
    state varchar(100),
    last_logged_in date,
    FOREIGN KEY(city) REFERENCES Places(city_name)
	ON DELETE CASCADE  ON UPDATE CASCADE,
    FOREIGN KEY(state) REFERENCES States(state_name)
    );
    
CREATE TABLE Credentials(
    user_id int,
    username varchar(100),
    md5_passwd varchar(100) NOT NULL,
    FOREIGN KEY(username) REFERENCES UserProfile(username)
	ON DELETE CASCADE  ON UPDATE CASCADE,
    FOREIGN KEY(user_id) REFERENCES UserProfile(user_id)
    );

CREATE TABLE Songs(
    song_id int PRIMARY KEY,
    name varchar(100) NOT NULL,
    singer varchar(100),
    film varchar(100),
    genre varchar(100),            
    rating int,
    url varchar(100) NOT NULL UNIQUE,    
    img_url varchar(100) default '/images/defaultsong.jpg'
    );
    
CREATE TABLE FavouriteGenres(
    user_id int,
    genre varchar(100) NOT NULL,
    FOREIGN KEY(user_id) REFERENCES UserProfile(user_id),
    PRIMARY KEY(user_id,genre)
);

CREATE TABLE Quotes(
    quote_url varchar(100) PRIMARY KEY,
    personality varchar(100),
    count int
);
    
CREATE TABLE SongTags(
    song_id int,
    tag varchar(100),
    foreign key(song_id) REFERENCES Songs(song_id)
	ON DELETE CASCADE  ON UPDATE CASCADE
    );
 
CREATE TABLE LoggedInUsers(
    user_id int PRIMARY KEY,
    token varchar(100) NOT NULL UNIQUE,
    FOREIGN KEY(user_id) REFERENCES UserProfile(user_id)
    );

	select* from Quotes;
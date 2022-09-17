SELECT u.user_id, u.username, u.first_name, u.last_name
FROM UserProfile AS u, FavouriteGenres AS f
WHERE f.genre='pop' AND u.user_id=f.user_id;


--List all the songs which belong to the favourite genre of  first name “aditya” .

SELECT name 
FROM Songs
WHERE genre IN (SELECT f.genre 
FROM FavouriteGenres AS f, UserProfile AS u
WHERE u.first_name='aditya' AND u.user_id=f.user_id);



--List the personality whose quotes are the most liked.

SELECT personality
FROM Quotes
WHERE count=(SELECT MAX(count)
				FROM Quotes);



--List all the genres along with the number of users who like them.

SELECT genre, count(*)
FROM FavouriteGenres 
GROUP BY genre ;



--List out the songs with their name, id,  genre, rating, url, img_url,tag whose tag is present and the song_id is between 1-100.


SELECT t.song_id, name, genre, rating, url, img_url,tag 
FROM Songs AS s JOIN SongTags AS t ON s.song_id=t.song_id
WHERE t.song_id BETWEEN 1 AND 100;



--Find all the inactive users and print when they were last logged in

SELECT last_logged_in, username 
FROM UserProfile
WHERE user_id IN ( (SELECT user_id 
					FROM UserProfile)
					EXCEPT 
					(SELECT user_id 
						FROM LoggedInUsers));


SELECT genre
FROM  Songs
Where name='Aye mere watan ke logo';
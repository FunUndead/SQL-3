SELECT Genre , COUNT(ge.id) FROM Genres ge
	LEFT JOIN performers_and_genre_id pe ON ge.id = pe.genre_id
	GROUP BY Genre;


SELECT Year_of_issue, COUNT(a.id) FROM Albums a    --Увеличил диапазон поиска по году
	LEFT JOIN List_of_songs s ON a.Id = s.Album_id
	WHERE Year_of_issue BETWEEN 2019 AND 2021
	GROUP BY Year_of_issue ;

SELECT a.Album_title, ROUND (AVG(Duration),2) FROM List_of_songs l
	LEFT JOIN Albums a ON a.id = l.Album_id
	GROUP BY a.Album_title;

SELECT distinct pe.Performer FROM Performers pe
	WHERE pe.Performer NOT IN (
	SELECT distinct pe.Performer	FROM Performers pe          -- Поменял год на 2004
	LEFT JOIN Artist_and_Album_ID a ON a.Id_Artist = pe.id
	LEFT JOIN Albums al ON al.id = a.Album_id
	WHERE al.Year_of_issue  = 2004
	)
	ORDER BY pe.Performer;


SELECT DISTINCT Collection_title FROM Collection cn
	LEFT JOIN Collection_and_song_ID cd ON cd.Collection_ID = cn.id 
	LEFT JOIN List_of_songs ls ON ls.id = cd.Song_ID
	LEFT JOIN Albums al ON al.id = ls.Album_id 
	LEFT JOIN Artist_and_Album_ID ad ON ad.Album_id = al.id 
	LEFT JOIN Performers ps ON ps.id = ad.Id_Artist
	WHERE ps.Performer LIKE'%Машина времени%'
	order by Collection_title;


SELECT Album_title FROM Albums als
	LEFT JOIN Artist_and_Album_ID ad ON ad.Album_id = als.id 
	LEFT JOIN Performers ps ON ps.id = ad.Id_Artist
	LEFT JOIN Performers_and_Genre_ID pd ON pd.Performers_id = ps.id
	LEFT JOIN Genres gs ON gs.id = pd.Genre_id
	GROUP BY Album_title
	HAVING COUNT(DISTINCT gs.Genre) > 1;

SELECT DISTINCT Song_title FROM List_of_songs ls
	LEFT JOIN Collection_and_song_ID cd ON cd.Collection_ID = ls.id 
	LEFT JOIN Collection cn ON cn.id = cd.Collection_ID
	WHERE Collection_title is NULL

SELECT ps.Performer, ls.Duration FROM List_of_songs ls 
	LEFT JOIN Albums als ON als.id = ls.Album_id
	LEFT JOIN Artist_and_Album_ID ad ON ad.Album_id = als.id
	LEFT JOIN Performers ps ON ps.id = ad.Id_Artist
	WHERE Duration = (SELECT MIN(Duration) FROM List_of_songs);

SELECT al.Album_title, COUNT(ls.Song_title) FROM Albums al
	LEFT JOIN List_of_songs ls ON ls.Album_id = al.id
	GROUP BY  al.Album_title
	HAVING COUNT (ls.Song_title) = ( 
		SELECT COUNT(id) FROM List_of_songs
		GROUP BY Album_id
		ORDER BY COUNT
		LIMIT 1
		)
	Order by al.Album_title;
	
	
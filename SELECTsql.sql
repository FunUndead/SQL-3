SELECT Album_title, Year_of_issue FROM Albums
	WHERE Year_of_issue = 2018;

SELECT Song_title,Duration FROM List_of_songs
	ORDER BY Duration DESC
	LIMIT 1;

SELECT Song_title FROM List_of_songs
	WHERE Duration >= 230 ;

SELECT Collection_title FROM Collection
	WHERE Year_of_issue BETWEEN  2018 AND 2020 ;

SELECT Performer FROM Performers
	WHERE Performer NOT LIKE '% %';

SELECT Song_title FROM List_of_songs
	WHERE Song_title LIKE '%Мой%'; 
-- 10 самых востребованных актрис

SELECT 
	persons_bio.gender,
	CONCAT_WS(" ", persons.first_name, persons.last_name) AS actreses,
	COUNT(persons.id) AS number_of_roles
FROM roles
	JOIN persons_bio 
	ON roles.person_id = persons_bio.person_id
		AND persons_bio.gender = 'f'
	JOIN persons
		ON persons_bio.person_id = persons.id
	RIGHT JOIN roles_type 
		ON roles.role_type_id = roles_type.id
		AND roles_type.name = 'actor'
	GROUP BY persons_bio.person_id
	ORDER BY number_of_roles DESC limit 10;


-- Видео по типам и времени производства (самое новое, самое старое)   

SELECT DISTINCT 
	video_type.name AS video_type,
	-- video.title,
 	FIRST_VALUE(video.title) 
		OVER (w ORDER BY video.date_release DESC) AS newest,
 	FIRST_VALUE(video.title) 
 		OVER (w ORDER BY video.date_release ASC) AS oldest,
 	COUNT(video_info.video_type_id) OVER (PARTITION BY video_info.video_type_id) AS video_of_a_type
	FROM video_type
	LEFT JOIN video_info
		ON video_type.id = video_info.video_type_id
	LEFT JOIN video
		ON video.id = video_info.video_id
		LEFT JOIN genres 
		ON genres.id = video_info.genre_id
	WINDOW w AS (PARTITION BY video_type.id);  

     
-- Вывести всех режисёров снимавших комедии     

SELECT DISTINCT 
 	roles_type.name AS 'role',
 	-- COUNT(roles.person_id) OVER (PARTITION BY roles.role_type_id) AS number_of_directors,
 	genres.name AS gener,
 	CONCAT_WS(" ", persons.first_name, persons.last_name) AS directors
	FROM roles
	JOIN roles_type
		ON roles_type.id = roles.role_type_id
	JOIN persons
		ON persons.id = roles.person_id
	JOIN persons_bio
		ON persons_bio.person_id = persons.id 
	JOIN video
		ON video.id = roles.video_id AND role_type_id = 1
	JOIN video_info
		ON video.id = video_info.video_id
	JOIN genres
		ON genres.id = video_info.genre_id AND genres.id = 2;

-- Имена и дни рождения операторов с указанием фильма
SELECT 
	(SELECT title FROM video WHERE roles.video_id = video.id) AS video,
	(SELECT first_name FROM persons WHERE roles.person_id = persons.id) AS name,
	(SELECT birthday FROM persons_bio WHERE roles.person_id = persons_bio.person_id) AS bday
FROM roles WHERE role_type_id = 4;
	

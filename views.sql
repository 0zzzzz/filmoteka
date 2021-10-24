-- 10 видео с самым высоким рейтингом
CREATE OR REPLACE VIEW best_score AS
SELECT 
	video.title,
	AVG(video_score.score) score
FROM video
LEFT JOIN video_score ON video.id = video_score.video_id
GROUP BY video.title
ORDER BY score DESC LIMIT 10;

SELECT * FROM best_score;

-- Вывести всех сценаристов
CREATE OR REPLACE VIEW all_screenwriters AS
SELECT DISTINCT 
	CONCAT_WS (" ", persons.first_name, persons.last_name) AS screenwriter
FROM persons
	JOIN persons_bio
		ON persons_bio.person_id = persons.id
	JOIN roles
		ON roles.person_id = persons.id AND roles.role_type_id = 3;
	
SELECT * FROM all_screenwriters;

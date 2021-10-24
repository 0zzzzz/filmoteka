-- Таблица видео
DROP TABLE IF EXISTS video;
CREATE TABLE video (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	alt_title VARCHAR(100) NULL,
	date_release DATE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);  

-- Таблица дополнительной информации о видео
DROP TABLE IF EXISTS video_info;
CREATE TABLE video_info (
	video_id INT UNSIGNED NOT NULL PRIMARY KEY,
	video_type_id INT UNSIGNED NULL,
	genre_id INT UNSIGNED NULL,
	description TEXT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);  

-- Тип видео
DROP TABLE IF EXISTS video_type;
CREATE TABLE video_type (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name  VARCHAR(255) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Заполнение таблицы видео 
INSERT INTO video_type (name) VALUES
	('movie'),
	('series'),
	('animated series'),
	('cartoon'),
	('clip'),
	('short film');

-- Таблица жанров
DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name  VARCHAR(255) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Заполняем таблицу жанров
INSERT INTO genres (name) VALUES
	('Drama'),
	('Comedy'),
	('Musical'),
	('Detective'),
	('Action'),
	('Thriller'),
	('Horror');

-- Таблица людей в кинобизнесе
DROP TABLE IF EXISTS persons;
CREATE TABLE persons (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Таблица с дополнительной информацией о человеке в кинобизнесе
DROP TABLE IF EXISTS persons_bio;
CREATE TABLE persons_bio (
	person_id INT UNSIGNED NOT NULL PRIMARY KEY, 
	gender ENUM("m","f") COMMENT "Пол",
	birthday DATE COMMENT "Дата рождения", 
	death_day DATE NULL COMMENT "Дата смерти", 
	bio TEXT NOT NULL COMMENT "Информация о человеке",
	country VARCHAR(130) COMMENT "Страна проживания",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);	

-- Таблица принадлежности к съёмочной группе (collectivus_role)
DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
	video_id INT UNSIGNED NOT NULL,
	person_id INT UNSIGNED NOT NULL,
	role_type_id INT UNSIGNED NOT NULL COMMENT "Кем является по отношению к видео", 
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY (video_id, person_id, role_type_id)
);

-- Таблица съёмочной группы (collectivus_role_type)
DROP TABLE IF EXISTS roles_type;
CREATE TABLE roles_type (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Заполняем роль в съёмочной группы
INSERT INTO roles_type (name) VALUES
	('director'),
	('actor'),
	('screenwriter'),
	('operator');


-- Таблица пользователей ресурса
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	nickname VARCHAR(100) NOT NULL UNIQUE,
	email VARCHAR(100) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);  


-- Таблица пользовательских рецензий
DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
	user_id INT UNSIGNED NOT NULL COMMENT "Пользователь написавший рецензию",
	video_id INT UNSIGNED NOT NULL,
	body TEXT NOT NULL COMMENT "Текст рецензии",
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (user_id, video_id)
);


-- Таблица пользовательских оценок
DROP TABLE IF EXISTS video_score;
CREATE TABLE video_score (
	score TINYINT(10) UNSIGNED NOT NULL,
	video_id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id, video_id) 
);

-- 


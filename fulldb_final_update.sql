UPDATE persons SET updated_at = NOW() WHERE updated_at < created_at; 

UPDATE persons_bio SET updated_at = NOW() WHERE updated_at < created_at; 

UPDATE users SET updated_at = NOW() WHERE updated_at < created_at; 

UPDATE video SET updated_at = NOW() WHERE updated_at < created_at; 

UPDATE persons_bio SET death_day = NULL WHERE death_day < birthday;  

UPDATE video
SET title = REPLACE(title, '.', '');

UPDATE video
SET alt_title = REPLACE(alt_title, '.', '');

UPDATE users 
SET nickname = REPLACE(nickname, '.', '');



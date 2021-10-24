-- Тригер требующий ввести так же дату видео, чтобы избежать путаницу с одинаковыми названиями
DELIMITER //
CREATE TRIGGER validate_date_release_insert BEFORE INSERT ON video
	FOR EACH ROW BEGIN
		IF NEW.date_release IS NULL THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Enter the date to avoid confusion with the identical video titles';
		END IF;
	END//
DELIMITER ;

-- INSERT INTO video (title) VALUES ('terminator');
-- INSERT INTO video (title, date_release) VALUES ('terminator', NOW());

-- Процедура выводящая все рецензии пользователя по id
DROP PROCEDURE IF EXISTS GetAllUserReviews;
DELIMITER //
CREATE PROCEDURE GetAllUserReviews(IN var1 INT)
BEGIN
	SELECT
		users.nickname,
		reviews.body
	FROM users
	JOIN reviews
		ON users.id = reviews.user_id AND users.id = var1;
END //
DELIMITER ;

-- CALL GetAllUserReviews(1);

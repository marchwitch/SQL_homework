-- 1.	Создайте функцию, которая принимает количество секунд и форматирует их в количество дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'

DELIMITER $$
CREATE PROCEDURE format_sec (IN number_of_sec INT)
BEGIN
	DECLARE days INT DEFAULT 0;
	DECLARE hours INT DEFAULT 0;
	DECLARE minutes INT DEFAULT 0;
	DECLARE seconds INT DEFAULT 0;

	SET days = FLOOR(number_of_sec / (24 * 3600));
	SET hours = FLOOR(number_of_sec % (24 * 3600) / 3600);
	SET minutes = FLOOR(number_of_sec % 3600 / 60);
	SET seconds = number_of_sec - days * (24 * 3600) - hours * 3600 - minutes * 60;

	SELECT CONCAT_WS(" ", days, "days", hours, "hours", minutes, "minutes", seconds, "seconds");
END $$
DELIMITER ;

CALL format_sec(123456);
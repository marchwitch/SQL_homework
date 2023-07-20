-- 2. Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
-- Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

DROP FUNCTION IF EXISTS show_even_numbers;
DELIMITER $$
CREATE FUNCTION show_even_numbers(first_num INT, last_num INT)
RETURNS VARCHAR(50)
DETERMINISTIC 
BEGIN
    DECLARE result VARCHAR(50) DEFAULT "";
    DECLARE temp INT DEFAULT 0;
	SET temp = IF(first_num % 2 = 0, first_num, first_num + 1);
	IF temp <= last_num THEN 
		REPEAT
			IF LENGTH(result) > 0 THEN
				SET result = CONCAT(result, ",");
            END IF;
			SET result = CONCAT(result, temp);
			SET temp = temp + 2;
			UNTIL temp > last_num
		END REPEAT;
	END IF;
	RETURN result;
END $$

SELECT show_even_numbers(1, 10);
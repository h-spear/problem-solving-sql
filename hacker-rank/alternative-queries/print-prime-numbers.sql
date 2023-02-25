-- https://www.hackerrank.com/challenges/print-prime-numbers/problem
-- https://spiderwebcoding.tistory.com/7

DELIMITER $$
CREATE PROCEDURE PrintPrime(IN N INT)

BEGIN
    DECLARE I INTEGER DEFAULT 2;
    DECLARE J INTEGER;
    DECLARE IS_PRIME INTEGER;
    DECLARE RESULT VARCHAR(15000) DEFAULT '';
    
    WHILE I < N DO
        SET IS_PRIME = 1;
        SET J = 2;
        WHILE J < I DO
            IF I % J = 0 THEN
                SET IS_PRIME = 0;
            END IF;
            SET J = J + 1;
        END WHILE;
        
        IF IS_PRIME = 1 THEN
            SET RESULT = CONCAT(RESULT, I, '&');
        END IF;
        
        SET I = I + 1;
        
    END WHILE;
    SET RESULT = SUBSTR(RESULT, 1, LENGTH(RESULT) - 1);
    SELECT RESULT;
END $$
DELIMITER ;

CALL PrintPrime(1000);
        
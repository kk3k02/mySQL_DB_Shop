-- Wyświetlanie produktów wg ceny (od najniższej/najwyższej)
DELIMITER //
CREATE PROCEDURE DisplayProductsByPrice(IN sortOrder VARCHAR(10))
BEGIN
    IF sortOrder = 'asc' THEN
        -- Wyświetlanie produktów wg ceny od najniższej
        SELECT *
        FROM Clothes
        ORDER BY price ASC;
    ELSEIF sortOrder = 'desc' THEN
        -- Wyświetlanie produktów wg ceny od najwyższej
        SELECT *
        FROM Clothes
        ORDER BY price DESC;
    ELSE
        -- Obsługa błędu dla nieprawidłowego sortowania
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid sort order. Use "asc" or "desc".';
    END IF;
END;
//

DELIMITER ;

-- Wyświetlanie produktów wg kolekcji (od najnowszej/najstarzej)
DELIMITER //

CREATE PROCEDURE DisplayProductsByCollection(IN sortOrder VARCHAR(10))
BEGIN
    IF sortOrder = 'newest' THEN
        -- Wyświetlanie produktów wg kolekcji od najnowszej
        SELECT c.*
        FROM Clothes c
        JOIN Collections coll ON c.collection_id = coll.collection_id
        ORDER BY coll.start_date DESC;
    ELSEIF sortOrder = 'oldest' THEN
        -- Wyświetlanie produktów wg kolekcji od najstarszej
        SELECT c.*
        FROM Clothes c
        JOIN Collections coll ON c.collection_id = coll.collection_id
        ORDER BY coll.start_date ASC;
    ELSE
        -- Obsługa błędu dla nieprawidłowego sortowania
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid sort order. Use "newest" or "oldest".';
    END IF;
END;
//

DELIMITER ;

-- Przecena produktów
DELIMITER //

CREATE PROCEDURE DiscountProductsInCollection(IN collectionName VARCHAR(45), IN discountPercent DECIMAL(5,2))
BEGIN
    DECLARE collectionId INT;
    
    -- Pobierz identyfikator kolekcji na podstawie nazwy
    SELECT collection_id INTO collectionId
    FROM Collections
    WHERE name = collectionName;
    
    -- Aktualizuj cenę produktów w danej kolekcji
    UPDATE Clothes
    SET price = price * (1 - discountPercent / 100)
    WHERE collection_id = collectionId;
END;
//

DELIMITER ;

-- Składanie zamówienia

-- Wyszukiwanie produktów wg podanych kryteriów
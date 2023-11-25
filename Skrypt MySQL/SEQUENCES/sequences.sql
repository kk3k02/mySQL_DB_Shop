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


-- Wyszukiwanie produktów wg podanych kryteriów

DELIMITER //

CREATE PROCEDURE SearchProducts(
    IN material VARCHAR(25),
    IN size VARCHAR(10),
    IN minPrice DECIMAL(6,2),
    IN maxPrice DECIMAL(6,2),
    IN sex enum('male','female','unisex')
)
BEGIN
    SELECT *
    FROM Clothes
    WHERE (material = material OR material IS NULL)
      AND (size = size OR size IS NULL)
      AND (price >= minPrice OR minPrice IS NULL)
      AND (price <= maxPrice OR maxPrice IS NULL)
      AND (sex = sex OR sex IS NULL);
END;
//

DELIMITER ;

-- Zmiana danych osobowych

DELIMITER //

CREATE PROCEDURE UpdateUserDetails(
    IN userId INT,
    IN newEmail VARCHAR(255),
    IN newPhone VARCHAR(15),
    IN newName VARCHAR(45),
    IN newSurname VARCHAR(45)
)
BEGIN
    UPDATE Users
    SET email = newEmail, phone = newPhone, name = newName, surname = newSurname
    WHERE user_id = userId;
END;
//

DELIMITER ;

-- Dodanie produktu do zamówienia

DELIMITER //

CREATE PROCEDURE AddProductToOrder(
    IN orderId INT,
    IN productId INT
)
BEGIN
    INSERT INTO basket(order_id, clothes_id)
    VALUES (orderId, productId);
END;
//

DELIMITER ;

-- Anulowanie zamówienia

DELIMITER //

CREATE PROCEDURE CancelOrder(
    IN orderId INT
)
BEGIN
    DELETE FROM Orders
    WHERE order_id = orderId;
END;
//

DELIMITER ;

-- Usunięcie konta
DELIMITER //

CREATE PROCEDURE DeleteUserAccount(
    IN userId INT
)
BEGIN
    DELETE FROM Users
    WHERE user_id = userId;
END;
//

DELIMITER ;

-- Tworzenie nowego konta

DELIMITER //

CREATE PROCEDURE CreateUserAccount(
    IN userLogin VARCHAR(20),
    IN userPassword VARCHAR(20),
    IN userEmail VARCHAR(255),
    IN userPhone VARCHAR(15),
    IN userName VARCHAR(45),
    IN userSurname VARCHAR(45),
    IN userRole ENUM('admin', 'employee', 'customer')
)
BEGIN
    INSERT INTO Users(login, password, email, phone, name, surname, role)
    VALUES (userLogin, userPassword, userEmail, userPhone, userName, userSurname, userRole);
END;
//

DELIMITER ;

-- Dodaj produkt
DELIMITER //

CREATE PROCEDURE AddProduct(
	IN material varchar(25),
    IN size varchar(10),
    IN sex enum('male','female','unisex'),
    IN price decimal(6,2),
    IN collection_id int(10)
)
BEGIN
	
END;
//

DELIMITER ;

-- Edytuj produkt
DELIMITER //
CREATE PROCEDURE EditProduct(
    IN productId INT,
    IN newMaterial VARCHAR(25),
    IN newSize VARCHAR(10),
    IN newSex ENUM('male', 'female', 'unisex'),
    IN newPrice DECIMAL(6,2),
    IN newCollectionId INT
)
BEGIN
    -- Aktualizacja danych produktu
    UPDATE Clothes
    SET material = newMaterial, size = newSize, sex = newSex, 
        price = newPrice, collection_id = newCollectionId
    WHERE clothes_id = productId;
END;
//

DELIMITER ;

-- Usuń produkt
DELIMITER //

CREATE PROCEDURE DeleteProductById(
    IN id int(10)
)
BEGIN
	DELETE FROM Clothes
    Where clothes_id = id;
END;
//

DELIMITER ;
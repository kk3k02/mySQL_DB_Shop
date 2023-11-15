DELIMITER ;;
-- orders
CREATE TRIGGER create_order_date
BEFORE INSERT ON orders
FOR EACH ROW 
BEGIN
    SET NEW.date = NOW();
END;;

DELIMITER ;;
CREATE TRIGGER update_basket_amount
BEFORE INSERT ON basket
FOR EACH ROW
BEGIN
    DECLARE total_amount DECIMAL(10, 2);
    
    -- Obliczanie sumy kwoty koszyka
    SELECT SUM(price) INTO total_amount
    FROM clothes
    WHERE clothes_id IN (SELECT clothes_id FROM basket WHERE order_id = NEW.order_id);

    -- Aktualizacja kwoty w tabeli orders
    UPDATE orders
    SET amount = total_amount
    WHERE order_id = (SELECT order_id FROM basket WHERE order_id = NEW.order_id);
END;

DELIMITER ;;
-- payments
CREATE TRIGGER create_payment_date
BEFORE INSERT ON payments
FOR EACH ROW
BEGIN
	SET NEW.date = NOW();
END;;

DELIMITER ;;
-- collections
CREATE TRIGGER create_collection_date
BEFORE INSERT ON collections
FOR EACH ROW
BEGIN
	SET NEW.start_date = NOW();
    SET NEW.end_date = DATE_ADD(NOW(), INTERVAL 4 MONTH);
END;;

DELIMITER ;;
CREATE TRIGGER update_collection_date
BEFORE UPDATE ON collections
FOR EACH ROW
BEGIN
    IF NEW.start_date != OLD.start_date THEN
        SET NEW.end_date = DATE_ADD(NEW.start_date, INTERVAL 4 MONTH);
    END IF;
END;

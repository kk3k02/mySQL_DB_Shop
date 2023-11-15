CREATE TABLE 
	Orders (order_id int(10) NOT NULL UNIQUE AUTO_INCREMENT comment 'Unikalny identyfikator zamówienia', 
	`date` date NOT NULL comment 'Data złożenia zamówienia', 
	amount decimal(10, 2) NOT NULL comment 'Wartość całego zamówienia', 
	user_id int(10) NOT NULL, 
	payment_id int(10) NOT NULL, 
	delivery_id int(10) NOT NULL, 
	clothes_id int(10) NOT NULL, 
	PRIMARY KEY (order_id));
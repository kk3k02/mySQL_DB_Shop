CREATE TABLE 
	payments (payment_id int(10) NOT NULL AUTO_INCREMENT comment 'Unikalny identyfikator płatności',
	status enum('paid', 'unpaid', 'cancelled') NOT NULL DEFAULT 'unpaid' comment 'Status złożonego 	zamówienia (''paid'',''unpaid'',''cancelled'')',
	payment_form enum('card', 'blik', 'transfer') NOT NULL comment 'Forma płatności za zamówienie 	(''card'',''blik'',''transfer'')',
	`date` date comment 'Data opłacenia zamówienia', 
	PRIMARY KEY (payment_id)
	);

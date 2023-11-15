CREATE TABLE 
	Delivery (delivery_id int(10) NOT NULL AUTO_INCREMENT comment 'Unikalny identyfikator adresu dostawy', 
	city varchar(100) NOT NULL comment 'Nazwa miasta', 
	street varchar(100) NOT NULL comment 'Nazwa ulicy', 
	number int(10) NOT NULL comment 'Numer domu/mieszkania', 
	postal_code int(15) NOT NULL comment 'Kod pocztowy', 
	country varchar(100) NOT NULL comment 'Nazwa kraju', 
	PRIMARY KEY (delivery_id));
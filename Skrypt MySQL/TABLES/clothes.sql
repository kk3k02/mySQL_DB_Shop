CREATE TABLE 
	Clothes (clothes_id int(10) NOT NULL AUTO_INCREMENT comment 'Unikalny identyfikator przedmiotu', 
	material varchar(25) NOT NULL comment 'Materiał wykonania przedmiotu', 
	`size` varchar(10) comment 'Rozmiar przedmiotu', 
	sex enum('male','female','unisex') comment 'Płeć przeznaczenia przedmiotu (''male'',''female'',''unisex'')', 
	price decimal(6, 2) NOT NULL comment 'Cena sprzedaży przedmiotu', 
	collection_id int(10) NOT NULL, 
	PRIMARY KEY (clothes_id));
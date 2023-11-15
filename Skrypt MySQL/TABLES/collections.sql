CREATE TABLE 
	Collections (collection_id int(10) NOT NULL AUTO_INCREMENT comment 'Unikalny identyfikator kolekcji', 
	name varchar(45) NOT NULL comment 'Nazwa kolekcji', 
	start_date date NOT NULL comment 'Data rozpoczęcia sprzedaży kolekcji', 
	end_date date NOT NULL comment 'Data zakończenia sprzedaży kolekcji',
	PRIMARY KEY (collection_id));
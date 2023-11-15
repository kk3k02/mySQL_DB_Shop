CREATE TABLE 
	Users (user_id int(10) NOT NULL AUTO_INCREMENT comment 'Unikalny identyfikator użytkownika', 
	login varchar(20) NOT NULL comment 'Login do konta użytkownika', 
	password varchar(20) NOT NULL comment 'Hasło zabezpieczające konto użytkownika', 
	email varchar(255) NOT NULL comment 'Adres email przypisany do konta użytkownika', 
	phone varchar(15) comment 'Numer telefonu przypisany do konta użytkownika', 
	name varchar(45) NOT NULL comment 'Imię właściciela konta użytkownika', 
	surname varchar(45) NOT NULL comment 'Nazwisko właściciela konta użytkownika', 
	role enum('admin','employee','customer') NOT NULL comment 'Typ konta użytkownika (administrator, pracownik, 	klient)', 
	PRIMARY KEY (user_id));
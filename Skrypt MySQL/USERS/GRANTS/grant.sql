-- Admin
GRANT ALL ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;

-- users
GRANT SELECT,INSERT,UPDATE,DELETE ON sklep.users TO 'employee_1'@'localhost';
GRANT SELECT,INSERT,DELETE,UPDATE ON sklep.users TO 'customer_1'@'localhost';

-- orders
GRANT SELECT,INSERT,UPDATE,DELETE ON sklep.orders TO 'employee_1'@'localhost';
GRANT SELECT,INSERT ON sklep.orders TO 'customer_1'@'localhost';

-- payments
GRANT SELECT,INSERT,UPDATE,DELETE ON sklep.payments TO 'employee_1'@'localhost';
GRANT SELECT ON sklep.payments TO 'customer_1'@'localhost';

-- delivery
GRANT SELECT,INSERT,UPDATE,DELETE ON sklep.delivery TO 'employee_1'@'localhost';
GRANT SELECT,INSERT,UPDATE ON sklep.delivery TO 'customer_1'@'localhost';

-- clothes
GRANT SELECT,INSERT,UPDATE,DELETE ON sklep.clothes TO 'employee_1'@'localhost';
GRANT SELECT ON sklep.clothes TO 'customer_1'@'localhost';

-- collections
GRANT SELECT,INSERT,UPDATE,DELETE ON sklep.collections TO 'employee_1'@'localhost';
GRANT SELECT ON sklep.collections TO 'customer_1'@'localhost';


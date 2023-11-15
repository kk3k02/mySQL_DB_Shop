ALTER TABLE users
ADD UNIQUE (user_id);

ALTER TABLE users
ADD UNIQUE (login);

ALTER TABLE orders
ADD UNIQUE (order_id);

ALTER TABLE payments
ADD UNIQUE (payment_id);

ALTER TABLE delivery
ADD UNIQUE (delivery_id);

ALTER TABLE clothes
ADD UNIQUE (clothes_id);

ALTER TABLE collections
ADD UNIQUE (collection_id);
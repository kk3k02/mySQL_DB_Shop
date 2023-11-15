CREATE TABLE basket (
    order_id INT,
    clothes_id INT,
    PRIMARY KEY (order_id, clothes_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (clothes_id) REFERENCES clothes(clothes_id)
);
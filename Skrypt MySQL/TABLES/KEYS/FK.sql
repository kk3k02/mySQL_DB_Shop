ALTER TABLE Clothes ADD CONSTRAINT FKClothes FOREIGN KEY (collection_id) REFERENCES Collections (collection_id);
ALTER TABLE Orders ADD CONSTRAINT FKOrders FOREIGN KEY (user_id) REFERENCES Users (user_id);
ALTER TABLE Orders ADD CONSTRAINT FKOrders1 FOREIGN KEY (payment_id) REFERENCES Payments (payment_id);
ALTER TABLE Orders ADD CONSTRAINT FKOrders2 FOREIGN KEY (delivery_id) REFERENCES Delivery (delivery_id);

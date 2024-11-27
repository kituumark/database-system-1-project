-- Add Customer
INSERT INTO Customer (Name, Phone, Email, Address) 
VALUES ('John Doe', '1234567890', 'johndoe@example.com', '123 Elm Street');

-- Add Pizzas
INSERT INTO Pizza (Name, Size, Price) 
VALUES ('Margherita', 'Small', 8.99), 
       ('Pepperoni', 'Medium', 12.99);

-- Place Order
INSERT INTO `Order` (CustomerID, OrderDate, TotalPrice) 
VALUES (1, '2024-11-22', 21.98);

-- Link Order with Pizzas
INSERT INTO Order_Pizza (OrderID, PizzaID) 
VALUES (1, 1), (1, 2);



-- Safe parameterized query example
PREPARE stmt FROM 'INSERT INTO Customer (Name, Phone, Email, Address) VALUES (?, ?, ?, ?)';
SET @name = 'Jane Doe', @phone = '0987654321', @Email = 'janedoe@example.com', @Address = '456 Oak Avenue';
EXECUTE stmt USING @name, @phone, @Email, @Address;
DEALLOCATE PREPARE stmt;
 
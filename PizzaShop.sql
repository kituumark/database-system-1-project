CREATE DATABASE PizzaShop1;

USE PizzaShop1;

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Supplier (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(255)
);

CREATE TABLE Ingredient (
    IngredientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    SupplierID INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE Pizza (
    PizzaID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Size ENUM('Small', 'Medium', 'Large') NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Order_Pizza (
    OrderID INT NOT NULL,
    PizzaID INT NOT NULL,
    PRIMARY KEY (OrderID, PizzaID),
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (PizzaID) REFERENCES Pizza(PizzaID)
);

CREATE TABLE Pizza_Ingredient (
    PizzaID INT NOT NULL,
    IngredientID INT NOT NULL,
    PRIMARY KEY (PizzaID, IngredientID),
    FOREIGN KEY (PizzaID) REFERENCES Pizza(PizzaID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
);

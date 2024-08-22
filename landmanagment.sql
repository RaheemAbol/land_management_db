-- Create the Land Management Database
CREATE DATABASE IF NOT EXISTS LandManagementDB;
USE LandManagementDB;

-- Create Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    Role VARCHAR(20)
);

-- Create LandTypes table
CREATE TABLE LandTypes (
    TypeID INT AUTO_INCREMENT PRIMARY KEY,
    TypeName VARCHAR(50)
);

-- Create Owners table
CREATE TABLE Owners (
    OwnerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- Create LandPlots table
CREATE TABLE LandPlots (
    PlotID INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Size DECIMAL(10, 2),
    TypeID INT,
    OwnerID INT,
    FOREIGN KEY (TypeID) REFERENCES LandTypes(TypeID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);

-- Create TransactionStatus table
CREATE TABLE TransactionStatus (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    StatusName VARCHAR(50)
);

-- Create Transactions table
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    PlotID INT,
    BuyerID INT,
    SellerID INT,
    SalePrice DECIMAL(10, 2),
    SaleDate DATE,
    StatusID INT,
    FOREIGN KEY (PlotID) REFERENCES LandPlots(PlotID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (BuyerID) REFERENCES Owners(OwnerID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (SellerID) REFERENCES Owners(OwnerID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE,
    FOREIGN KEY (StatusID) REFERENCES TransactionStatus(StatusID)
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);

-- Insert initial data into LandTypes
INSERT INTO LandTypes (TypeName) VALUES
('Residential'),
('Commercial'),
('Agricultural');

-- Insert initial data into TransactionStatus
INSERT INTO TransactionStatus (StatusName) VALUES
('Pending'),
('Completed'),
('Cancelled');

-- Insert initial data into Owners
INSERT INTO Owners (FirstName, LastName, Email, PhoneNumber) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678');

-- Insert initial data into LandPlots
INSERT INTO LandPlots (Address, City, State, ZipCode, Size, TypeID, OwnerID) VALUES
('123 Maple St', 'Springfield', 'IL', '62704', 1.5, 1, 1),
('456 Oak St', 'Dover', 'DE', '19901', 2.3, 2, 2);

-- Insert initial data into Transactions
INSERT INTO Transactions (PlotID, BuyerID, SellerID, SalePrice, SaleDate, StatusID) VALUES
(1, 2, 1, 150000.00, '2023-07-15', 2),
(2, 1, 2, 200000.00, '2023-08-01', 2);

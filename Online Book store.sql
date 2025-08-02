-- DROP TABLE IF EXISTS Books;
-- CREATE TABLE Books (
--     Book_ID INT PRIMARY KEY,
--     Title VARCHAR(100),
--     Author VARCHAR(100),
--     Genre VARCHAR(50),
--     Published_Year INT,
--     Price NUMERIC(10, 2),
--     Stock INT
-- );

-- DROP TABLE IF EXISTS customers;
-- CREATE TABLE Customers (
--     Customer_ID INT PRIMARY KEY,
--     Name VARCHAR(100),
--     Email VARCHAR(100),
--     Phone VARCHAR(15),
--     City VARCHAR(50),
--     Country VARCHAR(150)
-- );

-- DROP TABLE IF EXISTS orders;
-- CREATE TABLE Orderss (
--     Order_ID INT PRIMARY KEY,
--     Customer_ID INT REFERENCES Customers(Customer_ID),
--     Book_ID INT REFERENCES Books(Book_ID),
--     Order_Date DATE,
--     Quantity INT,
--     Total_Amount NUMERIC(10, 2)
-- );

-- Values for Books 


-- INSERT INTO Books VALUES (1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 15.99, 10);
-- INSERT INTO Books VALUES(2, '1984', 'George Orwell', 'Dystopian', 1949, 12.50, 8);
-- INSERT INTO Books VALUES(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, 10.00, 12);
-- INSERT INTO Books VALUES(4, 'The Alchemist', 'Paulo Coelho', 'Adventure', 1988, 13.75, 5);
-- INSERT INTO Books VALUES(5, 'Harry Potter ', 'J.K. Rowling', 'Fantasy', 1997, 20.00, 15);

-- Values for Customers table

-- INSERT INTO Customers VALUES(1, 'Alice Johnson', 'alice.johnson@example.com', '9876543210', 'New York', 'USA');
-- INSERT INTO Customers VALUES(2, 'Bob Smith', 'bob.smith@example.com', '9123456789', 'Los Angeles', 'USA');
-- INSERT INTO Customers VALUES(3, 'Charlie Brown', 'charlie.brown@example.com', '9812345678', 'Chicago', 'USA');
-- INSERT INTO Customers VALUES(4, 'Diana Prince', 'diana.prince@example.com', '9988776655', 'London', 'UK');
-- INSERT INTO Customers VALUES(5, 'Ethan Hunt', 'ethan.hunt@example.com', '9776655443', 'Paris', 'France');


-- VALUES FOR ORDERSS TABLE

-- INSERT INTO Orderss VALUES(1, 1, 2, '01/08/2025', 1, 12.50);
-- INSERT INTO Orderss VALUES(2, 3, 5, '02/08/2025', 2, 40.00);
-- INSERT INTO Orderss VALUES(3, 2, 1, '02/08/2025', 1, 15.99);
-- INSERT INTO Orderss VALUES(4, 4, 4, '03/08/2025', 3, 41.25);
-- INSERT INTO Orderss VALUES(5, 5, 3, '03/08/2025', 1, 10.00);



-- SELECT *
-- FROM Books;

-- SELECT * 
-- FROM Customers;

-- SELECT * 
-- FROM Orderss;

        --   BASIC QUERIES

-- 1) Retrieve all books in the "Fiction" genre:

-- SELECT * 
-- FROM Books
-- WHERE Genre='Fiction';


-- 2) Find books published after the year 1950:

-- SELECT *
-- FROM Books
-- WHERE Published_Year > 1950;


-- 3) List all customers from the Canada:

-- SELECT * 
-- FROM Customers
-- WHERE Country='USA';

-- 4) Show orders placed in November 2023:

-- SELECT *
-- FROM Orderss
-- WHERE Order_Date BETWEEN '01/08/2025' AND '03/08/2025';


-- 5) Retrieve the total stock of books available:

-- SELECT SUM(Stock) as  Total_Stock
-- FROM Books;

-- 6) Find the details of the most expensive book:using subquery

-- SELECT *
-- FROM Books 
-- WHERE Price =(SELECT MAX(Price) FROM Books);



-- 7) Show all customers who ordered more than 1 quantity of a book:

-- SELECT *
-- FROM Orderss
-- WHERE Quantity>1;


-- 8) Retrieve all orders where the total amount exceeds $20:

-- SELECT *
-- FROM Orderss
-- WHERE Total_Amount>20;



-- 9) List all genres available in the Books table:

-- SELECT Genre
-- FROM Books;

-- 10) Find the book with the lowest stock:

-- SELECT *
-- FROM Books
-- WHERE Stock = (SELECT MIN(Stock) FROM Books);




-- - 11) Calculate the total revenue generated from all orders:

-- SELECT SUM( Total_Amount) AS Total_Revenue
-- FROM Orderss;



        --   ADVANCED QUERIES


 -- 1) Retrieve the total number of books sold for each genre:

--  SELECT 
--     b.Genre,
--     SUM(o.Quantity) AS Total_Books_Sold
-- FROM 
--     Books b
-- JOIN 
--     Orderss o ON b.Book_ID = o.Book_ID
-- GROUP BY 
--     b.Genre;


-- 2) Find the average price of books in the "Fantasy" genre:

-- SELECT AVG(Price) AS Average_Price
-- FROM Books
-- WHERE Genre='Fantasy';


-- 3) List customers who have placed at least 2 orders:

-- SELECT o.Customer_id, c.name, COUNT(o.Order_id) AS ORDER_COUNT
-- FROM Orderss o
-- JOIN Customers c ON o.Customer_id=c.Customer_id
-- GROUP BY o.Customer_id, c.name
-- HAVING COUNT(Order_id) >=2;




-- 4) Find the most frequently ordered book:

-- SELECT *
-- FROM (
--     SELECT 
--         b.Book_ID,
--         b.Title,
--         b.Author,
--         SUM(o.Quantity) AS Total_Ordered
--     FROM 
--         Books b
--     JOIN 
--         Orderss o ON b.Book_ID = o.Book_ID
--     GROUP BY 
--         b.Book_ID, b.Title, b.Author
--     ORDER BY 
--         Total_Ordered DESC
-- )
-- WHERE ROWNUM = 1;



-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

-- SELECT *
-- FROM Books
-- WHERE Genre = 'Fantasy'
-- ORDER BY Price DESC
-- FETCH FIRST 3 ROWS ONLY;



-- 6) Retrieve the total quantity of books sold by each author:

-- SELECT b.author, SUM(o.quantity) AS Total_Books_Sold
-- FROM orders o
-- JOIN books b ON o.book_id=b.book_id
-- GROUP BY b.Author;




-- 7) List the cities where customers who spent over $30 are located:

-- SELECT DISTINCT c.city, total_amount
-- FROM Orderss o
-- JOIN customers c 
-- ON o.Customer_ID=c.Customer_ID
-- WHERE o.total_amount > 30;


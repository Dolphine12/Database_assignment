create database book_store;
-- creates table called book
CREATE TABLE book (
    bookId INT PRIMARY KEY AUTO_INCREMENT, 
    bookTitle VARCHAR(50), 
    genre VARCHAR(50), 
    publicationYear YEAR
);
-- creates table called author
CREATE TABLE author (
    authorId INT PRIMARY KEY AUTO_INCREMENT, 
    authorName VARCHAR(50), 
    biography TEXT, 
    nationality VARCHAR(50)
);

CREATE TABLE bookAuthor (
    bookId INT, 
    authorId INT, 
    PRIMARY KEY (bookId, authorId), 
    FOREIGN KEY (bookId) REFERENCES book(bookId) ON DELETE CASCADE, 
    FOREIGN KEY (authorId) REFERENCES author(authorId) ON DELETE CASCADE
);
-- creates table called bookLanguage
CREATE TABLE bookLanguage (
    bookLanguageId INT PRIMARY KEY AUTO_INCREMENT, 
    languageName VARCHAR(50)
);
-- creates table called publisher
CREATE TABLE publisher (
    publisherId INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50), 
    contactDetail VARCHAR(50)
);
-- creates table called shipping_method
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(100) NOT NULL,
    cost DECIMAL(6,2) NOT NULL
);
-- creates table called customer
CREATE TABLE customer(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(15) UNIQUE,
phone VARCHAR(15)
);
-- creates table called customer_addres
CREATE TABLE customer_addres(
customer_id INT,
address_id INT,
address_status_id INT,
PRIMARY KEY(address_id),
FOREIGN key(customer_id) REFERENCES customer(customer_id),
FOREIGN key(address_id) REFERENCES address(address_id),
FOREIGN key(address_status_id) REFERENCES address_status(address_status_id)
);
-- creates table called address_status
CREATE TABLE address_status(
adress_status_id INT AUTO_INCREMENT PRIMARY KEY,
status_name VARCHAR(50) NOT NULL
);
-- creates table called address
CREATE TABLE address(
address_id INT AUTO_INCREMENT PRIMARY KEY,
city VARCHAR(100) NOT NULL,
state VARCHAR(100) NOT NULL,
country_id INT,
postal_code VARCHAR(20),
FOREIGN KEY(country_id) REFERENCES country(country_id)
);
-- creates table called country
CREATE TABLE country(
country_id INT AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR(100) NOT NULL
);

-- Create order_status table 
CREATE TABLE order_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_value VARCHAR(50) NOT NULL
);

-- Create cust_order table
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    shipping_method_id INT NOT NULL,
    order_status_id INT NOT NULL,
    shipping_address_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(status_id),
    FOREIGN KEY (shipping_address_id) REFERENCES address(address_id)
);

-- Create order_line table
CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,.
    price DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Create order_history table
CREATE TABLE order_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    status_date DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- Create database administrator user
CREATE USER 'db_admin'@'localhost' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON *.* TO 'db_admin'@'localhost' WITH GRANT OPTION;

-- Create application user with read/write access
CREATE USER 'annan_sarpei'@'localhost' IDENTIFIED BY 'annan123';
GRANT SELECT, INSERT, UPDATE, DELETE ON book_store.* TO 'annan_sarpei'@'localhost';

-- Create reporting user with read-only access
CREATE USER 'rose_wanjiru'@'localhost' IDENTIFIED BY 'Rose@123';
GRANT SELECT ON book_store.* TO 'rose_wanjiru'@'localhost';

-- Create customer service user with limited access
CREATE USER 'daisy_dolphine'@'localhost' IDENTIFIED BY 'daisy@123';
GRANT SELECT, UPDATE ON book_store.customer TO 'daisy_dolphine'@'localhost';
GRANT SELECT, UPDATE ON book_store.cust_order TO 'daisy_dolphine'@'localhost';
GRANT SELECT ON book_store.order_line TO 'daisy_dolphine'@'localhost';
GRANT SELECT ON book_store.order_status TO 'daisy_dolphine'@'localhost';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;

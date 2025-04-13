<<<<<<< HEAD
create database book_store;
-- Create shipping_method table
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(100) NOT NULL,
    cost DECIMAL(6,2) NOT NULL
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
    quantity INT NOT NULL,
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
CREATE USER 'app_user'@'localhost' IDENTIFIED BY 'App@123';
GRANT SELECT, INSERT, UPDATE, DELETE ON book_store.* TO 'app_user'@'localhost';

-- Create reporting user with read-only access
CREATE USER 'report_user'@'localhost' IDENTIFIED BY 'Report@123';
GRANT SELECT ON book_store.* TO 'report_user'@'localhost';

-- Create backup user
CREATE USER 'backup_user'@'localhost' IDENTIFIED BY 'Backup@123';
GRANT SELECT, LOCK TABLES ON book_store.* TO 'backup_user'@'localhost';

-- Create customer service user with limited access
CREATE USER 'cs_user'@'localhost' IDENTIFIED BY 'CS@123';
GRANT SELECT, UPDATE ON book_store.customer TO 'cs_user'@'localhost';
GRANT SELECT, UPDATE ON book_store.cust_order TO 'cs_user'@'localhost';
GRANT SELECT ON book_store.order_line TO 'cs_user'@'localhost';
GRANT SELECT ON book_store.order_status TO 'cs_user'@'localhost';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;
=======
CREATE TABLE book (
    bookId INT PRIMARY KEY AUTO_INCREMENT, 
    bookTitle VARCHAR(50), 
    ISBN VARCHAR(50), 
    genre VARCHAR(50), 
    publicationYear YEAR
);

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

CREATE TABLE bookLanguage (
    bookLanguageId INT PRIMARY KEY AUTO_INCREMENT, 
    languageName VARCHAR(50)
);

CREATE TABLE publisher (
    publisherId INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50), 
    contactDetail VARCHAR(50)
);
>>>>>>> b75df7dbf8fdd4ea007c5616b7491f5762b09293

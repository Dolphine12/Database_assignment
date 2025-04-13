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

CREATE TABLE customer(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(15) UNIQUE,
phone VARCHAR(15)
);

CREATE TABLE customer_addres(
customer_id INT,
address_id INT,
address_status_id INT,
PRIMARY KEY(address_id),
FOREIGN key(customer_id) REFERENCES customer(customer_id),
FOREIGN key(address_id) REFERENCES address(address_id),
FOREIGN key(address_status_id) REFERENCES address_status(address_status_id)
);

CREATE TABLE address_status(
adress_status_id INT AUTO_INCREMENT PRIMARY KEY,
status_name VARCHAR(50) NOT NULL
);

CREATE TABLE addres(
address_id INT AUTO_INCREMENT PRIMARY KEY,
city VARCHAR(100) NOT NULL,
state VARCHAR(100) NOT NULL,
country_id INT,
postal_code VARCHAR(20),
FOREIGN KEY(country_id) REFERENCES country(country_id)
);

CREATE TABLE country(
country_id INT AUTO_INCREMENT PRIMARY KEY,
country_name VARCHAR(100) NOT NULL
);
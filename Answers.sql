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
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
CREATE DATABASE wp_database;
CREATE USER 'acase'@'localhost' IDENTIFIED BY 'acase';
GRANT ALL PRIVILEGES ON wp_database.* TO 'acase'@'localhost';
FLUSH PRIVILEGES;


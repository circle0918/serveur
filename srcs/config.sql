CREATE DATABASE wordpressdb;
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'wordpresspass';
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'wordpresspass';
FLUSH PRIVILEGES;
CREATE DATABASE phpMyAdmindb;
GRANT ALL PRIVILEGES ON phpMyAdmindb.* TO 'root'@'localhost' WITH GRANT OPTION;
update mysql.user set plugin='mysql_native_password' where user='root';
FLUSH PRIVILEGES;

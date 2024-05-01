USE mysql;

-- CREATE USER IF NOT EXISTS
CREATE USER IF NOT EXISTS 'admin_super'@'%' IDENTIFIED BY 'password';

-- GRANT ALL PRIVILEGES ON coderhouse_generico.* TO 'admin_super'@'%'
GRANT ALL PRIVILEGES ON coderhouse_generico.* TO 'admin_super'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;

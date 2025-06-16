CREATE DATABASE IF NOT EXISTS online_shop ;

USE online_shop;

CREATE TABLE IF NOT EXISTS  users(
    id int AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    is_admin BOOLEAN,
    address VARCHAR(400) NOT NULL,
    postcode VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
); 

INSERT INTO users(first_name, last_name,  password, email,  phone_number, is_admin, address, postcode ) VALUES
("To'llqinxon", "Soliyev", "jifdHU%^4", "tolkinxon@gmail.com", "+998774779844", true, "Jomboy tuman/Samarqand MFY", "04070");

CREATE TABLE IF NOT EXISTS categories(
    id INT AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

INSERT INTO categories(name) VALUES
('Erkaklar kiyimi');

CREATE TABLE IF NOT EXISTS products(
    id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price  DECIMAL(10,2) NOT NULL,
    category_id INT,
    product_img VARCHAR(2000),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(category_id) REFERENCES categories(id)
);

INSERT INTO products(name, price, category_id, product_img) VALUES
("Palto", "1000000", 1, 'https://picsum.photos/200/300');

CREATE TABLE IF NOT EXISTS orders(
    id INT AUTO_INCREMENT,
    product_id INT,
    user_id INT,
    amount INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);

INSERT INTO orders(product_id, user_id, amount) VALUES
(1, 1, 3),
(1, 1, 2);

CREATE TABLE IF NOT EXISTS purchased(
    id INT AUTO_INCREMENT,
    product_id INT,
    user_id INT,
    amount INT,
    bought_date DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);
INSERT INTO purchased(product_id, user_id, amount, bought_date) VALUES
(1, 1, 3, CURRENT_DATE),
(1, 1, 2, CURRENT_DATE);
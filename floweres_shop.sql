CREATE DATABASE IF NOT EXISTS flowers_shop ;

USE flowers_shop;

CREATE TABLE IF NOT EXISTS  customers(
    id int AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    is_admin BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
); 

INSERT INTO customers(first_name, last_name,  password, email,  phone_number, is_admin) VALUES
("To'lqinxon", "Soliyev", "jifdHU%^4", "tolkinxon@gmail.com", "+998774779844", true),
("Husan", "Qodirov", "fae4%^4", "husan@gmail.com", "+9987742844", false),
("Mansur", "Bashirov", "njr4892%^4", "mansur@gmail.com", "+998777693484", false),
("Sobir", "Mallayev", "539ngir%^4", "sobir@gmail.com", "+998777693483", false);

CREATE TABLE IF NOT EXISTS categories(
    id INT AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

INSERT INTO categories(name) VALUES
('Piyozlilar'),
('Tropik minatada unuvchi'),
('Quruq mintaqada unuvchi'),
('Tikonlilar');

CREATE TABLE IF NOT EXISTS flowers(
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

INSERT INTO flowers(name, price, category_id, product_img) VALUES
("Atirgul", "400000", 4, 'https://picsum.photos/200/300'),
("Lola", "500000", 1, 'https://picsum.photos/200/300'),
("Paportnik", "200000", 2, 'https://picsum.photos/200/300'),
("Arhideya", "200000", 2, 'https://picsum.photos/200/300'),
("Nilufar", "200000", 2, 'https://picsum.photos/200/300'),
("Kaktus", "700000", 3, 'https://picsum.photos/200/300');

CREATE TABLE IF NOT EXISTS addres(
    id INT AUTO_INCREMENT,
    customer_id INT,
    city VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (city, region, street),
    PRIMARY KEY(id),
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);
 
INSERT IGNORE INTO addres(customer_id, city, region, street) VALUES
(1, "Samarqand", "Qo'shrabot", "Nurafshon"),
(1, "Samarqand", "Qo'shrabot", "Nurafshon"),
(2, "Toshkent", "Olmazor", "Nurafshon"),
(3, "Sirdaryo", "Guliston", "Nurafshon"),
(4, "Nukus", "Nukus", "Nurafshon");

CREATE TABLE IF NOT EXISTS orders(
    id INT AUTO_INCREMENT,
    flower_id INT,
    customer_id INT,
    address_id INT,
    amount INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(flower_id) REFERENCES flowers(id),
    FOREIGN KEY(customer_id) REFERENCES addres(customer_id),
    FOREIGN KEY(address_id) REFERENCES addres(id)
);

INSERT INTO orders(flower_id, customer_id, address_id, amount) VALUES
(1, 1, 1, 4),
(4, 2, 2, 5),
(2, 3, 3, 2),
(3, 4, 4, 1);


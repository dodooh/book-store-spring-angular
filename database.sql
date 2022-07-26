drop database if exists book_store;
create database book_store;
use book_store;

create table category
(
    id   int,
    name varchar(50),
    PRIMARY KEY (id)
);

create table publisher
(
    id   int,
    name varchar(50),
    PRIMARY KEY (id)
);

create table author
(
    id   int,
    name varchar(50),
    PRIMARY KEY (id)
);

create table book
(
    id             varchar(6),
    name           varchar(200),
    code           varchar(10),
    author_id      int,
    translator     varchar(50),
    publisher_id   int,
    total_page     int,
    price          double,
    quantity       int,
    description    longtext,
	discount       int,
    dimension      varchar(20),
    publisher_date varchar(20),
    category_id    int,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES `category` (id),
    FOREIGN KEY (author_id) REFERENCES `author` (id),
    FOREIGN KEY (publisher_id) REFERENCES `publisher` (id)
);

create table customer
(
    id            varchar(6),
    name          varchar(50),
    date_of_birth varchar(20),
    gender        bit,
    username      varchar(50),
    PRIMARY KEY (id)
);

create table cart
(
    id           int,
    customer_id  varchar(6),
    date_created varchar(20),
    primary key (id),
    FOREIGN KEY (customer_id) REFERENCES `customer` (id)
);

create table cart_book
(
    id       int,
    cart_id  int,
    book_id  varchar(6),
    quantity int,
    PRIMARY KEY (id),
    FOREIGN KEY (cart_id) REFERENCES `cart` (id),
    FOREIGN KEY (book_id) REFERENCES `book` (id)
)

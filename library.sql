CREATE TABLE IF NOT EXISTS category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    genre VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS bookshelf (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS librarian (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    phone VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS book (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    isbn BIGINT,
    category_id INT REFERENCES category(id),
    bookshelf_id INT REFERENCES bookshelf(id)
);
CREATE TABLE IF NOT EXISTS borrowing (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    librarian_id INT REFERENCES librarian(id),
    book_id INT REFERENCES book(id)
);
-- Setup Borrowers
INSERT INTO borrowing (name, address, phone)
VALUES (
        'Rivando Al Rasyid',
        'Jakarta, Indonesia',
        '0812-3456-7890'
    ),
    (
        'Angga VB',
        'Jakarta, Indonesia',
        '0812-9999-8888'
    ),
    ('Charlie Brown', '10 Pine St', '555-1001'),
    ('Diana Prince', '20 Amazon Way', '555-1002'),
    ('Edward Elric', '30 Alchemist Rd', '555-1003'),
    ('Faye Valentine', '40 Bebop Blvd', '555-1004'),
    ('George Miller', '50 Fury Rd', '555-1005'),
    ('Helen Parr', '60 Metro Ave', '555-1006'),
    ('Ian Wright', '70 Highbury Ln', '555-1007'),
    ('Jane Foster', '80 Mjolnir Cir', '555-1008');
-- Setup Categories & Shelves
INSERT INTO category (name, genre)
VALUES ('Tech', 'Programming'),
    ('Sci-Fi', 'Cyberpunk'),
    ('Non-Fiction', 'History');
INSERT INTO bookshelf (name)
VALUES ('Shelf-A1'),
    ('Shelf-B2'),
    ('Shelf-C3');
-- Setup Librarians
INSERT INTO librarian (name, address, phone)
VALUES ('Alice Smith', '123 Library Ln', '555-0101'),
    ('Bob Jones', '456 Archive St', '555-0102');
-- Setup Books
INSERT INTO book (name, isbn, category_id, bookshelf_id)
VALUES ('Clean Code', 9780132350884, 1, 1),
    ('The Pragmatic Programmer', 9780135957059, 1, 1),
    ('Neuromancer', 9780441569595, 2, 2),
    ('Snow Crash', 9780553380958, 2, 2),
    ('Sapiens', 9780062316097, 3, 3),
    ('Go Programming Blueprints', 9781783988020, 1, 1),
    ('Eloquent JavaScript', 9781593279509, 1, 1),
    (
        'The Design of Everyday Things',
        9780465050659,
        3,
        3
    ),
    ('Foundation', 9780553293357, 2, 2),
    ('Atomic Habits', 9780735211292, 3, 3);
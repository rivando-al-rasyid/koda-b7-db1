-- 1. Separate the User/Member from the Transaction
CREATE TABLE member (
  id      SERIAL PRIMARY KEY,
  name    VARCHAR(100) NOT NULL,
  address TEXT,
  phone   VARCHAR(20)
);

-- 2. Clean up the Category table (Genre is usually a property of Category)
CREATE TABLE category (
  id    SERIAL PRIMARY KEY,
  name  VARCHAR(100) NOT NULL,
  genre VARCHAR(100)
);

CREATE TABLE bookshelf (
  id   SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE librarian (
  id      SERIAL PRIMARY KEY,
  name    VARCHAR(100) NOT NULL,
  address TEXT,
  phone   VARCHAR(20)
);

-- 3. The Book table remains largely the same
CREATE TABLE book (
  id           SERIAL PRIMARY KEY,
  name         VARCHAR(255) NOT NULL,
  isbn         BIGINT UNIQUE, -- Added UNIQUE to prevent duplicate ISBNs
  category_id  INT REFERENCES category(id),
  bookshelf_id INT REFERENCES bookshelf(id)
);

-- 4. The Optimized Borrowing Table
CREATE TABLE borrowing (
  id           SERIAL PRIMARY KEY,
  member_id    INT REFERENCES member(id), -- Link to the new member table
  book_id      INT REFERENCES book(id),
  librarian_id INT REFERENCES librarian(id),
  borrow_date  DATE DEFAULT CURRENT_DATE, -- Critical for tracking
  return_date  DATE,                      -- NULL if the book is still out
  status       VARCHAR(20) DEFAULT 'borrowed' -- e.g., 'borrowed', 'returned', 'overdue'
);



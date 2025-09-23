-- schema.sql  (SQLite-compatible)
PRAGMA foreign_keys = ON;

-- Members table
CREATE TABLE IF NOT EXISTS Members (
    member_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name  TEXT NOT NULL,
    last_name   TEXT NOT NULL,
    email       TEXT UNIQUE NOT NULL,
    phone       TEXT,
    address     TEXT NOT NULL
);

-- Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    author_name TEXT NOT NULL,
    country     TEXT
);

-- Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id        INTEGER PRIMARY KEY AUTOINCREMENT,
    title          TEXT NOT NULL,
    author_id      INTEGER,
    published_year INTEGER,
    genre          TEXT,
    FOREIGN KEY(author_id) REFERENCES Authors(author_id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Loans table
CREATE TABLE IF NOT EXISTS Loans (
    loan_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    member_id   INTEGER NOT NULL,
    book_id     INTEGER NOT NULL,
    issue_date  TEXT NOT NULL,   -- store as 'YYYY-MM-DD'
    return_date TEXT,            -- NULL when not returned
    FOREIGN KEY(member_id) REFERENCES Members(member_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(book_id)   REFERENCES Books(book_id)   ON DELETE CASCADE ON UPDATE CASCADE
);

-- Payments table
CREATE TABLE IF NOT EXISTS Payments (
    payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    member_id  INTEGER NOT NULL,
    amount     REAL,
    method     TEXT NOT NULL,
    status     TEXT NOT NULL,
    FOREIGN KEY(member_id) REFERENCES Members(member_id) ON DELETE CASCADE ON UPDATE CASCADE
);

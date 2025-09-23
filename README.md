# 📚 Library Database – Data Insertion, Updates & Deletions

## 👋 Introduction
This project is part of my database practice work.  
Here, I created and manipulated data for a **Library Management System**.  
Instead of only designing the schema, I focused on **INSERT, UPDATE, and DELETE queries**, along with handling **NULL values**.  

---

## 🎯 Objectives
- Add records into tables using `INSERT`.  
- Handle **missing values** with `NULL` or defaults.  
- Modify records using `UPDATE ... WHERE`.  
- Remove records safely using `DELETE ... WHERE`.  

---

## 🛠️ Tools Used
- [DB Fiddle](https://www.db-fiddle.com/) (for testing queries online)  
- SQLiteStudio / MySQL Workbench (for running scripts locally)  

---

## 📑 File in this Repo
- `data.sql` → Contains `INSERT`, `UPDATE`, and `DELETE` queries with sample Library data.  

## 📊 ER Diagram
Here’s how everything is connected:

![ER Diagram](docs/er-diagram.png)

---

## 🚀 How to Run
1. Make sure you already have a Library schema created (`schema.sql`).  
   Example entities: `Members`, `Books`, `Authors`, `Loans`, `Payments`.  
2. Run the script:
   ```sql
   SOURCE data.sql;
3. Test it with queries like:
   ```sql
   SELECT * FROM Books;
   SELECT * FROM Loans WHERE return_date IS NULL;



create database library_mangagment;


use library_mangagment;

-- "branch_id","manager_id","branch_address","contact_no"
create table branch(
    branch_id varchar(10),
    manager_id varchar(10),
    branch_address varchar(50),
    contact_no varchar(10),
    PRIMARY KEY (branch_id)
);

DESCRIBE branch;

DROP TABLE IF EXISTS employees;

-- "emp_id","emp_name","position","salary","branch_id"
create table employees(
    emp_id varchar(10),
    emp_name varchar(25),
    positions varchar(25),
    salary INT,
    branch_id varchar(10), -- fk
    PRIMARY KEY (emp_id)
);


 
-- "isbn","book_title","category","rental_price","status","author","publisher"
create table books(
    isbn varchar(25), 
    book_title varchar(50),
    category varchar (25),
    rental_price FLOAT,
    status varchar(10),
    author varchar(50),
    publisher varchar(25),
    PRIMARY KEY (isbn)
);

SHOW TABLES;



--  " member_id","member_name","member_address","reg_date"
create table members(
    member_id varchar(10),
    member_name varchar(50),
    member_address varchar(75),
    reg_date DATE,
    PRIMARY KEY (member_id)
);
DESCRIBE members;






DROP TABLE IF EXISTS issued_status;

--  "issued_id","issued_member_id","issued_book_name","issued_date","issued_book_isbn","issued_emp_id"
create table issued_status(
    issued_id varchar(10),
    issued_member_id varchar(10), 
    issued_book_name varchar(50),
    issued_date DATE,
    issued_book_isbn varchar(25), 
    issued_emp_id varchar(10), 
    PRIMARY KEY (issued_id)
);

ALTER TABLE issued_status 
MODIFY COLUMN issued_book_name varchar(75);

DESCRIBE issued_status;



-- "return_id","issued_id","return_book_name","return_date","return_book_isbn"
DROP TABLE IF EXISTS return_status;
create table return_status (
    return_id varchar(10),
    issued_id varchar(10),
    return_book_name varchar(75),
    return_date DATE,
    return_book_isbn varchar (10),
    PRIMARY KEY (return_id)
);

alter table  return_status
modify column return_book_isbn VARCHAR(25);
 
-- FOREIGN KEY
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id) 
references members(member_id);

ALTER TABLE issued_status
add CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
references books(isbn);


DESCRIBE issued_status;

ALTER TABLE issued_status
add CONSTRAINT fk_employees
FOREIGN KEY(issued_emp_id)
references employees(emp_id);

ALTER TABLE employees
ADD CONSTRAINT fk_branch
foreign key( branch_id)
references branch(branch_id);


ALTER TABLE return_status
ADD CONSTRAINT fk_issus_status
FOREIGN KEY (issued_id)
references issued_status(issued_id);

select * from members;
INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');
SELECT * FROM members;

ALTER TABLE branch
MODIFY COLUMN contact_no VARCHAR(15);

-- Insert values into each branch table
INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');
SELECT * FROM branch;


-- ALTER TABLE employees
-- change column positions position varchar(25);


describe employees;
-- Insert values into each employees table
INSERT INTO employees(emp_id, emp_name, positions, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');
SELECT * FROM employees;

ALTER TABLE books
MODIFY COLUMN book_title varchar (100);
-- Inserting into books table 
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');

ALTER TABLE issued_status 
MODIFY column issued_book_name varchar(100);

-- inserting into issued table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');


-- inserting into return table
INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES

('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');



SELECT * FROM issued_status;
SELECT * FROM return_status;
SELECT * FROM employees;
SELECT * FROM books;
SELECT * FROM branch;  
SELECT * FROM members;






-- TASK 1. Create a new book record -- '978-1-60129-456-2','To kill a Mockingbird','Classic',6.00,'yes','Harper Lee',' J.B. Lipincott & Co.')
INSERT into books values ('978-1-60129-456-2','To kill a Mockingbird','Classic',6.00,'yes','Harper Lee',' J.B. Lipincott & Co.');

-- update an existing members address
select * from members;

update  members
set member_address = '144 Main St'
where member_id='C119';




USE library_mangagment;



-- ALTER DATABASE library_mangagment
-- MODIFY NAME =  library_management;


-- RENAME DATABASE library_mangagment
-- to library_management;


USE library_management;
show tables;



-- TASk 3 Delete a record from issued status table -- issued_id='IS104'

DELETE FROM issued_status
WHERE issued_id='IS127'; 

SET AUTOCOMMIT = OFF;
COMMIT;
INSERT INTO issued_status values ('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110');

ROLLBACK ;
select * from issued_status;




-- TASK 4 RETRIEVE ALL BOOKS issued by a specific employee -- emp_id='E101'


select  issued_status.issued_book_name from issued_status
where issued_emp_id='E101';


-- task 5 list member who have issued more that one book -- group by to find members
 -- have issued more than one book
 
 select  * from issued_status;

SELECT issued_status.issued_emp_id, COUNT(issued_id) as total_book_issued
FROM issued_status 
GROUP BY  issued_status.issued_emp_id
HAVING COUNT(issued_status.issued_id) > 1;



SELECT issued_emp_id 
FROM issued_status 
GROUP BY issued_emp_id 
HAVING COUNT(issued_id) > 1;


-- create summary tables : used ctas to generate new tables based on
-- query results - each books and total book_issued_cn ** 

SELECT * from books as b
join issued_status as ist
on ist.issued_book_isbn = b.isbn;


SELECT b.isbn , b.book_title,count(ist.issued_id) as no_of_book_issued
from books as b
join issued_status as ist
on ist.issued_book_isbn = b.isbn
group by b.isbn,b.book_title;


SELECT b.isbn , b.book_title,count(ist.issued_id) as no_of_book_issued
from books as b
join issued_status as ist
on ist.issued_book_isbn = b.isbn
group by 1,2;


CREATE TABLE book_counts
AS
SELECT b.isbn , b.book_title,count(ist.issued_id) as no_of_book_issued
from books as b
join issued_status as ist
on ist.issued_book_isbn = b.isbn
group by 1,2;

commit;

SELECT * from book_counts;


-- RETRIEVE ALL BOOKS IN SPECIFIC CATEGORY

select books.category from books
GROUP by books.category;

select *  from books     
where books.category= 'Classic';


SELECT 
    books.category,
    GROUP_CONCAT(book_title SEPARATOR ', ') AS books_in_category
FROM 
    books
GROUP BY 
    books.category;




-- List each employee who has issued more than 2 books, 
-- along with a comma-separated list of book titles they’ve issued.


SELECT 
    e.emp_id,
    e.emp_name,
    COUNT(i.issued_id) AS books_issued,
    GROUP_CONCAT(b.book_title SEPARATOR ', ') AS books_list
FROM 
    employees e
JOIN 
    issued_status i ON e.emp_id = i.issued_emp_id
JOIN 
    books b ON i.issued_book_isbn = b.isbn
GROUP BY 
    e.emp_id, e.emp_name
HAVING 
    COUNT(i.issued_id) > 2
ORDER BY 
    books_issued DESC;


-- task 8 find total rentl income by category
use library_mangagment;
select * from issued_status;


SELECT b.category , sum(b.rental_price)
FROM books as b
JOIN issued_status as ist 
ON ist.issued_book_isbn=b.isbn
GROUP by 1;



SELECT b.category , sum(b.rental_price),count(*)
FROM books as b
JOIN issued_status as ist 
ON ist.issued_book_isbn=b.isbn
GROUP by 1;


-- lIST members who have registered in 2021

select * from members
where members.reg_date LIKE '2021%'; 


-- lIST members who have registered in 2021 post july
select * from members
where members.reg_date > '2021-07-31';


insert into members values ('C120','arun','142 Main St','2025-06-01');
update  members
set reg_date= ' 2025-02-05'
where reg_date='2025-06-01';
insert into members values ('C121','prime','12 Main St','2025-01-01');


select * from members;

select * from members
where members.reg_date >=  CURRENT_DATE  -  INTERVAL 180 day;

-- LIST Employees with their branch managers name and their branch details

select e.emp_id,e.emp_name,e.branch_id,b.manager_id,b.branch_address,b.contact_no
from employees as e 
join branch as b
on e.branch_id=b.branch_id; 


select * from employees as e1
join
branch as b
on e1.branch_id=b.branch_id
join 
employees as e2
on 
b.manager_id = e2.emp_id;




select 
			e1.*,b.manager_id, e2.emp_name as manager
from employees as e1
join
branch as b
on e1.branch_id=b.branch_id
join 
employees as e2
on 
b.manager_id = e2.emp_id;



-- task 11 create a book with rental price above ceratin threshold

create table books_price_7
as 
select * from books
where books.rental_price > 7.0;

rollback;
drop table books_7;
show tables ;

-- retrieve list of books not yet returned

select * 
from issued_status as ist
LEFT JOIN
return_status as rst
on  ist.issued_id= rst .issued_id
where rst.return_id  IS NULL; 


select 
	DISTINCT ist.issued_book_name
from issued_status as ist
left join
return_status as rst
on ist.issued_id=rst.issued_id
where rst.return_id is null;

select  * from return_status;





INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id)
VALUES
('IS151', 'C118', 'The Catcher in the Rye', CURRENT_DATE - INTERVAL 24 day,  '978-0-553-29698-2', 'E108'),
('IS152', 'C119', 'The Catcher in the Rye', CURRENT_DATE - INTERVAL 13 day,  '978-0-553-29698-2', 'E109'),
('IS153', 'C106', 'Pride and Prejudice', CURRENT_DATE - INTERVAL 7 day,  '978-0-14-143951-8', 'E107'),
('IS154', 'C105', 'The Road', CURRENT_DATE - INTERVAL 32 day,  '978-0-375-50167-0', 'E101');

-- Adding new column in return_status


ALTER TABLE return_status
ADD Column book_quality VARCHAR(15) DEFAULT 'Good';

UPDATE return_status
SET book_quality = 'Damaged'
WHERE issued_id 
    IN ('IS112', 'IS117', 'IS118');
SELECT * FROM return_status;





select * from books;
select * from issued_status;
select * from employees;
select * from return_status;


-- task 13 Identify members with overdue books
-- write a query to identify members who have overdue books (assume a 30-day return period)
-- DIsplay the members_id, members_name , book_title,issue_date,and days overdue



-- issued_status == members == books==return_status
-- filtern books which have been returned
-- overdue > 30

SELECT CURRENT_DATE;

select  
		ist1.issued_member_id, m.member_name,
        b.book_title, 
        ist1.issued_date,
        rst.return_date,
        CURRENT_DATE - ist1.issued_date as overdue_days

from issued_status as ist1
join  
books as b
on ist1.issued_book_isbn = b.isbn
join 
members as m
on ist1.issued_member_id=m.member_id
LEFT JOIN -- cause we need to find book which are not returned  (inner join will give records only where book is returned) 
return_status as rst
on ist1.issued_id=rst.issued_id
where  rst.return_date IS Null
AND (CURRENT_DATE -ist1.issued_date) >30
order by ist1.issued_member_id;






-- task 14    Update Book Status on Return
-- Write a query to update the status of books in the books table to "Yes"
-- when they are returned (based on entries in the return_status table).


select * from books;
 
select * from return_status;
describe issued_status;
describe books;
describe return_status;

-- store procedures

-- CREATE OR REPLACE PROCEDURE add_return_records(p_return_id, varchar(10),p_issued_id varchar(10),p_book_quality varchar(15))
-- LANGUAGE plpgsql 
-- AS $$ 

-- DECLARE
-- 	v_isbn varchar (25);
--     v_book_name varchar(50);

-- BEGIN 
-- 		-- all your logic and code
-- 		INSERT INTO return_status (return_id,issued_id,return_date,book_quality)
--         VALUES
--         (p_return_id,p_issued_id,CURRENT_DATE,p_book_quality);
-- 		
-- 		SELECT 
-- 			issued_status.issued_book_isbn,
--             book_title
-- 			INTO 
-- 			v_isbn,
--             v_book_name
--         FROM issued_status 
--         WHERE issued_id=issued_id;
--         
--         UPDATE books
--         SET status = 'yes'
--         WHERE isbn=v_isbn;
--         
--         RAISE NOTICE 'Thankyou for returning the book: %',  v_book_name;
--         
-- END;
-- $$



-- CALL add_return_records();














DELIMITER $$

CREATE PROCEDURE add_return_records (
    IN p_return_id VARCHAR(10), 
    IN p_issued_id VARCHAR(10), 
    IN p_book_quality VARCHAR(15)
)
BEGIN
    DECLARE v_isbn VARCHAR(25);
    DECLARE v_book_name VARCHAR(50);

    -- Insert return record
    INSERT INTO return_status (return_id, issued_id, return_date, book_quality)
    VALUES (p_return_id, p_issued_id, CURDATE(), p_book_quality);

    -- Fetch the ISBN and book title
    SELECT i.issued_book_isbn, b.book_title
    INTO v_isbn, v_book_name
    FROM issued_status i
    JOIN books b ON i.issued_book_isbn = b.isbn
    WHERE i.issued_id = p_issued_id;

    -- Update book status to 'Yes'
    UPDATE books
    SET status = 'Yes'
    WHERE isbn = v_isbn;

    -- Optional: You can print a message (MySQL doesn’t show RAISE NOTICE)
    SELECT CONCAT('Thank you for returning the book: ', v_book_name) AS message;

END $$

DELIMITER ;




CALL add_return_records('RS200', 'IS107', 'Good');


CALL add_return_records('RS135', 'IS135', 'Good');




select * from books;
 
select * from return_status;
select * from issued_status;
select * from books;
select  * from return_status;


select * from 
issued_status as ist 
join books as b
on b.isbn=ist.issued_book_isbn
where status= 'no';


-- branch performance report  , CReate a query that generates  a performance report for each branch, showing the
--  number of books issued , the books returned and the total revenue generated from the book rental


select * from branch;
select * from issued_status;
select * from books;
select * from employees;
select * from return_status;

select * from issued_status as ist
join employees as e
on e.emp_id=ist.issued_emp_id
join branch as b
on e.branch_id=b.branch_id
LEFT join return_status as rst
on ist.issued_id=rst.issued_id
join books as bk
on ist.issued_book_isbn= bk.isbn; 




-- logic
CREATE TABLE branch_reports
AS 
select 
	
		b.branch_id,
        b.manager_id,
        count(ist.issued_id) as number_of_book_issued,
        count(rst.return_id) as number_of_book_returned,
        sum(bk.rental_price) as total_revenue

from issued_status as ist
join employees as e
on e.emp_id=ist.issued_emp_id
join branch as b
on e.branch_id=b.branch_id
LEFT join return_status as rst
on ist.issued_id=rst.issued_id
join books as bk
on ist.issued_book_isbn= bk.isbn
GROUP by 1,2; 

SELECT * FROM branch_reports;




-- create a new table active members containing members who have issued atleast one book in the last 6 months

CREATE TABLE active_members
AS
SELECt * from  members
where member_id in 
(select DISTINCT issued_member_id 
from issued_status 
where issued_date > CURRENT_DATE - interval 2 month);



-- task 17 : Find employees with the most  book issues processed top 3
-- write a query to find the top3 employees who have processed the most book issues. Display the employee name, number
-- of books processed and their branch 


select * from employees;
select * from books;
select * from issued_status;
select * from branch;

SELECT 
		e.emp_id,
        e.emp_name,
        COUNT(ist.issued_book_name) as no_books_issued,
        b.branch_id
from employees as e
join branch as b
ON e.branch_id=b.branch_id
join issued_status as ist
on e.emp_id= ist.issued_emp_id
group by 1,2
ORDER BY COUNT(ist.issued_book_name) DESC
LIMIT 3;






/* Task 19: Stored Procedure Objective: 

Create a stored procedure to manage the status of books in a library system. 

Description: Write a stored procedure that updates the status of a book in the library based on its issuance. 

The procedure should function as follows: 

The stored procedure should take the book_id as an input parameter. 

The procedure should first check if the book is available (status = 'yes'). 

If the book is available, it should be issued, and the status in the books table should be updated to 'no'. 

If the book is not available (status = 'no'), the procedure should return an error message indicating that the book is currently not available.
*/

select * from books;
select * from issued_status;

DESCRIBE  issued_status;
DESCRIBE books;




/* its for postgresql

CREATE OR REPLACE PROCEDURE issue_book(p_issued_id VARCHAR(10),p_issued_member_id VARCHAR(10),p_issued_book_isbn VARCHAR(25),p_issued_emp_id VARCHAR(10))

LANGUAGE plpsql
AS $$ 

DECLARE 
-- all the variable
	v_status VARCHAR(10),


BEGIN
-- all code
	-- checking if book is available 'yes'
		
	select 
		status 
		INTO 
        v_status
    from books 
    where isbn = p_issued_book_isbn;
	
    
    IF v_status='yes' THEN 
		
		INSERT INTO issued_status (issued_id, issued_member_id,issued_date,issued_book_isbn,issued_emp_id)
		VALUES (p_issued_id,p_issued_member_id,CURRENT_DATE,p_issued_book_isbn,p_issued_emp_id);
		
        UPDATE books
        set status='no'
        where isbn=issued_book_isbn;
        
		RAISE NOTICE 'book records added successfully for book isbn :%',p_issued_book_isbn;
        
    ELSE 
		
        RAISE NOTICE ' SORRY TO INFORM YOU THE BOOK YOU HAVE REQUESTED IS UNAVAILABLE book isbn :%',p_issued_book_isbn;
    END IF;



END;
$$

*/





DELIMITER $$

CREATE PROCEDURE issue_book(
    IN p_issued_id VARCHAR(10),
    IN p_issued_member_id VARCHAR(10),
    IN p_issued_book_isbn VARCHAR(25),
    IN p_issued_emp_id VARCHAR(10)
)
BEGIN
    DECLARE v_status VARCHAR(10);

    -- checking if book is available
    SELECT status 
    INTO v_status
    FROM books 
    WHERE isbn = p_issued_book_isbn;

    IF v_status = 'yes' THEN
        INSERT INTO issued_status (issued_id, issued_member_id, issued_date, issued_book_isbn, issued_emp_id)
        VALUES (p_issued_id, p_issued_member_id, CURRENT_DATE, p_issued_book_isbn, p_issued_emp_id);

        UPDATE books
        SET status = 'no'
        WHERE isbn = p_issued_book_isbn;

        SELECT CONCAT('Book records added successfully for book ISBN:', p_issued_book_isbn) AS message;

    ELSE
        SELECT CONCAT('Sorry, the book you requested is unavailable. Book ISBN:', p_issued_book_isbn) AS message;
    END IF;
END $$

DELIMITER ;



select * from books;
-- 978-0-06-025492-6 -- yes
-- 978-0-375-41398-8 -- no

select * from issued_status;

CALL issue_book('IS155', 'C108', '978-0-06-025492-6', 'E104');
 
select * from issued_status;

CALL issue_book('IS156', 'C108', '978-0-375-41398-8', 'E104');





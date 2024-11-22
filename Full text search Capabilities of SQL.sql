 use challenge;
 CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,    -- Experience in years
    salary DECIMAL(10, 2)   -- Salary as a decimal value
);
INSERT INTO teachers (name, subject, experience, salary)
VALUES
('John Doe', 'Mathematics', 10, 50000.00),
('Jane Smith', 'Physics', 8, 48000.00),
('Robert Brown', 'Chemistry', 12, 52000.00),
('Emily Davis', 'Biology', 6, 45000.00),
('Michael Wilson', 'History', 9, 47000.00),
('Linda Garcia', 'English', 11, 51000.00),
('James Martinez', 'Geography', 7, 46000.00),
('Barbara Hernandez', 'Computer Science', 5, 44000.00);

select * from teachers;
ALTER TABLE teachers 
ADD FULLTEXT(name, subject);
SHOW INDEX FROM teachers;

#1. Find teachers whose names or subjects match the keyword "Computer Science".
SELECT * 
FROM teachers
WHERE MATCH(name, subject) AGAINST('Computer Science');

#2. Find teachers who teach "Science" or related terms like "Biology" and "Chemistry".
SELECT * 
FROM teachers
WHERE MATCH(name, subject) AGAINST('Science Biology Chemistry' IN NATURAL LANGUAGE MODE);

#3. Find teachers whose subjects include "Computer Science" or "Mathematics" with high relevance.
SELECT name, subject, MATCH(name, subject) AGAINST('Computer Science Mathematics') AS relevance_score
FROM teachers
WHERE MATCH(name, subject) AGAINST('Computer Science Mathematics')
ORDER BY relevance_score DESC;


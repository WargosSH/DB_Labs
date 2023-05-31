/*-------------------Task 1-3-----------------*/
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    grade ENUM('', '1', '2', '3', '4', '5') DEFAULT 3
);


/*-------------------Task 4-----------------*/
SHOW CREATE TABLE students;


/*-------------------Task 5-----------------*/
DROP TRIGGER IF EXISTS GradeTrigger;
DELIMITER //
CREATE TRIGGER GradeTrigger
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF NEW.grade < 1 OR NEW.grade > 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Оценка должна быть в диапазоне от 1 до 5.';
    END IF;
END //
DELIMITER ;


/*-------------------Task 6-----------------*/
CREATE TABLE StudentPerformance (
    student_id INT,
    subject VARCHAR(25),
     grade ENUM('', '1', '2', '3', '4', '5') DEFAULT 3
);


/*-------------------Task 7-----------------*/
DROP TRIGGER IF EXISTS GradeRule;
ALTER TABLE students DROP COLUMN grade;
-- Вариант 11
-- Таблица факультетов
CREATE TABLE faculties (
    faculty_code SERIAL PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    foundation_date DATE,
    activity_type TEXT,
    max_students INTEGER CHECK (max_students > 0)
);

-- Таблица групп
CREATE TABLE student_groups (
    group_number SERIAL PRIMARY KEY,
    max_people INTEGER NOT NULL CHECK (max_people > 0),
    faculty_code INTEGER NOT NULL,
    curator VARCHAR(100),
    FOREIGN KEY (faculty_code)
        REFERENCES faculties(faculty_code)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Заполнение факультетов (10 записей)
INSERT INTO faculties
(faculty_name, foundation_date, activity_type, max_students)
VALUES
('Информационных технологий', '2000-09-01', 'Технический', 1000),
('Экономический', '1995-09-01', 'Экономика', 800),
('Юридический', '1998-09-01', 'Право', 700),
('Медицинский', '2001-09-01', 'Медицина', 900),
('Исторический', '1990-09-01', 'История', 500),
('Филологический', '1992-09-01', 'Языки и литература', 600),
('Физический', '1985-09-01', 'Физика', 550),
('Химический', '1987-09-01', 'Химия', 500),
('Биологический', '1993-09-01', 'Биология', 650),
('Педагогический', '1996-09-01', 'Педагогика', 750);

-- Заполнение групп (10 записей)
INSERT INTO student_groups
(max_people, faculty_code, curator)
VALUES
(25, 1, 'Иванов И.И.'),
(28, 2, 'Петров П.П.'),
(24, 3, 'Сидоров С.С.'),
(26, 4, 'Смирнова А.А.'),
(22, 5, 'Кузнецов В.В.'),
(27, 6, 'Попова Е.В.'),
(25, 7, 'Васильев А.Н.'),
(23, 8, 'Морозова О.П.'),
(29, 9, 'Новиков Д.Д.'),
(30, 10, 'Фёдорова М.С.');

-- Проверка данных
SELECT * FROM faculties;
SELECT * FROM student_groups;
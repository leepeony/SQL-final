-- A.
SELECT 
    d.name 'Department Name', COUNT(c.id) '# Courses'
FROM
    department d
        JOIN
    course c ON c.deptId = d.id
GROUP BY 1
ORDER BY 2;

-- B.
SELECT 
    c.name 'Name', COUNT(studentid) 'Count of Students'
FROM
    course c
        JOIN
    studentcourse sc ON c.id = sc.courseid
GROUP BY 1
ORDER BY 2 DESC , 1
;

-- 
-- C.1
SELECT 
    c.name 'Name'
FROM
    course c
        LEFT JOIN
    facultycourse fc ON fc.courseid = c.id
WHERE
    fc.facultyid IS NULL
ORDER BY 1;


-- 
-- C.2

SELECT 
    c.name 'Name', COUNT(s.id) 'Count of Students'
FROM
    course c
        JOIN
    studentcourse sc ON sc.courseid = c.id
        JOIN
    student s ON s.id = sc.studentid
WHERE
    c.name IN (SELECT 
            c.name
        FROM
            course c
                LEFT JOIN
            facultycourse fc ON fc.courseid = c.id
        WHERE
            fc.facultyid IS NULL
        ORDER BY 1)
GROUP BY 1
ORDER BY 2 DESC , 1 ASC
;
--  
-- 
-- D.

SELECT 
    year 'Year', COUNT(studentid) 'Count of Students'
FROM
    (SELECT DISTINCT
        studentid,
            YEAR(startdate) year,
            COUNT(DISTINCT RIGHT(startdate, 5))
    FROM
        studentcourse
    GROUP BY 1 , 2
    HAVING COUNT(DISTINCT RIGHT(startdate, 5)) > 1) a
GROUP BY 1
;


-- 
-- E.
SELECT 
    startdate 'Start Date',
    COUNT(DISTINCT studentid) 'Count of Students'
FROM
    studentcourse sc
WHERE
    MONTH(startdate) = 8
GROUP BY 1
ORDER BY startdate
;


--  
-- 
-- F.
SELECT 
    firstname 'First Name',
    lastname 'Last Name',
    COUNT(sc.courseid) 'Number of Courses'
FROM
    student s
        JOIN
    studentcourse sc ON sc.studentid = s.id
        JOIN
    course c ON c.id = sc.courseid
WHERE
    c.deptid = s.majorid
GROUP BY 1 , 2
ORDER BY 3 ASC , 2 ASC
;

-- 
-- G.
SELECT 
    s.firstname 'First Name',
    s.lastname 'Last Name',
    FORMAT(AVG(sc.progress), 1) 'Avg Grade'
FROM
    student s
        JOIN
    studentcourse sc ON sc.studentid = s.id
GROUP BY 1 , 2
HAVING FORMAT(AVG(sc.progress), 1) < 50
ORDER BY 3 DESC;

-- 
-- H.1 
SELECT 
    c.name 'Name', TRUNCATE(AVG(sc.progress), 1) 'Avg Grade'
FROM
    course c
        JOIN
    studentcourse sc ON c.id = sc.courseid
GROUP BY 1
ORDER BY 2 DESC
;

-- 
-- H.2
SELECT 
    avggrade 'Average Grade'
FROM
    (SELECT 
        c.name, FORMAT(AVG(sc.progress), 1) avggrade
    FROM
        course c
    JOIN studentcourse sc ON c.id = sc.courseid
    GROUP BY 1
    ORDER BY 2 DESC) a
LIMIT 1
;

-- 3 
SELECT 
    f.firstname 'First Name',
    f.lastname 'Last Name',
    c.name 'Course Name',
    FORMAT(AVG(sc.progress), 1) 'Avg Grade'
FROM
    faculty f
        JOIN
    facultycourse fc ON f.id = fc.facultyid
        JOIN
    course c ON c.id = fc.courseid
        JOIN
    studentcourse sc ON sc.courseid = c.id
GROUP BY 1 , 2 , 3
ORDER BY 1 , 2 , 3
;



-- 
-- 4
SELECT 
    firstname 'First Name', lastname 'Last Name'
FROM
    (SELECT 
        f.firstname,
            f.lastname,
            FORMAT(AVG(sc.progress), 1) avggrade,
            a.a
    FROM
        faculty f
    JOIN facultycourse fc ON f.id = fc.facultyid
    JOIN course c ON c.id = fc.courseid
    JOIN studentcourse sc ON sc.courseid = c.id
    JOIN (SELECT 
        avggrade * .9 a
    FROM
        (SELECT 
        c.name, FORMAT(AVG(sc.progress), 1) avggrade
    FROM
        course c
    JOIN studentcourse sc ON c.id = sc.courseid
    GROUP BY 1
    ORDER BY 2 DESC) a
    LIMIT 1) a
    GROUP BY 1 , 2 , 4
    HAVING FORMAT(AVG(sc.progress), 1) >= a.a) a
;


-- 
-- I. 
SELECT 
    s.firstname 'First Name',
    s.lastname 'Last Name',
    CASE
        WHEN MIN(sc.progress) < 40 THEN 'F'
        WHEN MIN(sc.progress) < 50 THEN 'D'
        WHEN MIN(sc.progress) < 60 THEN 'C'
        WHEN MIN(sc.progress) < 70 THEN 'B'
        WHEN MIN(sc.progress) >= 70 THEN 'A'
        ELSE NULL
    END 'Min Grade',
    CASE
        WHEN MAX(sc.progress) < 40 THEN 'F'
        WHEN MAX(sc.progress) < 50 THEN 'D'
        WHEN MAX(sc.progress) < 60 THEN 'C'
        WHEN MAX(sc.progress) < 70 THEN 'B'
        WHEN MAX(sc.progress) >= 70 THEN 'A'
        ELSE NULL
    END 'Max Grade'
FROM
    student s
        JOIN
    studentcourse sc ON sc.studentid = s.id
GROUP BY 1 , 2;

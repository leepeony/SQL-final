DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
    id INT(9) PRIMARY KEY NOT NULL,
    name VARCHAR(30)
);

DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
    id INT(9) PRIMARY KEY NOT NULL,
    firstname VARCHAR(30),
    lastname VARCHAR(50),
    deptid INT(9),
    FOREIGN KEY (deptid)
        REFERENCES department (id)
);

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
    id INT(9) PRIMARY KEY NOT NULL,
    name VARCHAR(50),
    deptId INT(9),
    FOREIGN KEY (deptId)
        REFERENCES department (id)
);

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
    id INT(9) PRIMARY KEY NOT NULL,
    firstname VARCHAR(30),
    lastname VARCHAR(50),
    street VARCHAR(50),
    streetdetail VARCHAR(30),
    city VARCHAR(30),
    state VARCHAR(30),
    postalcode CHAR(5),
    majorId INT(9),
    FOREIGN KEY (majorId)
        REFERENCES department (id)
);

DROP TABLE IF EXISTS `studentCourse`;
CREATE TABLE `studentCourse` (
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    Progress INT,
    StartDate DATE,
    PRIMARY KEY (StudentId , CourseId),
    FOREIGN KEY (StudentId)
        REFERENCES student (id),
    FOREIGN KEY (CourseId)
        REFERENCES course (id)
);

DROP TABLE IF EXISTS `facultyCourse`;
CREATE TABLE `facultyCourse` (
    FacultyId INT(9) NOT NULL,
    CourseId INT(9) NOT NULL,
    PRIMARY KEY (FacultyId , CourseId),
    FOREIGN KEY (FacultyId)
        REFERENCES faculty (id),
    FOREIGN KEY (CourseId)
        REFERENCES course (id)
);


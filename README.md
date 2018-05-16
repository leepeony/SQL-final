# SQL Skill Based Assessment (SBA)
Defining, Populating and Querying Database Tables

Objectives: This exercise is to test your skills with Databases and Structured Query Language (SQL). It will utilize your knowledge of SQL Data Definition Language (DDL), Data Modification Language (DML), and Data Query Language (DQL); most emphasis is placed on the DQL portion.

Deliverables: When you complete this assessment, you will provide two sql script files named sba_schema.sql and sba_queries.sql. These scripts will contain (in order) all of the select statements that you will write for steps 1 and 3 of this exercise.


Step 1: Write and apply the CREATE scripts

 

Use the above diagram to devise CREATE statements to create the tables required for this exercise. Order your CREATE statements as needed so that all foreign key definitions execute without error.

 

Please DO NOT include in your cms_schema.sql file any “create database” or “use <dbname>” statements.

 

Step 2: Apply the INSERT statements.

 

The provided INSERT script (sba_inserts.sql - available at Documents/Week 04/Hands On/sba_inserts.sql) data must be applied to your database. If the scripts you wrote in step 1 are incorrrect, these statements will not execute correctly, so you must then revise and re-apply your DDL statements until you succeed with the insertions.

 

You will not be able to proceed with this assignment until all INSERT statements succeed.

 

Step 3: Write queries that return the following resultsets:

 

A. The Curriculum Planning Committee is attempting to fill in gaps in the current course offerings. You need to provide them with a query which lists each department and the number of courses offered by that department. The two columns should have headers “Department Name” and “# Courses”, and the output should be sorted by “# Courses” in each department (ascending).

 

B. The recruiting department needs to know which courses are most popular with the students. Please provide them with a query which lists the name of each course and the number of students in that course. The two columns should have headers “Course Name” and “# Students”, and the output should be sorted first by # Students descending and then by course name ascending.

 

C. Quite a few students have been complaining that the professors are absent from some of their courses.

1. Write a query to list the names of all courses where the # of faculty assigned to those courses is zero. The output should be in alphabetical order by course name.

2. Using the above, write a query to list the course names and the # of students in those courses for all courses where there are no assigned faculty. The output should be ordered first by # of students descending and then by course name ascending.

 

D. The enrollment team is gathering analytics about student enrollment throughout the years. Write a query that lists the total # of students that were enrolled in the beginning of classes during each school year (from January 25th 2014 up to August 25th 2017). The first column should have the header “Students”. Provide a second “Year” column showing the enrollment year. [HINT: combining multiple select statements into one query is one way of doing this].

 

E. The enrollemnt team is gathering analytics about student enrollment and they now want to know about August admissions specifically. Write a query that lists the Start Date and # of Students who enrolled in classes in August of each year. Output should be ordered by start date ascending.

 

F. Students are required to take 4 courses, and at least two of these courses must be from the department of their major. Write a query to list students’ First Name, Last Name, and Number of Courses they are taking in their major department. The output should be sorted first in increasing order of the number of courses, then by student last name.

 

G. Students making average progress in their courses of less than 50% need to be offered tutoring assistance. Write a query to list First Name, Last Name and Average Progress of all students achieving average progress of less than 50%. The average progress as displayed should be rounded to one decimal place. Sort the output by average progress descending.

 

H. Faculty are awarded bonuses based on the progress made by students in their courses.

1. Write a query to list each Course Name and the Average Progress of students in that course. The output should be sorted descending by average progress.

2. Write a query that selects the maximum value of the average progress reported by the previous query.

3. Write a query that outputs the faculty First Name, Last Name, and average of the progress (“Avg. Progress”) made in each of their courses.

4. Write a query just like #3, but where only those faculty where average progress in their courses is 90% or more of the maximum observed in #2.

 

I. Students are awarded two grades based on the minimum and maximum progress they are making in the courses. The grading scale is as follows:

 

Progress < 40: F

Progress < 50: D

Progress < 60: C

Progress < 70: B

Progress >= 70: A

 

Write a query which displays each student’s First Name, Last Name, Min Grade based on minimum progress, and Max Grade based on maximum progress.

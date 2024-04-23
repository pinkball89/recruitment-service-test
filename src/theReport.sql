
/*
https://www.hackerrank.com/challenges/the-report/problem?isFullScreen=true
    Enter your query here and follow these instructions:
    1. Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
    2. The AS keyword causes errors, so follow this convention: "Select t.Field From table1 t" instead of "select t.Field From table1 AS t"
    3. Type your code immediately after comment. Don't leave any blank line.

You are given two tables: Students and Grades. 
Students contains three columns ID, Name and Marks.
Grades contains the following data: Grade, Min_Mark, Max_Mark
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
Write a query to help Eve.
Sample Input
Sample Output

Maria 10 99
Jane 9 81
Julia 9 88 
Scarlet 8 78
NULL 7 63
NULL 7 68

Note
Print "NULL"  as the name if the grade is less than 8.
Explanation
Consider the following table with the grades assigned to the students:
So, the following students got 8, 9 or 10 grades:
Maria (grade 10)
Jane (grade 9)
Julia (grade 9)
Scarlet (grade 8)
*/

SELECT CASE 
    WHEN Grades.grade < 8 THEN 'NULL' 
    ELSE Students.name 
    END 
, Grades.grade, Students.marks 
FROM Students, Grades 
WHERE Students.marks >= Grades.min_mark AND Students.marks <= Grades.max_mark 
ORDER BY Grades.grade DESC, Students.name;
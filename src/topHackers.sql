/*
https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.
Input Format

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 

Difficulty: The difficult_level is the level of difficulty of the challenge, and score is the score of the challenge for the difficulty level. 

Challenges: The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who created the challenge, and difficulty_level is the level of difficulty of the challenge. 

Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge that the submission belongs to, and score is the score of the submission. 

Sample Input

Hackers Table:  Difficulty Table:  Challenges Table:  Submissions Table: 

Sample Output

90411 Joe
Explanation
Hacker 86870 got a score of 30 for challenge 71055 with a difficulty level of 2, so 86870 earned a full score for this challenge.
Hacker 90411 got a score of 30 for challenge 71055 with a difficulty level of 2, so 90411 earned a full score for this challenge.
Hacker 90411 got a score of 100 for challenge 66730 with a difficulty level of 6, so 90411 earned a full score for this challenge.
Only hacker 90411 managed to earn a full score for more than one challenge, so we print the their hacker_id and name as  space-separated values.
Enter your query here.

*/

SELECT
h.hacker_id, h.name
FROM
hackers h
     INNER JOIN submissions s ON h.hacker_id = s.hacker_id  -- link all submissions of specific hacker
     INNER JOIN challenges c ON s.challenge_id = c.challenge_id -- link submission challenge id
     INNER JOIN difficulty d ON c.difficulty_level = d.difficulty_level AND s.score = d.score 
     -- This condition ensure that the score achieved in a submission matches the score associated with the corresponding difficulty level in the difficulty table. 
     GROUP BY
     h.hacker_id,
     h.name
 HAVING
     COUNT(c.challenge_id) > 1
 ORDER BY
     COUNT(c.challenge_id) DESC,
     h.hacker_id;

 /*    
-- Solution from Coach Phuong
SELECT a.hacker_id, a.name 
FROM (
    SELECT d.hacker_id, d.name, count(*) num_full_scores 
    FROM submissions a
    INNER JOIN challenges b on a.challenge_id = b.challenge_id -- link de lay difficulty level 
    INNER JOIN difficulty c on b.difficulty_level = c.difficulty_level  -- link de lay score  
    INNER JOIN hackers d on a.hacker_id = d.hacker_id  -- link de lay hacker name 
    WHERE a.score = c.score
    GROUP BY d.hacker_id, d.name
    HAVING count(*) > 1
) a
ORDER BY a.num_full_scores desc, a.hacker_id;
*/

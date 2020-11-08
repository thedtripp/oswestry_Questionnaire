--SELECT question_text, answer_text, point_value FROM QUESTIONNAIRES NATURAL JOIN QUESTIONS NATURAL JOIN ANSWER_CHOICES;

--variable question_id = x 
--DISPLAY A QUESTION //4
SELECT question_text FROM Questions WHERE question_id = 4;
--DISPLAY ANSWERS FOR A QUESTION //4
SELECT answer_text FROM Answer_choices WHERE question_id = 4;
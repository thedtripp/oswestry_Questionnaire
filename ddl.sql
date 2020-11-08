CREATE TABLE Questionnaires (
    questionnaire_id INTEGER PRIMARY KEY AUTOINCREMENT,
    questionnaire_name VARCHAR(100),
    questionnaire_description VARCHAR(255),
    num_questions int,
    order_questions VARCHAR(255)
); 

CREATE TABLE Questions (
    question_order_rank INTEGER,
    question_id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_text VARCHAR(255),
    questionnaire_id int,
    UNIQUE(questionnaire_id, question_order_rank),
    FOREIGN KEY(questionnaire_id) REFERENCES Questionnaires(questionnaire_id)
); 

-- CREATE TABLE Questions (
--     question_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     question_text VARCHAR(255),
--     questionnaire_id int,
--     FOREIGN KEY(questionnaire_id) REFERENCES Questionnaires(questionnaire_id)
-- ); 

CREATE TABLE Multiple_choice_questions (
    question_id int,
    correct_answer_id int,
    FOREIGN KEY(question_id) REFERENCES Questions(question_id)
); 

CREATE TABLE Answer_choices (
    answer_text VARCHAR(255),
    point_value int,
    question_id int,
    FOREIGN KEY(question_id) REFERENCES Questions(question_id)
); 
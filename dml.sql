INSERT INTO Questionnaires (questionnaire_name, questionnaire_description, num_questions)
VALUES 
    (
        'Oswestry Low Back Pain Disability Questionnaire', 
        'Instructions This questionnaire has been designed to give us information as to how your back or leg pain is affecting  your ability to manage in everyday life. Please answer by checking ONE box in each section for the statement which best applies to you. We realise you may consider that two or more statements in any one section apply but please just shade out the spot that indicates the statement which most clearly describes your problem.', 
        10
    );

INSERT INTO Questions (question_text, questionnaire_id)
VALUES 
    ('Section 1 – Pain intensity ', 1),
    ('Section 2 – Personal care (washing, dressing etc) ', 1),
    ('Section 3 – Lifting ', 1),
    ('Section 4 – Walking* ', 1),
    ('Section 5 – Sitting ', 1),
    ('Section 6 – Standing ', 1),
    ('Section 7 – Sleeping ', 1),
    ('Section 8 – Sex life (if applicable) ', 1),
    ('Section 9 – Social life', 1),
    ('Section 10 – Travelling', 1);

INSERT INTO Answer_choices (question_id, answer_text, point_value)
VALUES
    (1, 'I can tolerate the pain I have without having to use pain killers', 0),
    (1, 'The pain is bad but I manage without taking pain killers', 1),
    (1, 'Pain killers give complete relief from pain', 2),
    (1, 'Pain killers give moderate relief from pain', 3),
    (1, 'Pain killers give very little relief from pain', 4),
    (1, 'Pain killers have no effect on the pain and I do not use them', 5),
    (2, 'I can look after myself normally without causing extra pain', 0),
    (2, 'I can look after myself normally but it causes extra pain', 1),
    (2, 'It is painful to look after myself and I am slow and careful', 2),
    (2, 'I need some help but manage most of my personal care', 3),
    (2, 'I need help every day in most aspects of self care', 4),
    (2, 'I do not get dressed wash with difficulty and stay in bed', 5),
    (3, 'I can lift heavy weights without extra pain', 0),
    (3, 'I can lift heavy weights but it gives extra pain', 1),
    (3, 'Pain prevents me from lifting heavy weights off the floor but I can manage if they are conveniently positioned for example on a table', 2),
    (3, 'Pain prevents me from lifting heavy weights but I can manage light to medium weights if they are conveniently positioned', 3),
    (3, 'I can lift only very light weights', 4),
    (3, 'I cannot lift or carry anything at all', 5),
    (4, 'Pain does not prevent me walking any distance', 0),
    (4, 'Pain prevents me walking more than 1 mile', 1),
    (4, 'Pain prevents me walking more than 0.5 miles', 2),
    (4, 'Pain prevents me walking more than 0.25 miles', 3),
    (4, 'I can only walk using a stick or crutches', 4),
    (4, 'I am in bed most of the time and have to crawl to the toilet', 5),
    (5, 'I can sit in any chair as long as I like', 0),
    (5, 'I can only sit in my favorite chair as long as I like', 1),
    (5, 'Pain prevents me sitting more than 1 hour', 2),
    (5, 'Pain prevents me from sitting more than 0.5 hours', 3),
    (5, 'Pain prevents me from sitting more than 10 minutes', 4),
    (5, 'Pain prevents me from sitting at all', 5),
    (6, 'I can stand as long as I want without extra pain', 0),
    (6, 'I can stand as long as I want but it gives me extra pain', 1),
    (6, 'Pain prevents me from standing for more than 1 hour', 2),
    (6, 'Pain prevents me from standing for more than 30 minutes', 3),
    (6, 'Pain prevents me from standing for more than 10 minutes', 4),
    (6, 'Pain prevents me from standing at all', 5),
    (7, 'Pain does not prevent me from sleeping well', 0),
    (7, 'I can sleep well only by using tablets', 1),
    (7, 'Even when I take tablets I have less than 6 hours sleep', 2),
    (7, 'Even when I take tablets I have less than 4 hours sleep', 3),
    (7, 'Even when I take tablets I have less than 2 hours of sleep', 4),
    (7, 'Pain prevents me from sleeping at all', 5),
    (8, 'My sex life is normal and causes no extra pain', 0),
    (8, 'My sex life is normal but causes some extra pain', 1),
    (8, 'My sex life is nearly normal but is very painful', 2),
    (8, 'My sex life is severely restricted by pain', 3),
    (8, 'My sex life is nearly absent because of pain', 4),
    (8, 'Pain prevents any sex life at all', 5),
    (9, 'My social life is normal and gives me no extra pain', 0),
    (9, 'My social life is normal but increases the degree of pain', 1),
    (9, 'Pain has no significant effect on my social life apart from limiting energetic interests such as dancing', 2),
    (9, 'Pain has restricted my social life and I do not go out as often', 3),
    (9, 'Pain has restricted my social life to my home', 4),
    (9, 'I have no social life because of pain', 5),
    (10, 'I can travel anywhere without extra pain', 0),
    (10, 'I can travel anywhere but it gives me extra pain', 1),
    (10, 'Pain is bad but I manage journeys over 2 hours', 2),
    (10, 'Pain restricts me to journeys of less than 1 hour', 3),
    (10, 'Pain restricts me to short necessary journeys under 30 minutes', 4),
    (10, 'Pain prevents me from traveling except to the doctor or hospital', 5);
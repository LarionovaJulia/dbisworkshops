INSERT INTO users(user_id, email, pass)
VALUES (1, 'bla@bla.com', 'pass123');
INSERT INTO users(user_id, email, pass)
VALUES (2, 'larionovajul17@gmail.com', 'qwerty123');
INSERT INTO users(user_id, email, pass)
VALUES (3, 'petya@ukr.net', '12zxcv');

INSERT INTO lists(list_id, list_name, user_id)
VALUES (1, 'My list 1', 1);
INSERT INTO lists(list_id, list_name, user_id)
VALUES (2, 'My list 2', 1);
INSERT INTO lists(list_id, list_name, user_id)
VALUES (3, 'Calculus', 2);

INSERT INTO tasks(task_id, list_id, task_name, description, created_date, due_date, checked)
VALUES (1, 1, 'My task 1', 'smth intresting', '11-NOV-2018', '15-NOV-2018', 0);
INSERT INTO tasks(task_id, list_id, task_name, description, created_date, due_date, checked)
VALUES (2, 1, 'My task 2', 'smth new', '11-NOV-2018', '12-DEC-2018', 0);
INSERT INTO tasks(task_id, list_id, task_name, description, created_date, due_date, checked)
VALUES (3, 3, 'Prepare to test', 'It`s very important', '11-NOV-2018', '17-NOV-2018', 0);
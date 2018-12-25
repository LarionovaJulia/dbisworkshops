﻿CREATE OR REPLACE PACKAGE tasks_pack IS
    PROCEDURE add_task(
        task_id      IN  tasks.task_id%TYPE,
        list_id      IN  tasks.list_id%TYPE, 
        task_name    IN  tasks.task_name%TYPE,
        description  IN  tasks.description%TYPE,
        created_date IN  tasks.created_date%TYPE,
        due_date     IN  tasks.due_date%TYPE,
        checked      IN  tasks.checked%TYPE,
        message OUT STRING
        );
    
    PROCEDURE delete_task(
        task_id    IN  tasks.task_id%TYPE,
        deleted    IN  tasks.deleted%TYPE,
        message OUT STRING
        );
END tasks_pack;
/

CREATE OR REPLACE PACKAGE BODY tasks_pack IS 
    PROCEDURE add_task ( 
        task_id      IN  tasks.task_id%TYPE,
        list_id      IN  tasks.list_id%TYPE, 
        task_name    IN  tasks.task_name%TYPE,
        description  IN  tasks.description%TYPE,
        created_date IN  tasks.created_date%TYPE,
        due_date     IN  tasks.due_date%TYPE,
        checked      IN  tasks.checked%TYPE,
        message OUT STRING
        ) IS
        PRAGMA autonomous_transaction; 
    BEGIN 
        INSERT INTO tasks(task_id, list_id, task_name, description, created_date, due_date, checked) 
            VALUES(task_id, list_id, task_name, description, created_date, due_date, checked); 
        message := 'Task created'; 
        COMMIT; 
    END add_task;

    PROCEDURE delete_task ( 
        task_id    IN  tasks.task_id%TYPE,
        deleted    IN  tasks.deleted%TYPE,
        message OUT STRING 
        ) IS
        PRAGMA autonomous_transaction; 
    BEGIN 
        UPDATE tasks
        SET deleted = 1
        WHERE tasks.task_id = task_id; 
        message := 'Task deleted'; 
        COMMIT; 
    END delete_task;
END tasks_pack;
/
CREATE OR REPLACE PACKAGE lists_pack IS
    PROCEDURE add_list(
        list_id    IN  lists.list_id%TYPE,
        list_name  IN  lists.list_name%TYPE, 
        user_id    IN  lists.user_id%TYPE,
        message OUT STRING
        );
    
    PROCEDURE delete_list(
        list_id    IN  lists.list_id%TYPE,
        deleted    IN  lists.deleted%TYPE,
        message OUT STRING
        );
END lists_pack;
/

CREATE OR REPLACE PACKAGE BODY lists_pack IS 
    PROCEDURE add_list ( 
        list_id    IN  lists.list_id%TYPE,
        list_name  IN  lists.list_name%TYPE, 
        user_id    IN  lists.user_id%TYPE,
        message OUT STRING 
        ) IS
        PRAGMA autonomous_transaction; 
    BEGIN 
        INSERT INTO lists(list_id, list_name, user_id) 
            VALUES(list_id, list_name, user_id); 
        message := 'List created'; 
        COMMIT; 
    END add_list;

    PROCEDURE delete_list ( 
        list_id    IN  lists.list_id%TYPE,
        deleted    IN  lists.deleted%TYPE,
        message OUT STRING 
        ) IS
        PRAGMA autonomous_transaction; 
    BEGIN 
        UPDATE lists
        SET deleted = 1
        WHERE lists.list_id = list_id; 
        message := 'List deleted'; 
        COMMIT; 
    END delete_list;
END lists_pack;
/
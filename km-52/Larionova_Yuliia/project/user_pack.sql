CREATE OR REPLACE PACKAGE user_auth IS
    PROCEDURE registration(
        user_id IN  users.user_id%TYPE,
        email   IN  users.email%TYPE, 
        pass    IN  users.pass%TYPE,
        message OUT STRING
        );
    
    FUNCTION log_in(
        email  IN  users.email%TYPE, 
        pass   IN  users.pass%TYPE,
        message out STRING)
    RETURN users.email%Type;
END user_auth;
/

CREATE OR REPLACE PACKAGE BODY user_auth IS 
    PROCEDURE registration ( 
        user_id IN  users.user_id%TYPE, 
        email   IN  users.email%TYPE,  
        pass    IN  users.pass%TYPE, 
        message OUT STRING 
        ) IS
        PRAGMA autonomous_transaction; 
    BEGIN 
        INSERT INTO users(user_id, email, pass) 
            VALUES(user_id, email, pass); 
        message := 'Operation successful'; 
        COMMIT; 
    END registration;

    FUNCTION log_in(
        email  IN  users.email%TYPE, 
        pass   IN  users.pass%TYPE,
        message out STRING
        ) 
    RETURN users.email%Type
    IS
        CURSOR user_list is
            SELECT email FROM users;
            BEGIN
            FOR current_element in user_list
            LOOP
                IF current_element.email = email THEN
                    message := 'Successfully logged in';
                    RETURN email;
                ELSE
                    message := 'You are not signed on yet. Please, sign on';
                    RETURN Null;
                END IF;
            END LOOP;
        END log_in;
END user_auth;
/
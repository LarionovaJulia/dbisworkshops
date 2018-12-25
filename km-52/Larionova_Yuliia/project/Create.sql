CREATE TABLE users (
    user_id INT NOT NULL,
    email VARCHAR2(255) NOT NULL UNIQUE,
    pass VARCHAR2(255) NOT NULL,
    constraint PK_USER_ID primary key (user_id)
);

CREATE TABLE lists (
    list_id INT NOT NULL,
    list_name VARCHAR2(255) NOT NULL,
    user_id INT NOT NULL,
    constraint PK_LIST_ID primary key (list_id)
);


CREATE TABLE tasks (
    task_id INT NOT NULL,
    list_id INT NOT NULL,
    task_name VARCHAR2(255) NOT NULL,
    description VARCHAR2(255),
    created_date DATE, 
    due_date DATE,
    checked INT DEFAULT 0,
    constraint PK_TASK_ID primary key (task_id)
)  ;


alter table lists
   add constraint FK_USER_ID foreign key (user_id)
      references users(user_id);

alter table tasks
   add constraint FK_LIST_ID foreign key (list_id)
      references lists(list_id);

alter table users
    add constraint user_email_content check (Regexp_like(email, '[a-z0-9.@]'));
    
alter table tasks
    add constraint right_dates check (due_date >= created_date);
    
alter table tasks
    add constraint right_checked check (Regexp_like(checked, '[0-1]'));
CREATE DATABASE foriinji;

\c foriinji;

CREATE TABLE todo(
    todo_id SERIAL PRIMARY KEY,
    description VARCHAR(255)
);

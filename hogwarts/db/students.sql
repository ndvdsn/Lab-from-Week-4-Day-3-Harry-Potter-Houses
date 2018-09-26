DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;





CREATE TABLE houses (

  id SERIAL2 PRIMARY KEY,
  house_name VARCHAR(255),
  URL VARCHAR(255)

);

CREATE TABLE students (

  id SERIAL2 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house_id INT2 REFERENCES houses(id) ON DELETE CASCADE,
  age INT4

);

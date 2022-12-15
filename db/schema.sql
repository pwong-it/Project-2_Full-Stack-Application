CREATE DATABASE instructor_journal_db;
\c instructor_journal_db

CREATE TABLE journals(
    id SERIAL PRIMARY KEY,
    location TEXT,
    date DATE,
    user_id INTEGER,
    other_instructor TEXT,
    new_students INTEGER,
    injuries TEXT,
    drills TEXT,
    notes TEXT,
    image_url TEXT
);

INSERT INTO journals(location, date, other_instructor, new_students, injuries, drills, notes, image_url)
VALUES
    ('Wavell Heights', '08/12/22', 'Dilys', 2, 'none', 'Form, Pad work, Conditioning', 'One new student has previous experience in another martial art. Picked up DAY 1 drills very quickly. Other new student struggled slightly.', 'https://github.com/pwong-it/Project-2_Full-Stack-Application/blob/main/images/Journal%20Images/martial%20arts%20class.jpg?raw=true');


CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  password_digest TEXT,
  admin BOOLEAN
);

CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  journal_id INTEGER
);

ALTER TABLE likes
ADD CONSTRAINT unique_likes
UNIQUE(user_id, journal_id);
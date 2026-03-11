-- 1. Bas-tabeller (utan Foreign Keys)
CREATE TABLE person (
    person_id SERIAL PRIMARY KEY,
    namn VARCHAR(100) NOT NULL,
    efter_namn VARCHAR(100) NOT NULL,
    persunnummer VARCHAR(13) UNIQUE NOT NULL,
    gatuadress VARCHAR(100),
    postnummer VARCHAR(10),
    ort VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL
    telefonnumemr varchar (20)
);

-- 3. Roller (Student och Lärare med referncer till person och andra tabeller de är beroende av)
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    person_id INT UNIQUE REFERENCES person(person_id),
    klass_id INT REFERENCES klass(klass_id)
);


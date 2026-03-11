-- 1. Bas-tabeller (utan Foreign Keys)
CREATE TABLE person (
    person_id SERIAL PRIMARY KEY,
    namn VARCHAR(100) NOT NULL,
    efter_namn VARCHAR(100) NOT NULL,
    personnummer VARCHAR(13) UNIQUE NOT NULL,
    telefonnumemr varchar (20)
    gatuadress VARCHAR(100),
    postnummer VARCHAR(10),
    ort VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL
    
);

-- 3. Roller (Student och Lärare med referncer till person och andra tabeller de är beroende av)
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    person_id INT UNIQUE REFERENCES person(person_id),
    klass_id INT REFERENCES klass(klass_id)
);

CREATE TABLE lärare (
    lärare_id SERIAL PRIMARY KEY,
    person_id INT UNIQUE REFERENCES person(person_id),
    fast_anställd BOOLEAN DEFAULT FALSE,
    konsult BOOLEAN DEFAULT FALSE,
    företag_id INT REFERENCES företag(företag_id),
    konsultföretag_id INT REFERENCES konsultföretag(konsultföretag_id)
);

CREATE TABLE kurs (
    kurs_id SERIAL PRIMARY KEY,
    kurs_namn VARCHAR(100) NOT NULL,
    kurs_kod VARCHAR(20) UNIQUE NOT NULL,
    poäng INT NOT NULL
);

-- 2. Tabeller med enkla beroenden
CREATE TABLE program (
    program_id SERIAL PRIMARY KEY,
    namn VARCHAR(100) NOT NULL,
    anläggning_id INT REFERENCES anläggning(anläggning_id)
);


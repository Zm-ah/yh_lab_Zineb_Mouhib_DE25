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

CREATE TABLE klass (
    klass_id SERIAL PRIMARY KEY,
    namn VARCHAR(100) NOT NULL,
    program_id INT REFERENCES program(program_id),
    utbildningsledare_id INT REFERENCES utbildningsledare(utbildningsledare_id)

);

CREATE TABLE utbildningsledare (
    utbildningsledare_id SERIAL PRIMARY KEY,
    person_id INT UNIQUE REFERENCES person(person_id),
    program_id INT REFERENCES program(program_id)
);

-- 4. tabeler med flera beroende och många-till-många relationer
CREATE TABLE kurstillfällen (
    kurstillfällen_id SERIAL PRIMARY KEY,
    kurs_id INT REFERENCES kurs(kurs_id),
    klass_id INT REFERENCES klass(klass_id),
    poäng INT,
    kursnamn VARCHAR(100)
);

CREATE TABLE registrering (
    registrering_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(student_id),
    kurstillfällen_id INT REFERENCES kurstillfällen(kurstillfällen_id),
    betyg VARCHAR(10),
    datum DATE DEFAULT CURRENT_DATE
);

CREATE TABLE lärare_kurs (
    lärare_id INT REFERENCES lärare(lärare_id),
    kurs_id INT REFERENCES kurs(kurs_id),
    PRIMARY KEY (lärare_id, kurs_id)
);

CREATE TABLE program_kurs (
    program_id INT REFERENCES program(program_id),
    kurs_id INT REFERENCES kurs(kurs_id),
    PRIMARY KEY (program_id, kurs_id)
);

CREATE TABLE lia_praktik (
    lia_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(student_id),
    företag_id INT REFERENCES företag(företag_id),
    start_datum DATE,
    slut_datum DATE
);

CREATE TABLE anläggning (
    anläggning_id SERIAL PRIMARY KEY,
    ort VARCHAR(100) NOT NULL
);

CREATE TABLE företag (
    företag_id SERIAL PRIMARY KEY,
    företags_namn VARCHAR(100) NOT NULL,
    branch VARCHAR(100),
    ort VARCHAR(100)
);

CREATE TABLE konsultföretag (
    konsultföretag_id SERIAL PRIMARY KEY,
    företags_namn VARCHAR(100) NOT NULL,
    branch VARCHAR(100),
    ort VARCHAR(100)
);
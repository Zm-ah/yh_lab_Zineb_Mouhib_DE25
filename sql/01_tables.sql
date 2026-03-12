-- Bas-tabeller
CREATE TABLE anlaggning (
    anlaggning_id SERIAL PRIMARY KEY,
    ort VARCHAR(100) NOT NULL
);

CREATE TABLE foretag (
    foretag_id SERIAL PRIMARY KEY,
    foretags_namn VARCHAR(100) NOT NULL,
    branch VARCHAR(100),
    ort VARCHAR(100)
);

CREATE TABLE konsultforetag (
    konsultforetag_id SERIAL PRIMARY KEY,
    foretags_namn VARCHAR(100) NOT NULL,
    branch VARCHAR(100),
    ort VARCHAR(100)
);

CREATE TABLE person (
    person_id SERIAL PRIMARY KEY,
    namn VARCHAR(100) NOT NULL,
    efter_namn VARCHAR(100) NOT NULL,
    personnummer VARCHAR(13) UNIQUE NOT NULL,
    telefonnummer VARCHAR(20),
    gatuadress VARCHAR(100),
    postnummer VARCHAR(10),
    ort VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE kurs (
    kurs_id SERIAL PRIMARY KEY,
    kurs_namn VARCHAR(100) NOT NULL,
    kurs_kod VARCHAR(20) UNIQUE NOT NULL,
    poang INT NOT NULL
);

-- Tabeller med beroenden
CREATE TABLE program (
    program_id SERIAL PRIMARY KEY,
    namn VARCHAR(100) NOT NULL,
    anlaggning_id INT REFERENCES anlaggning(anlaggning_id)
);

CREATE TABLE utbildningsledare (
    utbildningsledare_id SERIAL PRIMARY KEY,
    person_id INT UNIQUE REFERENCES person(person_id),
    program_id INT REFERENCES program(program_id)
);

CREATE TABLE klass (
    klass_id SERIAL PRIMARY KEY,
    namn VARCHAR(100) NOT NULL,
    program_id INT REFERENCES program(program_id),
    utbildningsledare_id INT REFERENCES utbildningsledare(utbildningsledare_id)
);

-- Roller
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    person_id INT UNIQUE REFERENCES person(person_id),
    klass_id INT REFERENCES klass(klass_id)
);

CREATE TABLE larare (
    larare_id SERIAL PRIMARY KEY,
    person_id INT UNIQUE REFERENCES person(person_id),
    fast_anstalld BOOLEAN DEFAULT FALSE,
    konsult BOOLEAN DEFAULT FALSE,
    foretag_id INT REFERENCES foretag(foretag_id),
    konsultforetag_id INT REFERENCES konsultforetag(konsultforetag_id)
);

-- Kopplingar
CREATE TABLE kurstillfallen (
    kurstillfallen_id SERIAL PRIMARY KEY,
    kurs_id INT REFERENCES kurs(kurs_id),
    klass_id INT REFERENCES klass(klass_id)
);

CREATE TABLE registrering (
    registrering_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(student_id),
    kurstillfallen_id INT REFERENCES kurstillfallen(kurstillfallen_id),
    betyg VARCHAR(10),
    datum DATE DEFAULT CURRENT_DATE
);

CREATE TABLE larare_kurs (
    larare_id INT REFERENCES larare(larare_id),
    kurs_id INT REFERENCES kurs(kurs_id),
    PRIMARY KEY (larare_id, kurs_id)
);

CREATE TABLE program_kurs (
    program_id INT REFERENCES program(program_id),
    kurs_id INT REFERENCES kurs(kurs_id),
    PRIMARY KEY (program_id, kurs_id)
);

CREATE TABLE lia_praktik (
    lia_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES student(student_id),
    foretag_id INT REFERENCES foretag(foretag_id),
    start_datum DATE,
    slut_datum DATE
);
-- 1. Anlaggning
INSERT INTO anlaggning (ort) VALUES ('Stockholm'), ('Goteborg');

-- 2. Foretag
INSERT INTO foretag (foretags_namn, branch, ort) VALUES 
('Tech Solutions AB', 'IT', 'Stockholm'),
('Data Experts', 'Analys', 'Goteborg'),
('Cloud Nine', 'Cloud', 'Stockholm');

-- 3. Konsultforetag
INSERT INTO konsultforetag (foretags_namn, branch, ort) VALUES 
('Tech Solutions AB', 'IT', 'Stockholm'),
('Data Experts', 'Analys', 'Goteborg'),
('Cloud Nine', 'Cloud', 'Stockholm');

-- 4. Personer
INSERT INTO person (namn, efter_namn, personnummer, telefonnummer, email) VALUES 
('Erik', 'Eriksson', '19850101-1111', '070-1112233', 'erik@yh.se'),
('Sofia', 'Svensson', '19900202-2222', '070-2223344', 'sofia@yh.se'),
('Karl', 'Karlsson', '19700303-3333', '070-3334455', 'karl@konsult.se'),
('Maria', 'Nilsson', '19750404-4444', '070-4445566', 'maria@tech.se'),
('Zineb', 'Mouhib', '19951010-5555', '070-5556677', 'zineb@student.se'),
('Olle', 'Olsson', '19980606-6666', '070-6667788', 'olle@student.se'),
('Lina', 'Lundin', '19990707-7777', '070-7778899', 'lina@student.se'),
('Ahmed', 'Hassan', '19940808-8888', '070-8889900', 'ahmed@student.se'),
('Sara', 'Sandberg', '19960909-9999', '070-9990011', 'sara@student.se'),
('Johan', 'Johansson', '19971111-0000', '070-0001122', 'johan@student.se'); 

-- 5. Program
INSERT INTO program (namn, anlaggning_id) VALUES 
('Data Engineer 2025', 1), 
('AI-Specialist 2025', 2);

-- 6. Utbildningsledare (MÅSTE komma före klass)
INSERT INTO utbildningsledare (person_id, program_id) VALUES 
(1, 1), 
(2, 2);

-- 7. Klass
INSERT INTO klass (namn, program_id, utbildningsledare_id) VALUES 
('Data Engineer 2025 Klass', 1, 1),
('AI-Specialist 2025 Klass', 2, 2);


--8. student
INSERT INTO student (person_id, klass_id) VALUES 
(5, 1), -- Zineb -> Data Engineer 2025
(6, 1), -- Olle -> Data Engineer 2025
(7, 1), -- Lina -> Data Engineer 2025
(8, 2), -- Ahmed -> AI-Specialist 2025
(9, 2), -- Sara -> AI-Specialist 2025
(10, 2); -- Johan -> AI-Specialist 2025

-- 2. kurser
INSERT INTO kurs (kurs_namn, kurs_kod, poang) VALUES 
('Databasteknik', 'DB101', 20),
('Python Programmering', 'PY102', 25),
('AI och Maskininlärning', 'AI103', 30);

-- 3. lärare
INSERT INTO larare (person_id, fast_anstalld, konsult, foretag_id) VALUES 
(3, TRUE, FALSE, 1),  -- Karl (Fast anställd)
(4, FALSE, TRUE, 2);  -- Maria (Konsult)

-- 4. Kopplar lärare till kurser
INSERT INTO larare_kurs (larare_id, kurs_id) VALUES 
(1, 1), -- Karl lär ut Databasteknik
(1, 2), -- Karl lär ut Python
(2, 3); -- Maria lär ut AI

-- 5. Exempel på LIA-praktik
INSERT INTO lia_praktik (student_id, foretag_id, start_datum, slut_datum) VALUES 
(1, 1, '2026-04-01', '2026-06-01');
-- 2 anläggnigar som begerts i tabellen anläggning
INSERT INTO anläggning_id (ort ) VALUES ('Stockholm');
INSERT INTO anläggning_id (ort ) VALUES ('Göteborg');


-- några företag som begerts i tabellen företag för lia praktik
INSERT INTO företag (företags_namn, branch,ort) VALUES 
('Tech Solutions AB', 'IT', 'Stockholm'),
('Data Experts', 'Analys', 'Göteborg'),
('Cloud Nine', 'Cloud', 'Stockholm');

-- konsutolföretag som begerts i tabellen konsultföretag för lärare 
INSERT INTO konsultforetag (konsultforetag_name, branch, ort) values 
('Tech Solutions AB', 'IT', 'Stockholm'),
('Data Experts', 'Analys', 'Göteborg'),
('Cloud Nine', 'Cloud', 'Stockholm');

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

-- skapar program som begerts i tabellen program 
INSERT INTO program (namn, anlagning_id) VALUES 
('Data Engineer 2025', 1), -- Stockholm
('AI-Specialist 2025', 2);  -- Göteborg 

--skapa klass 
insert into klass (namn, program_id, utbildningsledare_id) values 
('Data Engineer 2025', 1, 1), -- Data Engineer 2025 programmet med utbildningsledare Erik
('AI-Specialist 2025', 2, 2); -- AI-Specialist 2025 programmet med utbildningsledare Sofia

-- Koppla Erik och Sofia till rollen som utbildningsledare 
insert into utbildningsledare (person_id, program_id) values 
(1, 1), -- Erik är utbildningsledare för Data Engineer 2025
(2, 2); -- Sofia är utbildningsledare för AI-Specialist 2025


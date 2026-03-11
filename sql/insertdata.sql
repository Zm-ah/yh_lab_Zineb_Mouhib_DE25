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

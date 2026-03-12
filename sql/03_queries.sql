-- Hämta information om studenter och deras klasser
SELECT p.namn, p.efter_namn, k.namn AS klass_namn 
FROM student s 
JOIN person p ON s.person_id = p.person_id 
JOIN klass k ON s.klass_id = k.klass_id;

-- se lärare och vilka klasser de undervisar i 
SELECT p.namn AS larare_namn, ku.kurs_namn 
FROM larare l
JOIN person p ON l.person_id = p.person_id
JOIN larare_kurs lk ON l.larare_id = lk.larare_id
JOIN kurs ku ON lk.kurs_id = ku.kurs_id;

-- rekna rader i alla tabeller 
SELECT p.namn, p.efter_namn, k.namn AS klass_namn 
FROM student s 
JOIN person p ON s.person_id = p.person_id 
JOIN klass k ON s.klass_id = k.klass_id;

-- rekna rader i alla tabeller 
SELECT 'Personer' as tabell, COUNT(*) FROM person
UNION ALL
SELECT 'Studenter', COUNT(*) FROM student
UNION ALL
SELECT 'Larare', COUNT(*) FROM larare
UNION ALL
SELECT 'Kurser', COUNT(*) FROM kurs;

-- visa studenter, klass och program
SELECT 
    p.namn AS larare, 
    ku.kurs_namn, 
    kl.namn AS klass, 
    pr.namn AS program
FROM larare l
JOIN person p ON l.person_id = p.person_id
JOIN larare_kurs lk ON l.larare_id = lk.larare_id
JOIN kurs ku ON lk.kurs_id = ku.kurs_id
JOIN kurstillfallen kt ON ku.kurs_id = kt.kurs_id
JOIN klass kl ON kt.klass_id = kl.klass_id
JOIN program pr ON kl.program_id = pr.program_id
ORDER BY pr.namn, kl.namn;
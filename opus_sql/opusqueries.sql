-- selects patients based on the ascending date of their date of birth
SELECT * 
FROM patient
ORDER BY DOB DESC;


-- selects all the patients that visited in the last week
SELECT * 
FROM visit
WHERE visitDate > CURRENT_DATE - 7;


-- returns the name of the patient who got discharged on 11/12/21 ordered by their visit date
SELECT patient.name
FROM patient, visit 
WHERE dischargedDate = '11/12/21'
ORDER BY visitDate DESC
LIMIT 1;



-- returns patients name based on the primary-diseases they carry
SELECT patient.name
FROM Patient, visit
WHERE primaryDiseases = 'Color Blindness';


-- returns patients name based on the secondary-diseases they carry
SELECT patient.name
FROM patient, visit
WHERE secondaryDiseases = 'Pinkeye';


-- returns patients sex based on the the disease they have
SELECT patient.sex
FROM patient, visit
WHERE primaryDiseases = 'pinkeye';


-- returns patiens name based on the primary-disease they have
SELECT primaryDisease
FROM visit, patient
WHERE name = 'Adam';

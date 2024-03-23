CREATE TABLE doctors(
	id INTEGER PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE work_shifts(
	id INTEGER PRIMARY KEY,
	name VARCHAR(50),
	bonus NUMERIC
);

CREATE TABLE attendances(
	id INTEGER PRIMARY KEY,
	id_doctor INTEGER REFERENCES doctors(id),
	hours INTEGER,
	id_work_shift INTEGER REFERENCES work_shifts(id)
);

INSERT INTO doctors VALUES
(1,	'Arlino'),
(2,	'Tiago'),
(3,	'Amanda'),
(4,	'Wellington');

INSERT INTO work_shifts VALUES
(1,	'nocturnal', 15),
(2,	'afternoon', 2),
(3,	'day', 1);

INSERT INTO attendances VALUES
(1,	1,	5,	1),
(2,	3,	2,	1),
(3,	3,	3,	2),
(4,	2,	2,	3),
(5,	1,	5,	3),
(6,	4,	1,	3),
(7,	4,	2,	1),
(8,	3,	2,	2),
(9,	2,	4,	2);


SELECT doctors.name,
ROUND(SUM(CASE 
	WHEN work_shifts.name = 'nocturnal' THEN (attendances.hours * 150) * 1.15 
	WHEN work_shifts.name = 'afternoon' THEN (attendances.hours * 150) * 1.02
	WHEN work_shifts.name = 'day' THEN (attendances.hours * 150) * 1.01
END ),1) "salary"
FROM doctors
INNER JOIN attendances
	ON doctors.id = attendances.id_doctor
INNER JOIN work_shifts 
	ON attendances.id_work_shift = work_shifts.id
GROUP BY doctors.name
ORDER BY salary DESC;






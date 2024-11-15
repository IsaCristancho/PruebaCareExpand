-- Active: 1731683083174@@127.0.0.1@3306@pruebacareexpand


INSERT INTO Patients (id, Name, LastName) VALUES
(4, 'Pablo', 'Vinals'),
(1, 'Maria', 'Sanchez'),
(2, 'Marina', 'Rodriguez'),
(3, 'Diego', 'Serrano'),
(5, 'Daniel', 'Gordillo'),
(6, 'Laura', 'Martínez');

INSERT INTO patient_device_history (id, timestamp, dataOwner, eventType, patientId) VALUES
(1, '2024-09-26 18:50:29', 'SYSTEM', 'FALL', 4),
(2, '2024-09-26 18:51:00', 'WATCH', 'LOCATION', 4),
(3, '2024-09-26 18:52:00', 'SYSTEM', 'SMS', 5),
(4, '2024-09-26 18:53:30', 'WATCH', 'FALL', 6),
(5, '2024-09-26 18:54:15', 'SYSTEM', 'LOCATION', 6),
(6, '2024-09-26 18:55:45', 'WATCH', 'FALL', 4);



-- p = alias tabla patient_device_history
-- pat = alias tabla Patient

CREATE VIEW FallEvents AS
SELECT 
    p.id AS event_id,  /* quitamos p.id */
    p.timestamp,
    p.dataOwner,
    p.eventType,
    pat.Name,
    pat.LastName
FROM 
    patient_device_history p
JOIN 
    Patients pat 
ON  /* unimos la tabla Patients donde esta el patientId en la tabla p */
    p.patientId = pat.id
WHERE 
    p.eventType = 'FALL'
    AND p.dataOwner = "WATCH";

SELECT * FROM FallEvents;

UPDATE Patients
SET LastName = 'Vinals'
WHERE id = 4;





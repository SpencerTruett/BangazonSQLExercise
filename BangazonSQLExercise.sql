--SELECT e.FirstName, e.LastName, CASE 
--	  WHEN e.IsSupervisor = 0 THEN 'FALSE'
--	  WHEN e.IsSupervisor = 1 THEN 'TRUE'
--	  END AS IsSupervisor, d.[Name] FROM Employee e
--LEFT JOIN Department d ON d.Id = e.DepartmentId
--ORDER BY d.[Name], e.LastName, e.FirstName;

--SELECT [Name], Budget FROM Department
--ORDER BY Budget DESC;

--SELECT d.[Name], e.FirstName + ' ' + e.LastName AS FullName, CASE 
--	  WHEN e.IsSupervisor = 0 THEN 'FALSE'
--	  WHEN e.IsSupervisor = 1 THEN 'TRUE'
--	  END AS IsSupervisor FROM Department d
--	INNER JOIN Employee e ON e.DepartmentId = d.Id
--	WHERE e.IsSupervisor = 1

--SELECT d.[Name] AS DepartmentName, COUNT(e.DepartmentId) AS NumberOfEmployees FROM Department d
--LEFT JOIN Employee e ON e.DepartmentId = d.Id
--GROUP BY d.[Name]

--UPDATE Department
--set Budget = Budget * 1.2

--SELECT e.FirstName + ' ' + e.LastName AS EmployeesNotInATrainingProgram FROM Employee e
--LEFT JOIN EmployeeTraining et ON et.EmployeeId = e.Id
--LEFT JOIN TrainingProgram tp ON tp.Id = et.TrainingProgramId
--WHERE tp.[Name] IS NULL

--SELECT e.FirstName + ' ' + e.LastName AS EmployeesInATrainingProgram, COUNT(et.EmployeeId) AS NumberOfPrograms FROM Employee e
--LEFT JOIN EmployeeTraining et ON et.EmployeeId = e.Id
--LEFT JOIN TrainingProgram tp ON tp.Id = et.TrainingProgramId
--WHERE tp.[Name] IS NOT NULL
--GROUP BY e.FirstName, e.LastName;

--SELECT tp.[Name] AS ProgramName, COUNT(et.TrainingProgramId) AS NumberOfAttendees FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et ON et.TrainingProgramId = tp.Id
--GROUP BY tp.[Name]

--SELECT tp.[Name], tp.MaxAttendees,
-- CASE 
--	  WHEN tp.MaxAttendees - COUNT(et.TrainingProgramId) = 0 THEN 'FULL'
--	  WHEN tp.MaxAttendees - COUNT(et.TrainingProgramId) > 0 THEN 'OPEN'
--	  END AS AvailiableSeats
--FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et ON et.TrainingProgramId = tp.Id
--GROUP BY tp.[Name], tp.MaxAttendees

--SELECT [Name], StartDate FROM TrainingProgram
--ORDER BY StartDate ASC

--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (12, 14);
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (13, 14);
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (14, 14);
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (15, 14);

--SELECT TOP 3 tp.Id, tp.[Name] AS MostPopularTrainingPrograms, COUNT(et.TrainingProgramId) AS NumberOfAttendees FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et ON et.TrainingProgramId = tp.Id
--GROUP BY tp.Id, tp.[Name]
--ORDER BY NumberOfAttendees DESC

--SELECT DISTINCT TOP 3 tp.[Name] AS MostPopularTrainingPrograms, COUNT(et.TrainingProgramId) AS NumberOfAttendees FROM TrainingProgram tp
--LEFT JOIN EmployeeTraining et ON et.TrainingProgramId = tp.Id
--GROUP BY tp.[Name]
--ORDER BY NumberOfAttendees DESC

--STILL WORKING ON THIS ONE
SELECT e.FirstName + ' ' + e.LastName AS EmployeesWithoutComputers FROM Employee e
LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
LEFT JOIN Computer c ON c.Id = ce.ComputerId
WHERE ce.UnassignDate IS NOT NULL

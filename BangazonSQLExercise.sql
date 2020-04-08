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

--THIS ONE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--STILL WORKING ON THIS ONE
--SELECT e.FirstName + ' ' + e.LastName AS EmployeesWithoutComputers FROM Employee e
--LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
--LEFT JOIN Computer c ON c.Id = ce.ComputerId
--WHERE ce.UnassignDate IS NULL

--SELECT  e.FirstName + ' ' + e.LastName AS FullName,
-- CASE 
--	  WHEN c.Make + ' ' + c.Manufacturer  IS NOT NULL THEN c.Make + ' ' + c.Manufacturer
--	  WHEN c.Make + ' ' + c.Manufacturer IS NULL THEN 'N/A'
--	  END AS ComputerInfo
--FROM Employee e
--LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
--LEFT JOIN Computer c ON c.Id = ce.ComputerId

--SELECT c.Make + ' ' + c.Manufacturer AS ComputerName, c.PurchaseDate FROM Computer c
--WHERE c.PurchaseDate <= '2019-07-01'
--AND c.DecomissionDate IS NULL

--SELECT e.FirstName + ' ' + e.LastName AS FullName, COUNT(ce.EmployeeId) AS NumberOfComputers FROM Employee e
--LEFT JOIN ComputerEmployee ce ON ce.EmployeeId = e.Id
--GROUP BY e.FirstName, e.LastName

--SELECT DISTINCT pt.[Name], COUNT(pt.[Name]) AS NumberOfUsers FROM PaymentType pt
--GROUP BY pt.[Name]

--SELECT TOP 10 p.Title, p.Price, c.FirstName + ' ' + c.LastName AS FullName FROM Product p
--LEFT JOIN Customer c ON c.Id = p.CustomerId
--ORDER BY p.Price DESC

--SELECT TOP 10 p.Title, COUNT(op.ProductId) AS NumberOfOrders FROM Product p
--LEFT JOIN OrderProduct op ON op.ProductId = p.Id
--GROUP BY p.Title
--ORDER BY NumberOfOrders DESC

--SELECT c.FirstName + ' ' + c.LastName AS FullName, COUNT(o.CustomerId) AS NumberOfOrders FROM Customer c
--LEFT JOIN [Order] o ON o.CustomerId = c.Id
--GROUP BY c.FirstName, c.LastName
--ORDER BY NumberOfOrders DESC


-- WORKING ON THIS ONE AS WELL
SELECT DISTINCT prt.[Name] AS ProductType, SUM(COUNT(op.ProductId) * p.Price) AS TotalSales FROM Product p
LEFT JOIN ProductType prt ON prt.Id = p.ProductTypeId
LEFT JOIN OrderProduct op ON op.ProductId = p.Id
GROUP BY prt.[Name]
ORDER BY TotalSales DESC


--SELECT e.FirstName, e.LastName, CASE 
--	  WHEN e.IsSupervisor = 0 THEN 'FALSE'
--	  WHEN e.IsSupervisor = 1 THEN 'TRUE'
--	  END AS IsSupervisor, d.[Name] FROM Employee e
--LEFT JOIN Department d ON d.Id = e.DepartmentId
--ORDER BY d.[Name], e.LastName, e.FirstName;


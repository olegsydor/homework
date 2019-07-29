/*4. (Доповнена) Вивести унікальні пари номерів постачальників і пари номерів деталей, таких, 
що обидва постачальника поставляють обидві вказані деталі. 
Номер першого постачальника менший за номер другого постачальника, номер першої деталі менший за номер другої деталі.
Output columns: supplierid as First_Supplier, supplierid as Second_Supplier, detailid as First_Detail, detailid as Second_Detail
Sorting: First_Supplier, Second_Supplier, First_Detail, Second_Detail
*/

;WITH A_CTE (S, D1, D2)
AS
(
SELECT DISTINCT S1.supplierid, S1.detailid, S2.detailid FROM supplies AS S1
CROSS APPLY supplies AS S2
WHERE S1.supplierid = S2.supplierid
AND S2.detailid > S1.detailid
)
SELECT A1.S AS First_Supplier
      ,A2.S AS Second_Supplier
	  ,A1.D1 AS First_Detail
	  ,A1.D2 AS Second_Detail
FROM A_CTE AS A1
CROSS APPLY A_CTE AS A2
WHERE A2.D2 = A1.D2 AND A2.D1 = A1.D1 AND A2.S > A1.S
ORDER BY First_Supplier, Second_Supplier, First_Detail, Second_Detail
GO

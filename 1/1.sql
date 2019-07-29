/*1. Вивести постачальників, рейтинг яких менший ніж рейтинг постачальника із значенням supplierid = 4.
Output columns: supplierid, name, rating
Sorting: supplierid
*/

SELECT [supplierid]
      ,[name]
      ,[rating]
FROM suppliers
WHERE [rating] < (SELECT rating FROM suppliers WHERE [supplierid] = 4)
ORDER BY [supplierid]
GO
/*5. Вивести усі поставки тих постачальників, які поставляють яку-небудь червону деталь.
Output columns: supplierid, detailid, productid, quantity
Sorting: supplierid, detailid, productid
*/

SELECT [supplierid]
      ,[detailid]
      ,[productid]
      ,[quantity]
  FROM [supplies]
WHERE supplierid IN 
(
SELECT S.supplierid
FROM [supplies] AS S
JOIN [details] AS D
ON D.detailid = S.detailid
AND D.color = 'Red'
)
ORDER BY [supplierid], [detailid], [productid]
GO
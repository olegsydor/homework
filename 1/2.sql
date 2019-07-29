/*2. Вивести продукти, що знаходяться в Лондоні або для них поставляються деталі яким-небудь постачальником з Лондона, 
з видаленням дублікатів.
Output columns: productid, name
Sorting: productid
*/

SELECT [productid]
      ,[name]
  FROM [products]
  WHERE [city] = 'London'
UNION
SELECT P.[productid]
      ,P.[name]
FROM [supplies] AS S
JOIN [details] AS D
ON D.detailid = S.detailid
JOIN [suppliers] AS S1
ON S1.supplierid = S.supplierid
JOIN [products] AS P
ON P.productid = S.productid
WHERE S1.city = 'London'
ORDER BY [productid]
GO

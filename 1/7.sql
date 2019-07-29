/*7. Вивести деталі, які поставляються будь-яким постачальником з Лондона чи для будь-якого продукту з Лондона, з видаленням дублікатів.
Output columns: detailid, name
Sorting: detailid
*/

SELECT S.[detailid], D.[name] FROM
(
SELECT [detailid] FROM [supplies] WHERE [supplierid] IN (SELECT [supplierid] FROM [suppliers] WHERE [city] = 'London')
UNION
SELECT [detailid] FROM [supplies] WHERE [productid] IN (SELECT [productid] FROM [products] WHERE [city] = 'London')
) AS S
JOIN [details] AS D
ON D.detailid = S.detailid
ORDER BY [detailid]
GO

/*
SELECT DISTINCT S.[detailid], D.[name]
FROM [supplies] AS S
JOIN [details] AS D
ON D.detailid = S.detailid
JOIN [suppliers] AS S1
ON S1.supplierid = S.supplierid
JOIN [products] AS P
ON P.productid = S.productid
WHERE P.city = 'London' OR S1.city = 'London'
ORDER BY S.[detailid]
GO
*/
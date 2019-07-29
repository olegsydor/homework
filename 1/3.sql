/*3. Вивести всі продукти,  для яких немає поставок деталей.
Output columns: productid
Sorting: productid
*/

SELECT [productid]
  FROM [products]
EXCEPT
SELECT [productid]
  FROM [supplies]
  WHERE [quantity] > 0
GO

/*
SELECT [productid] 
  FROM [products]
  WHERE [productid] NOT IN 
  (
  SELECT [productid] FROM [supplies] WHERE [quantity] > 0
  )
GO
*/
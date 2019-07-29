/*6. Вивести комбінації «колір деталі -- місто де зберігається деталь» з видаленням дублікатів.
Output columns: color, city
Sorting: color, city
*/
SELECT DISTINCT D1.[color], D2.[city] FROM [details] AS D1, [details] AS D2 
ORDER BY [color], [city]
GO
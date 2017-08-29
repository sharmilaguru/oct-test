DECLARE @ProductID int 

SELECT
       P.ProductID
	   ,p.Name
	   ,sp.BusinessEntityID
	   ,per.FirstName + ' ' + per.LastName as 'SalesPersonName'
FROM
[Sales].[SalesOrderDetail] sod
INNER JOIN [Sales].[SalesOrderHeader] soh ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN [Production].[Product] P ON sod.ProductID = P.ProductID
INNER JOIN [Sales].SalesPerson sp on  sp.BusinessEntityID = soh.SalesPersonID
INNER JOIN [Person].Person per on per.BusinessEntityID = sp.BusinessEntityID
WHERE p.ProductID = @ProductID OR @ProductID IS NULL
GROUP BY P.ProductID, p.name , sp.BusinessEntityID , per.FirstName + ' ' + per.LastName
order by p.name
SELECT
       P.ProductID
	   ,p.Name
       ,SUM(sod.OrderQty) AS OrderQuantity
       ,SUM(sod.LineTotal) AS SalesAmount
FROM
[Sales].[SalesOrderDetail] sod
INNER JOIN [Sales].[SalesOrderHeader] soh ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN [Production].[Product] P ON sod.ProductID = P.ProductID
GROUP BY P.ProductID, p.name
order by p.name
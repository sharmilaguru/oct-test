select 
e.BusinessEntityID, p.Firstname + ' ' + p.Lastname as 'Employee Name', e.Jobtitle, e.OrganizationNode 
, manager.BusinessEntityID ,  manager.firstname+ ' ' + manager.Lastname as 'Manager Name', manager.Jobtitle 
from [humanresources].employee e
join [person].person p on p.businessentityid = e.businessentityid
join (
	select e.BusinessEntityID, e.jobtitle, p.firstname, p.Lastname , e.OrganizationNode
	from [humanresources].employee e
	join [person].person p on p.businessentityid = e.businessentityid	
	) manager on manager.[OrganizationNode] = e.OrganizationNode.GetAncestor(1)
order by e.businessentityid
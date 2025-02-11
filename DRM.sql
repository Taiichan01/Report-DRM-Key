SELECT count(DISTINCT CustomerID) as total_key, 
	CAST (DATE as date) as Date, 
	'BHD' as service
from SalesLT.Log_BHD_MovieID lbmi 
left join SalesLT.MV_PropertiesShowVN mpsv 
	on mpsv.id = lbmi.MovieID 
WHERE mpsv.isDRM  = 1
group by CAST (DATE as date)
UNION 
SELECT COUNT(DISTINCT CustomerID) as total_key, 
	CAST(date as date) as date, 
	'Fim' as service
from SalesLT.Log_Fimplus_MovieID lfmi 
left join SalesLT.MV_PropertiesShowVN mpsv 
	on mpsv.id = lfmi.MovieID 
WHERE mpsv.isDRM  = 1
group by CAST (DATE as date)
UNION 
SELECT COUNT(DISTINCT lgdl.Mac) as total_key, 
	CAST (lgdl.date as date) as Date , 
	'Phim Goi' as service
from SalesLT.Log_Get_DRM_List lgdl 
left join SalesLT.Customers c 
	on lgdl.customerID = c.customerID
join SalesLT.CustomerService cs 
	on cs.customerID = c.customerID
group by CAST (lgdl.DATE as date)


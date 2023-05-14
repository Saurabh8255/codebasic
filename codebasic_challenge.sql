create database codebasic

use codebasic

--display domestic_visitors data
select * from [dbo].[domestic_visitors]

--display foreign_visitors data
select * from [dbo].[foreign_visitors]


---q1]list down the top 10 districts that have the highest number of domestic visitors overall(2016-2019)(get an overview of districts that are doing well)

alter table [dbo].[domestic_visitors]
alter column visitors int


select top 10 district, sum(visitors) as top_performing_district , district
from [dbo].[domestic_visitors]
group by district
order by top_performing_district desc

----q2]list down top 3 districts basd on compounded annual growth rate of visiors between (2016-2019)
select     district, datepart(year , date) as year , sum(visitors) as total_visitors
from [dbo].[domestic_visitors]
group by datepart(year , date) ,district


----Q4]what are tje peak and low season months for hyderabad based on data from 2016-2019 for hyderbad district?
select month,sum(visitors) as total_visitors
from [dbo].[domestic_visitors]
where district ='Hyderabad'
group by month
order by total_visitors desc


alter table [dbo].[domestic_visitors]
alter column visitors bigint


alter table [dbo].[foreign_visitors]
alter column visitors bigint



-----Q5]show the op & bottom 3 districts with high domestic to foreign tourist ratio?
select  [dbo].[domestic_visitors].district, sum([dbo].[domestic_visitors].visitors) , sum([dbo].[foreign_visitors].visitors), 
sum([dbo].[domestic_visitors].visitors)/nullif(sum([dbo].[foreign_visitors].visitors),0) as ratio
from [dbo].[domestic_visitors]
left join [dbo].[foreign_visitors]
on [dbo].[domestic_visitors].district= [dbo].[foreign_visitors].district
group by [dbo].[domestic_visitors].district , [dbo].[foreign_visitors].district


select  [dbo].[domestic_visitors].district, sum([dbo].[domestic_visitors].visitors) 
----,sum([dbo].[foreign_visitors].visitors)

from [dbo].[domestic_visitors]
 join [dbo].[foreign_visitors]
on [dbo].[domestic_visitors].district= [dbo].[foreign_visitors].district
group by [dbo].[domestic_visitors].district 

select  district, sum(visitors)
from [dbo].[domestic_visitors]
group by district


select   district ,sum(visitors) as total
from [dbo].[domestic_visitors]
group by district

select max(select   district ,sum(visitors) as total
from [dbo].[domestic_visitors]
group by district) from [dbo].[domestic_visitors]


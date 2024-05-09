select Year(startdate)as StartYear
count (*) NumberProject from PROJECT
group by Year(startdate)
order by 2 desc, 1 desc
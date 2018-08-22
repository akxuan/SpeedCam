select yr, Sum(speed*vol)/sum(vol) from 
(select location_id,  EXTRACT(YEAR FROM timestamp)  Yr , avg(speed) speed, count(speed) vol from public.speed_enforcement_status  where timestamp > '2014-1-1' and timestamp < '2018-8-22' 
group by location_id, EXTRACT(YEAR FROM timestamp)) t1
inner join 
(select location_ID from public.speed_enforcement_config_arch where golivedate <'2015-1-1' and   golivedate >'2012-1-1' ) t2 using (location_ID)

group by yr

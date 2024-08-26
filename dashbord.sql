-- Сколько пользователей заходят на сайт
select count(distinct visitor_id)
from sessions

-- Каналы, приводящие на сайт, по дням недели
select count(visitor_id),
to_char(visit_date,'Day'),
source
from sessions s 
group by 2, 3

-- Сколько лидов?
select count(*) as leads_count 
from leads l ;


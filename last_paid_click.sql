INSERT INTO "with t1 as (
    select
        visitor_id,
        max(visit_date) as last_paid_visit
    from sessions
    where medium != 'organic'
    group by visitor_id
)

select
    s.visitor_id,
    s.visit_date,
    s.source as utm_source,
    s.medium as utm_medium,
    s.campaign as utm_campaign,
    l.lead_id,
    l.created_at,
    l.amount,
    l.closing_reason,
    l.status_id
from
    t1
inner join
    sessions as s
    on t1.visitor_id = s.visitor_id and t1.last_paid_visit = s.visit_date
left join
    leads as l
    on s.visitor_id = l.visitor_id
where
    s.medium in (
    'cpc',
	'cpm',
	'cpa',
	'youtube',
	'cpp',
	'tg',
	'social')
order by
    8 desc nulls last,
    2 asc,
    3 asc,
    4 asc,
    5 asc
limit 10" (visitor_id,visit_date,utm_source,utm_medium,utm_campaign,lead_id,created_at,amount,closing_reason,status_id) VALUES
	 ('35060e525ca62de0a0aa93992c7e07799d855f79','2023-06-01 10:40:28','yandex','cpc','prof-frontend','26066151','2023-06-15 12:52:40',237990,'Успешная продажа',142),
	 ('d183fbda6f03b965a1cd1cee0a3f7b81a44b78ec','2023-06-01 14:39:00','yandex','cpc','base-frontend','74450379','2023-06-30 14:36:31',201150,'Успешная продажа',142),
	 ('ca003c89182365dd75262e54772fda03ee923e92','2023-06-01 04:58:00','vk','cpc','freemium-frontend','48838540','2023-06-20 20:49:16',189210,'Успешная продажа',142),
	 ('d31c95902f2d3183e7052c235ad72d82838e98c2','2023-06-01 10:44:00','yandex','cpc','freemium','21579820','2023-06-19 15:28:22',188991,'Успешная продажа',142),
	 ('fd1438246c3b520c8dfa1aed4c73133c8ca10ab4','2023-06-01 14:57:00','yandex','cpc','prof-frontend','23169912','2023-06-14 06:13:44',180306,'Успешная продажа',142),
	 ('b6ddcd9f994bad353f37b0c5f7115b66d07b10c2','2023-06-01 03:41:00','vk','cpc','prof-java','50769366','2023-06-15 11:43:46',178800,'Успешная продажа',142),
	 ('f2db2eb1295e51cf3426e4211172d839e7f93ddc','2023-06-01 19:39:00','yandex','cpc','prof-frontend','25327894','2023-06-11 21:57:08',167625,'Успешная продажа',142),
	 ('bd5ad484a0cf7f80c1522009dd4ee3d825f35a46','2023-06-01 11:34:00','yandex','cpc','base-python','73882489','2023-06-26 08:36:49',160920,'Успешная продажа',142),
	 ('f1dc9c36bd7269ed93e736b29de33e0e7a02e1a3','2023-06-20 15:15:04.7015','telegram','cpp','base-java','20614407','2023-06-26 17:47:47',151192,'Успешная продажа',142),
	 ('36d4c2cfec3dba3a50cfd0d31ace2d4dcb70560c','2023-06-01 16:43:00','yandex','cpc','dod-php','24703215','2023-06-03 14:40:56',150255,'Успешная продажа',142);

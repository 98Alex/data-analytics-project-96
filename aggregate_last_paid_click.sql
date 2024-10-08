INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-01','yandex','cpc','freemium',103,103,25,1654810),
	 ('2023-06-01','yandex','cpc','prof-frontend',78,78,12,1057000),
	 ('2023-06-01','yandex','cpc','prof-python',62,62,7,613196),
	 ('2023-06-01','yandex','cpc','base-python',31,31,7,476021),
	 ('2023-06-01','vk','cpc','prof-python',71,40,5,355564),
	 ('2023-06-01','vk','cpc','freemium-frontend',80,43,5,338083),
	 ('2023-06-01','yandex','cpc','prof-java',49,49,4,284590),
	 ('2023-06-01','yandex','cpc','base-frontend',40,40,3,268515),
	 ('2023-06-01','vk','cpc','prof-java',51,23,2,232726),
	 ('2023-06-01','yandex','cpc','prof-data-analytics',14,14,2,220264);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-30','admitad','cpa','admitad',71,2,2,201150),
	 ('2023-06-01','yandex','cpc','prof-professions-brand',13,13,3,154287),
	 ('2023-06-20','telegram','cpp','base-java',3,1,1,151192),
	 ('2023-06-01','yandex','cpc','dod-php',4,4,1,150255),
	 ('2023-06-01','yandex','cpc','base-professions-retarget',4,4,1,134100),
	 ('2023-06-07','vk','social','hexlet-blog',3,1,1,84000),
	 ('2023-06-13','admitad','cpa','admitad',40,1,1,62000),
	 ('2023-06-01','yandex','cpc','base-java',20,20,1,48000),
	 ('2023-06-20','admitad','cpa','admitad',43,3,1,45410),
	 ('2023-06-01','yandex','cpc','dod-professions',6,6,1,37800);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-01','vk','cpc','base-python',58,36,1,9072),
	 ('2023-06-01','vk','cpc','freemium-python',44,25,1,1560),
	 ('2023-06-01','vk','cpc','prof-data-analytics',49,30,0,0),
	 ('2023-06-01','vk','cpc','freemium-java',42,24,0,0),
	 ('2023-06-01','vk','cpc','prof-frontend',17,7,0,0),
	 ('2023-06-01','vk','cpm','prof-data-analytics',10,6,0,0),
	 ('2023-06-01','yandex','cpc','prof-professions-retarget',10,10,0,0),
	 ('2023-06-01','yandex','cpc','dod-java',4,4,0,0),
	 ('2023-06-01','yandex','cpc','dod-frontend',3,3,0,0),
	 ('2023-06-01','yandex','cpc','dod-python-java',3,3,0,0);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-01','telegram','cpp','prof-python',1,1,0,0),
	 ('2023-06-02','telegram','cpp','prof-frontend',2,1,0,0),
	 ('2023-06-03','vk-senler','cpc','freemium',16,1,0,0),
	 ('2023-06-04','admitad','cpa','admitad',31,1,0,0),
	 ('2023-06-04','telegram','cpp','dod-java',1,1,0,0),
	 ('2023-06-05','vk','cpp','dod-php',5,1,0,0),
	 ('2023-06-06','vk','cpp','dod-php',4,1,0,0),
	 ('2023-06-06','vc','cpp','dod-frontend',1,1,0,0),
	 ('2023-06-06','vk','social','hexlet-blog',1,1,0,0),
	 ('2023-06-06','vk','social','hexlet.io/my',1,1,0,0);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-07','telegram','cpp','dod-java',9,1,0,0),
	 ('2023-06-07','telegram','cpp','prof-java',7,2,0,0),
	 ('2023-06-08','telegram','cpp','prof-python',20,1,0,0),
	 ('2023-06-08','telegram','cpp','dod-frontend',3,1,0,0),
	 ('2023-06-08','telegram','cpp','dod-java',2,1,0,0),
	 ('2023-06-09','vk','cpc','prof-frontend',112,1,0,0),
	 ('2023-06-09','telegram','cpp','prof-java',2,1,0,0),
	 ('2023-06-13','vk','cpc','freemium-frontend',62,1,0,0),
	 ('2023-06-13','vk','cpc','prof-java',47,1,0,0),
	 ('2023-06-14','telegram','social','dod-professions',21,3,0,0);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-14','vc','cpp','dod-frontend',3,2,0,0),
	 ('2023-06-15','vk','cpc','prof-frontend',5,1,0,0),
	 ('2023-06-15','dzen','social','dzen_post',2,1,0,0),
	 ('2023-06-16','vk','cpc','prof-python',13,1,0,0),
	 ('2023-06-16','vk','cpc','prof-java',9,1,0,0),
	 ('2023-06-16','vk','cpc','prof-frontend',8,1,0,0),
	 ('2023-06-16','telegram','social','dod-professions',4,1,0,0),
	 ('2023-06-18','vk','social','dod-professions',4,1,0,0),
	 ('2023-06-20','vk','cpc','freemium-frontend',11,1,0,0),
	 ('2023-06-20','telegram','social','dod-professions',5,1,0,0);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-20','instagram','social','prof-qa-auto',4,1,0,0),
	 ('2023-06-20','vc','cpp','dod-professions',1,1,0,0),
	 ('2023-06-21','telegram','cpp','prof-python',10,1,0,0),
	 ('2023-06-21','telegram','social','dod-professions',2,1,0,0),
	 ('2023-06-22','vk','social','all-courses',1,1,0,0),
	 ('2023-06-23','admitad','cpa','admitad',36,1,0,0),
	 ('2023-06-23','telegram','social','hexlet-blog',36,1,0,0),
	 ('2023-06-23','telegram','cpp','prof-java',18,1,0,0),
	 ('2023-06-24','admitad','cpa','admitad',35,2,0,0),
	 ('2023-06-24','vk','cpc','freemium-python',6,1,0,0);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-24','vk','social','hexlet-blog',1,1,0,0),
	 ('2023-06-26','admitad','cpa','admitad',72,1,0,0),
	 ('2023-06-26','zen','social','all-courses',1,1,0,0),
	 ('2023-06-27','telegram','social','hexlet-blog',23,1,0,0),
	 ('2023-06-27','telegram','cpp','prof-java',2,1,0,0),
	 ('2023-06-28','admitad','cpa','admitad',75,1,0,0),
	 ('2023-06-28','telegram','social','hexlet-blog',13,1,0,0),
	 ('2023-06-28','vk','cpc','freemium-python',8,1,0,0),
	 ('2023-06-29','telegram','cpp','prof-java',12,1,0,0),
	 ('2023-06-29','vk','cpc','prof-frontend',10,1,0,0);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-29','telegram','cpp','prof-python',4,1,0,0),
	 ('2023-06-29','vk-senler','cpc','dod-frontend',1,1,0,0),
	 ('2023-06-30','vk','cpc','freemium-python',12,1,0,0),
	 ('2023-06-30','telegram','cpp','prof-java',8,1,0,0),
	 ('2023-06-30','telegram','cpp','prof-python',7,1,0,0),
	 ('2023-06-30','vk','cpc','prof-frontend',6,1,0,0),
	 ('2023-06-01','admitad','cpa','admitad',66,0,0,NULL),
	 ('2023-06-01','telegram','cpp','base-python',38,0,0,NULL),
	 ('2023-06-01','telegram','cpp','base-java',33,0,0,NULL),
	 ('2023-06-01','tproger','cpc','dod-frontend',11,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-01','vk-senler','cpc','freemium',8,0,0,NULL),
	 ('2023-06-01','zen','social','hexlet-blog',8,0,0,NULL),
	 ('2023-06-01','zen','social','prof-frontend',7,0,0,NULL),
	 ('2023-06-01','telegram','cpp','base-frontend',5,0,0,NULL),
	 ('2023-06-01','zen','social','prof-backend',4,0,0,NULL),
	 ('2023-06-01','google','cpc','frontend',3,0,0,NULL),
	 ('2023-06-01','telegram','cpp','dod-php',3,0,0,NULL),
	 ('2023-06-01','telegram','social','course_completed',3,0,0,NULL),
	 ('2023-06-01','vk','cpp','dod-php',3,0,0,NULL),
	 ('2023-06-01','telegram','cpp','dod-java',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-01','vk','cpp','intensive-python',2,0,0,NULL),
	 ('2023-06-01','Yandex','cpc','03997128',1,0,0,NULL),
	 ('2023-06-01','Yandex','cpm','01097402',1,0,0,NULL),
	 ('2023-06-01','telegram','cpp','intensive-python',1,0,0,NULL),
	 ('2023-06-01','telegram','cpp','prof-php',1,0,0,NULL),
	 ('2023-06-01','telegram','social','mdtrue*studenty-mnogih-onlayn-kursov-p',1,0,0,NULL),
	 ('2023-06-01','twitter','social','devushki_v_it',1,0,0,NULL),
	 ('2023-06-01','twitter','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-01','twitter','social','promo',1,0,0,NULL),
	 ('2023-06-01','twitter.com','social','buffer',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-01','vc','cpp','dod-php',1,0,0,NULL),
	 ('2023-06-01','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-01','vk','social','course_completed',1,0,0,NULL),
	 ('2023-06-01','vk','social','general',1,0,0,NULL),
	 ('2023-06-01','vk','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-01','vk','social','hexlet.io/my',1,0,0,NULL),
	 ('2023-06-01','vk-senler','cpc','base-frontend',1,0,0,NULL),
	 ('2023-06-02','vk','cpc','prof-python',240,0,0,NULL),
	 ('2023-06-02','vk','cpc','prof-java',216,0,0,NULL),
	 ('2023-06-02','vk','cpc','freemium-frontend',207,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-02','vk','cpc','prof-data-analytics',178,0,0,NULL),
	 ('2023-06-02','vk','cpc','freemium-java',163,0,0,NULL),
	 ('2023-06-02','vk','cpc','freemium-python',143,0,0,NULL),
	 ('2023-06-02','vk','cpc','base-python',133,0,0,NULL),
	 ('2023-06-02','vk','cpc','prof-frontend',120,0,0,NULL),
	 ('2023-06-02','tproger','cpc','dod-frontend',55,0,0,NULL),
	 ('2023-06-02','admitad','cpa','admitad',54,0,0,NULL),
	 ('2023-06-02','telegram','cpp','base-java',23,0,0,NULL),
	 ('2023-06-02','vk','cpm','prof-data-analytics',14,0,0,NULL),
	 ('2023-06-02','telegram','cpp','base-python',11,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-02','telegram','cpp','dod-java',10,0,0,NULL),
	 ('2023-06-02','telegram','cpp','dod-php',9,0,0,NULL),
	 ('2023-06-02','vk-senler','cpc','freemium',9,0,0,NULL),
	 ('2023-06-02','zen','social','hexlet-blog',5,0,0,NULL),
	 ('2023-06-02','vk','cpm','prof-frontend',4,0,0,NULL),
	 ('2023-06-02','zen','social','prof-frontend',3,0,0,NULL),
	 ('2023-06-02','zen','social','promo',3,0,0,NULL),
	 ('2023-06-02','twitter','social','devushki_v_it',2,0,0,NULL),
	 ('2023-06-02','vk','cpp','dod-php',2,0,0,NULL),
	 ('2023-06-02','vk','social','hexlet-blog',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-02','botmother','tg','frontend',1,0,0,NULL),
	 ('2023-06-02','facebook','cpm','freemium-en',1,0,0,NULL),
	 ('2023-06-02','partners','cpc','prof-python',1,0,0,NULL),
	 ('2023-06-02','telegram','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-02','telegram','cpp','prof-python',1,0,0,NULL),
	 ('2023-06-02','telegram','social','course_completed',1,0,0,NULL),
	 ('2023-06-02','tg','social','newdirections',1,0,0,NULL),
	 ('2023-06-02','twitter','social','my-to--chto-my-skrollim-kak-programmistu',1,0,0,NULL),
	 ('2023-06-02','vc','cpp','dod-php',1,0,0,NULL),
	 ('2023-06-02','vk','cpc','freemium',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-02','vk','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-02','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-02','vk','social','base-python',1,0,0,NULL),
	 ('2023-06-02','yandex-direct','cpc','34668848',1,0,0,NULL),
	 ('2023-06-02','yandex-direct','cpm','00788899',1,0,0,NULL),
	 ('2023-06-03','vk','cpc','freemium-frontend',211,0,0,NULL),
	 ('2023-06-03','tproger','cpc','dod-frontend',207,0,0,NULL),
	 ('2023-06-03','vk','cpc','prof-python',204,0,0,NULL),
	 ('2023-06-03','vk','cpc','prof-java',198,0,0,NULL),
	 ('2023-06-03','vk','cpc','prof-data-analytics',172,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-03','vk','cpc','freemium-java',148,0,0,NULL),
	 ('2023-06-03','vk','cpc','freemium-python',122,0,0,NULL),
	 ('2023-06-03','vk','cpc','prof-frontend',122,0,0,NULL),
	 ('2023-06-03','vk','cpc','base-python',101,0,0,NULL),
	 ('2023-06-03','admitad','cpa','admitad',43,0,0,NULL),
	 ('2023-06-03','telegram','cpp','base-python',12,0,0,NULL),
	 ('2023-06-03','vk','cpm','prof-data-analytics',12,0,0,NULL),
	 ('2023-06-03','zen','social','promo',9,0,0,NULL),
	 ('2023-06-03','telegram','cpp','base-frontend',6,0,0,NULL),
	 ('2023-06-03','vk','cpm','prof-frontend',3,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-03','vk','cpp','dod-php',3,0,0,NULL),
	 ('2023-06-03','google','cpc','frontend',2,0,0,NULL),
	 ('2023-06-03','telegram','cpp','base-java',2,0,0,NULL),
	 ('2023-06-03','telegram','cpp','prof-frontend',2,0,0,NULL),
	 ('2023-06-03','telegram','social','course_completed',2,0,0,NULL),
	 ('2023-06-03','vk','social','hexlet-blog',2,0,0,NULL),
	 ('2023-06-03','Yandex','cpc','02284027',1,0,0,NULL),
	 ('2023-06-03','Yandex','cpc','59988739',1,0,0,NULL),
	 ('2023-06-03','Yandex','cpm','94599791',1,0,0,NULL),
	 ('2023-06-03','admitad','cpa','442763',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-03','facebook','cpm','freemium-en',1,0,0,NULL),
	 ('2023-06-03','telegram','cpp','dod-java',1,0,0,NULL),
	 ('2023-06-03','telegram','cpp','prof-java',1,0,0,NULL),
	 ('2023-06-03','telegram','cpp','prof-python',1,0,0,NULL),
	 ('2023-06-03','telegram','social','base-java',1,0,0,NULL),
	 ('2023-06-03','twitter','social','course_completed',1,0,0,NULL),
	 ('2023-06-03','vc','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-03','vk','cpm','java',1,0,0,NULL),
	 ('2023-06-03','vk','social','base-frontend',1,0,0,NULL),
	 ('2023-06-03','vk','social','promo',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-03','yandex-direct','cpc','16645437',1,0,0,NULL),
	 ('2023-06-03','zen','social','all-courses',1,0,0,NULL),
	 ('2023-06-04','vk','cpc','freemium-frontend',224,0,0,NULL),
	 ('2023-06-04','vk','cpc','prof-python',213,0,0,NULL),
	 ('2023-06-04','vk','cpc','prof-java',188,0,0,NULL),
	 ('2023-06-04','tproger','cpc','dod-frontend',156,0,0,NULL),
	 ('2023-06-04','vk','cpc','freemium-java',150,0,0,NULL),
	 ('2023-06-04','vk','cpc','base-python',145,0,0,NULL),
	 ('2023-06-04','vk','cpc','prof-data-analytics',132,0,0,NULL),
	 ('2023-06-04','vk','cpc','freemium-python',130,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-04','vk','cpc','prof-frontend',113,0,0,NULL),
	 ('2023-06-04','telegram','cpp','base-python',47,0,0,NULL),
	 ('2023-06-04','vk','cpm','prof-data-analytics',24,0,0,NULL),
	 ('2023-06-04','vk','cpm','prof-frontend',11,0,0,NULL),
	 ('2023-06-04','telegram','cpp','base-frontend',10,0,0,NULL),
	 ('2023-06-04','telegram','cpp','base-java',9,0,0,NULL),
	 ('2023-06-04','vk-senler','cpc','freemium',8,0,0,NULL),
	 ('2023-06-04','vk','social','hexlet-blog',4,0,0,NULL),
	 ('2023-06-04','telegram','cpp','prof-python',3,0,0,NULL),
	 ('2023-06-04','vk','cpp','dod-php',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-04','vk','social','general',2,0,0,NULL),
	 ('2023-06-04','Yandex','cpc','55670133',1,0,0,NULL),
	 ('2023-06-04','admitad','cpc','183258',1,0,0,NULL),
	 ('2023-06-04','dzen','social','dzen_post',1,0,0,NULL),
	 ('2023-06-04','instagram','social','prof-php',1,0,0,NULL),
	 ('2023-06-04','telegram','cpp','intensive-python',1,0,0,NULL),
	 ('2023-06-04','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-04','telegram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-04','telegram','social','mdtruena-hekslete-poyavilsya-esche-odin-no',1,0,0,NULL),
	 ('2023-06-04','telegram','social','special',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-04','twitter','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-04','twitter','social','promo',1,0,0,NULL),
	 ('2023-06-04','twitter.com','social','svezhiy-vzglyad-na-prohozhdenie-proektov-ot',1,0,0,NULL),
	 ('2023-06-04','vk','cpc','php',1,0,0,NULL),
	 ('2023-06-04','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-04','vk','social','course_completed',1,0,0,NULL),
	 ('2023-06-04','vk','social','prof-qa',1,0,0,NULL),
	 ('2023-06-04','zen','social','promo',1,0,0,NULL),
	 ('2023-06-05','vk','cpc','freemium-frontend',192,0,0,NULL),
	 ('2023-06-05','vk','cpc','prof-java',191,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-05','vk','cpc','prof-python',182,0,0,NULL),
	 ('2023-06-05','vk','cpc','prof-data-analytics',154,0,0,NULL),
	 ('2023-06-05','vk','cpc','freemium-java',138,0,0,NULL),
	 ('2023-06-05','vk','cpc','freemium-python',138,0,0,NULL),
	 ('2023-06-05','vk','cpc','base-python',124,0,0,NULL),
	 ('2023-06-05','vk','cpc','prof-frontend',110,0,0,NULL),
	 ('2023-06-05','tproger','cpc','dod-frontend',49,0,0,NULL),
	 ('2023-06-05','admitad','cpa','admitad',38,0,0,NULL),
	 ('2023-06-05','telegram','cpp','base-python',31,0,0,NULL),
	 ('2023-06-05','telegram','cpp','base-frontend',29,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-05','vk','cpm','prof-data-analytics',23,0,0,NULL),
	 ('2023-06-05','telegram','cpp','base-java',19,0,0,NULL),
	 ('2023-06-05','vk-senler','cpc','dod-php',12,0,0,NULL),
	 ('2023-06-05','telegram','cpp','dod-java',5,0,0,NULL),
	 ('2023-06-05','telegram','cpp','prof-java',4,0,0,NULL),
	 ('2023-06-05','telegram','social','hexlet-blog',4,0,0,NULL),
	 ('2023-06-05','vk','social','base-python',4,0,0,NULL),
	 ('2023-06-05','vk-senler','cpc','freemium',4,0,0,NULL),
	 ('2023-06-05','vk','cpm','prof-frontend',3,0,0,NULL),
	 ('2023-06-05','vk','social','base-java',3,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-05','telegram','cpp','prof-python',2,0,0,NULL),
	 ('2023-06-05','vk','social','all-courses',2,0,0,NULL),
	 ('2023-06-05','Yandex','cpc','16951197',1,0,0,NULL),
	 ('2023-06-05','Yandex','cpc','67652027',1,0,0,NULL),
	 ('2023-06-05','facebook','cpc','frontend',1,0,0,NULL),
	 ('2023-06-05','google','cpc','frontend',1,0,0,NULL),
	 ('2023-06-05','instagram','social','prof-data-analyst',1,0,0,NULL),
	 ('2023-06-05','podcast','social','unpack',1,0,0,NULL),
	 ('2023-06-05','telegram','cpm','base',1,0,0,NULL),
	 ('2023-06-05','telegram','cpm','frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-05','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-05','telegram','social','course_completed',1,0,0,NULL),
	 ('2023-06-05','telegram','social','kak_gumanitariyu_popast-v_it',1,0,0,NULL),
	 ('2023-06-05','vc','cpp','dod-php',1,0,0,NULL),
	 ('2023-06-05','vk','cpm','base',1,0,0,NULL),
	 ('2023-06-05','vk','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-05','vk','social','base-frontend',1,0,0,NULL),
	 ('2023-06-05','vk','social','dod-php',1,0,0,NULL),
	 ('2023-06-05','vk','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-05','vk','social','planiruy-uchebu--fokusiruysya-na-protsesse',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-05','vk','social','prof-frontend',1,0,0,NULL),
	 ('2023-06-05','yandex-direct','cpc','08062768',1,0,0,NULL),
	 ('2023-06-05','zen','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-06','vk','cpc','prof-python',185,0,0,NULL),
	 ('2023-06-06','vk','cpc','freemium-frontend',171,0,0,NULL),
	 ('2023-06-06','vk','cpc','prof-java',159,0,0,NULL),
	 ('2023-06-06','vk','cpc','freemium-java',139,0,0,NULL),
	 ('2023-06-06','vk','cpc','prof-data-analytics',135,0,0,NULL),
	 ('2023-06-06','vk','cpc','base-python',121,0,0,NULL),
	 ('2023-06-06','vk','cpc','prof-frontend',111,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-06','vk','cpc','freemium-python',104,0,0,NULL),
	 ('2023-06-06','telegram','cpp','base-frontend',52,0,0,NULL),
	 ('2023-06-06','admitad','cpa','admitad',33,0,0,NULL),
	 ('2023-06-06','telegram','cpp','base-python',25,0,0,NULL),
	 ('2023-06-06','vk-senler','cpc','freemium',17,0,0,NULL),
	 ('2023-06-06','telegram','cpp','base-java',13,0,0,NULL),
	 ('2023-06-06','vk','cpm','prof-data-analytics',13,0,0,NULL),
	 ('2023-06-06','tproger','cpc','dod-frontend',8,0,0,NULL),
	 ('2023-06-06','vk','cpp','base-frontend',5,0,0,NULL),
	 ('2023-06-06','telegram','cpp','dod-java',4,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-06','vk','social','base-java',4,0,0,NULL),
	 ('2023-06-06','telegram','cpp','prof-java',3,0,0,NULL),
	 ('2023-06-06','telegram','cpp','prof-python',3,0,0,NULL),
	 ('2023-06-06','vk','cpc','freemium',3,0,0,NULL),
	 ('2023-06-06','vk','social','general',3,0,0,NULL),
	 ('2023-06-06','vk','social','prof-frontend',3,0,0,NULL),
	 ('2023-06-06','google','cpc','frontend',2,0,0,NULL),
	 ('2023-06-06','telegram','social','course_completed',2,0,0,NULL),
	 ('2023-06-06','admitad','cpc','183258',1,0,0,NULL),
	 ('2023-06-06','instagram','social','all-courses',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-06','slack','social','base_alg',1,0,0,NULL),
	 ('2023-06-06','telegram','cpm','python',1,0,0,NULL),
	 ('2023-06-06','telegram','cpp','base-php',1,0,0,NULL),
	 ('2023-06-06','telegram','cpp','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-06','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-06','twitter','social','course_completed',1,0,0,NULL),
	 ('2023-06-06','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-06','vk','social','base-python',1,0,0,NULL),
	 ('2023-06-06','vk','social','dod-frontend',1,0,0,NULL),
	 ('2023-06-06','vk','social','dod-php',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-06','vk','social','dod-professions',1,0,0,NULL),
	 ('2023-06-06','vk','social','kak-dzhunu-napisat-soprovoditelnoe-pis',1,0,0,NULL),
	 ('2023-06-06','vk','social','prof-rails',1,0,0,NULL),
	 ('2023-06-06','vk-senler','cpc','dod-php',1,0,0,NULL),
	 ('2023-06-06','vk.com','social','na-hekslete-poyavilas-novaya-professiya-v',1,0,0,NULL),
	 ('2023-06-06','yandex-direct','cpc','68583881',1,0,0,NULL),
	 ('2023-06-07','vk','cpc','prof-python',190,0,0,NULL),
	 ('2023-06-07','vk','cpc','freemium-frontend',169,0,0,NULL),
	 ('2023-06-07','vk','cpc','prof-java',166,0,0,NULL),
	 ('2023-06-07','vk','cpc','freemium-java',113,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-07','vk','cpc','freemium-python',111,0,0,NULL),
	 ('2023-06-07','vk','cpc','prof-data-analytics',110,0,0,NULL),
	 ('2023-06-07','vk','cpc','base-python',107,0,0,NULL),
	 ('2023-06-07','vk','cpc','prof-frontend',94,0,0,NULL),
	 ('2023-06-07','admitad','cpa','admitad',51,0,0,NULL),
	 ('2023-06-07','telegram','cpp','base-frontend',37,0,0,NULL),
	 ('2023-06-07','vk-senler','cpc','freemium',17,0,0,NULL),
	 ('2023-06-07','telegram','cpp','base-python',15,0,0,NULL),
	 ('2023-06-07','vk','cpm','prof-data-analytics',12,0,0,NULL),
	 ('2023-06-07','tproger','cpc','dod-frontend',9,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-07','vk','cpp','base-frontend',9,0,0,NULL),
	 ('2023-06-07','vk','social','base-python',7,0,0,NULL),
	 ('2023-06-07','telegram','cpp','base-java',4,0,0,NULL),
	 ('2023-06-07','telegram','cpp','prof-python',2,0,0,NULL),
	 ('2023-06-07','vk','social','base-java',2,0,0,NULL),
	 ('2023-06-07','vk','social','general',2,0,0,NULL),
	 ('2023-06-07','vk','social','prof-python',2,0,0,NULL),
	 ('2023-06-07','botmother','tg','frontend',1,0,0,NULL),
	 ('2023-06-07','facebook','cpc','python',1,0,0,NULL),
	 ('2023-06-07','facebook','social','course_completed',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-07','instagram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-07','instagram','social','taplink',1,0,0,NULL),
	 ('2023-06-07','public','social','open_lectures23',1,0,0,NULL),
	 ('2023-06-07','telegram','cpm','java',1,0,0,NULL),
	 ('2023-06-07','telegram','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-07','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-07','telegram','social','base-python',1,0,0,NULL),
	 ('2023-06-07','telegram','social','promo',1,0,0,NULL),
	 ('2023-06-07','telegram','social',NULL,1,0,0,NULL),
	 ('2023-06-07','vk','cpc','frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-07','vk','cpm','prof-frontend',1,0,0,NULL),
	 ('2023-06-07','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-07','vk','social','prof-frontend',1,0,0,NULL),
	 ('2023-06-07','vk-senler','cpc','dod-frontend',1,0,0,NULL),
	 ('2023-06-07','yandex-direct','cpc','51752512',1,0,0,NULL),
	 ('2023-06-07','zen','social','prof-frontend',1,0,0,NULL),
	 ('2023-06-08','vk','cpc','freemium-frontend',193,0,0,NULL),
	 ('2023-06-08','vk','cpc','prof-python',188,0,0,NULL),
	 ('2023-06-08','vk','cpc','prof-java',172,0,0,NULL),
	 ('2023-06-08','vk','cpc','prof-data-analytics',135,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-08','vk','cpc','freemium-java',124,0,0,NULL),
	 ('2023-06-08','vk','cpc','prof-frontend',117,0,0,NULL),
	 ('2023-06-08','vk','cpc','base-python',111,0,0,NULL),
	 ('2023-06-08','vk','cpc','freemium-python',108,0,0,NULL),
	 ('2023-06-08','admitad','cpa','admitad',48,0,0,NULL),
	 ('2023-06-08','timepad','cpp','base-frontend',44,0,0,NULL),
	 ('2023-06-08','telegram','cpp','base-frontend',21,0,0,NULL),
	 ('2023-06-08','vk','cpm','prof-data-analytics',17,0,0,NULL),
	 ('2023-06-08','vk','cpp','base-frontend',15,0,0,NULL),
	 ('2023-06-08','vk-senler','cpc','freemium',12,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-08','tproger','cpc','dod-frontend',11,0,0,NULL),
	 ('2023-06-08','telegram','cpp','base-python',7,0,0,NULL),
	 ('2023-06-08','telegram','cpp','prof-java',3,0,0,NULL),
	 ('2023-06-08','vk','cpm','prof-frontend',3,0,0,NULL),
	 ('2023-06-08','vk','social','general',3,0,0,NULL),
	 ('2023-06-08','vk','social','hexlet-blog',3,0,0,NULL),
	 ('2023-06-08','facebook.com','social','buffer',1,0,0,NULL),
	 ('2023-06-08','telegram','cpp','base-java',1,0,0,NULL),
	 ('2023-06-08','telegram','cpp','dod-php',1,0,0,NULL),
	 ('2023-06-08','telegram','cpp','prof-frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-08','telegram','social','course_completed',1,0,0,NULL),
	 ('2023-06-08','telegram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-08','telegram','social','mdtruehaskell--funktsionalnyy-yazyk',1,0,0,NULL),
	 ('2023-06-08','vk','cpc','php',1,0,0,NULL),
	 ('2023-06-08','vk','cpm','php',1,0,0,NULL),
	 ('2023-06-08','vk','cpp','dod-career',1,0,0,NULL),
	 ('2023-06-08','vk','cpp','intensive-python',1,0,0,NULL),
	 ('2023-06-08','vk','social','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-08','vk-senler','cpc','dod-frontend',1,0,0,NULL),
	 ('2023-06-08','vk-senler','cpc','dod-professions',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-08','zen','social','all-courses',1,0,0,NULL),
	 ('2023-06-08','zen','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-08','zen','social','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-09','vk','cpc','prof-python',182,0,0,NULL),
	 ('2023-06-09','vk','cpc','freemium-frontend',181,0,0,NULL),
	 ('2023-06-09','vk','cpc','prof-java',161,0,0,NULL),
	 ('2023-06-09','vk','cpc','prof-data-analytics',160,0,0,NULL),
	 ('2023-06-09','vk','cpc','freemium-python',120,0,0,NULL),
	 ('2023-06-09','vk','cpc','freemium-java',108,0,0,NULL),
	 ('2023-06-09','vk','cpc','base-python',105,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-09','admitad','cpa','admitad',46,0,0,NULL),
	 ('2023-06-09','timepad','cpp','base-frontend',32,0,0,NULL),
	 ('2023-06-09','telegram','cpp','base-frontend',15,0,0,NULL),
	 ('2023-06-09','vk','cpm','prof-data-analytics',11,0,0,NULL),
	 ('2023-06-09','vk-senler','cpc','freemium',9,0,0,NULL),
	 ('2023-06-09','tproger','cpc','dod-frontend',7,0,0,NULL),
	 ('2023-06-09','vk','cpp','base-frontend',7,0,0,NULL),
	 ('2023-06-09','vk','cpm','prof-frontend',5,0,0,NULL),
	 ('2023-06-09','telegram','cpp','dod-frontend',3,0,0,NULL),
	 ('2023-06-09','telegram','cpp','prof-python',3,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-09','telegram','cpp','base-java',2,0,0,NULL),
	 ('2023-06-09','telegram','cpp','prof-frontend',2,0,0,NULL),
	 ('2023-06-09','vk','social','all-courses',2,0,0,NULL),
	 ('2023-06-09','vk','social','base-frontend',2,0,0,NULL),
	 ('2023-06-09','Yandex','cpc','42790821',1,0,0,NULL),
	 ('2023-06-09','Yandex','cpc','87255026',1,0,0,NULL),
	 ('2023-06-09','mytarget','cpc','freemium',1,0,0,NULL),
	 ('2023-06-09','rutube','social','all-courses',1,0,0,NULL),
	 ('2023-06-09','social','youtube','chistie-funktsii',1,0,0,NULL),
	 ('2023-06-09','telegram','social','hexlet-blog',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-09','telegram','social','kak-gumanitariy-stal-bekend-razrabotchiko',1,0,0,NULL),
	 ('2023-06-09','telegram.me','social','klassicheskaya-zadachka-fizzbuzz-na-hekslet',1,0,0,NULL),
	 ('2023-06-09','telegram.me','social','na-hekslet-poyavilis-novye-ispytaniya-v-k',1,0,0,NULL),
	 ('2023-06-09','twitter','social','devushki_v_it',1,0,0,NULL),
	 ('2023-06-09','vk','social','base-python',1,0,0,NULL),
	 ('2023-06-09','vk','social','dod-frontend',1,0,0,NULL),
	 ('2023-06-09','vk','social','dod-php',1,0,0,NULL),
	 ('2023-06-10','vk','cpc','prof-python',163,0,0,NULL),
	 ('2023-06-10','vk','cpc','freemium-frontend',155,0,0,NULL),
	 ('2023-06-10','vk','cpc','prof-java',150,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-10','vk','cpc','freemium-python',143,0,0,NULL),
	 ('2023-06-10','vk','cpc','prof-data-analytics',130,0,0,NULL),
	 ('2023-06-10','vk','cpc','base-python',119,0,0,NULL),
	 ('2023-06-10','vk','cpc','freemium-java',107,0,0,NULL),
	 ('2023-06-10','vk','cpc','prof-frontend',96,0,0,NULL),
	 ('2023-06-10','admitad','cpa','admitad',26,0,0,NULL),
	 ('2023-06-10','vk-senler','cpc','freemium',13,0,0,NULL),
	 ('2023-06-10','vk','cpm','prof-data-analytics',12,0,0,NULL),
	 ('2023-06-10','telegram','cpp','base-frontend',8,0,0,NULL),
	 ('2023-06-10','timepad','cpp','base-frontend',6,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-10','vk','cpm','prof-frontend',5,0,0,NULL),
	 ('2023-06-10','google','cpc','frontend',2,0,0,NULL),
	 ('2023-06-10','vk','cpm','base',2,0,0,NULL),
	 ('2023-06-10','vk','social','all-courses',2,0,0,NULL),
	 ('2023-06-10','facebook','social','course_completed',1,0,0,NULL),
	 ('2023-06-10','telegram','cpp','base-java',1,0,0,NULL),
	 ('2023-06-10','telegram','cpp','base-python',1,0,0,NULL),
	 ('2023-06-10','telegram','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-10','telegram','cpp','intensive-python',1,0,0,NULL),
	 ('2023-06-10','telegram','cpp','prof-python',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-10','telegram','social','glavnye-instrumenty--servisy-i-podhody',1,0,0,NULL),
	 ('2023-06-10','telegram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-10','telegram','social','typescript',1,0,0,NULL),
	 ('2023-06-10','twitter','social','promo',1,0,0,NULL),
	 ('2023-06-10','vk','cpc','freemium',1,0,0,NULL),
	 ('2023-06-10','vk','cpc','frontend',1,0,0,NULL),
	 ('2023-06-10','vk','cpc','yaintern',1,0,0,NULL),
	 ('2023-06-10','vk','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-10','vk','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-10','zen','social','hexlet',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-11','vk','cpc','freemium-frontend',211,0,0,NULL),
	 ('2023-06-11','vk','cpc','prof-python',186,0,0,NULL),
	 ('2023-06-11','vk','cpc','prof-java',147,0,0,NULL),
	 ('2023-06-11','vk','cpc','prof-data-analytics',141,0,0,NULL),
	 ('2023-06-11','vk','cpc','freemium-java',126,0,0,NULL),
	 ('2023-06-11','vk','cpc','prof-frontend',123,0,0,NULL),
	 ('2023-06-11','vk','cpc','base-python',115,0,0,NULL),
	 ('2023-06-11','vk','cpc','freemium-python',112,0,0,NULL),
	 ('2023-06-11','admitad','cpa','admitad',41,0,0,NULL),
	 ('2023-06-11','vk','cpm','prof-data-analytics',14,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-11','vk-senler','cpc','freemium',10,0,0,NULL),
	 ('2023-06-11','telegram','cpp','base-frontend',6,0,0,NULL),
	 ('2023-06-11','vk','cpp','dod-frontend',6,0,0,NULL),
	 ('2023-06-11','vk','cpm','prof-frontend',4,0,0,NULL),
	 ('2023-06-11','vk','social','all-courses',2,0,0,NULL),
	 ('2023-06-11','vk','social','base-python',2,0,0,NULL),
	 ('2023-06-11','vk','social','general',2,0,0,NULL),
	 ('2023-06-11','vk','social','hexlet-blog',2,0,0,NULL),
	 ('2023-06-11','google','cpc','freemium',1,0,0,NULL),
	 ('2023-06-11','google','cpc','frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-11','telegram','cpm','base_python',1,0,0,NULL),
	 ('2023-06-11','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-11','timepad','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-11','vk','cpc','java',1,0,0,NULL),
	 ('2023-06-11','vk','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-12','vk','cpc','prof-python',196,0,0,NULL),
	 ('2023-06-12','vk','cpc','freemium-frontend',184,0,0,NULL),
	 ('2023-06-12','vk','cpc','prof-java',170,0,0,NULL),
	 ('2023-06-12','vk','cpc','prof-data-analytics',161,0,0,NULL),
	 ('2023-06-12','vk','cpc','freemium-java',132,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-12','vk','cpc','base-python',123,0,0,NULL),
	 ('2023-06-12','vk','cpc','freemium-python',121,0,0,NULL),
	 ('2023-06-12','vk','cpc','prof-frontend',113,0,0,NULL),
	 ('2023-06-12','admitad','cpa','admitad',33,0,0,NULL),
	 ('2023-06-12','vk-senler','cpc','freemium',24,0,0,NULL),
	 ('2023-06-12','telegram','cpp','base-frontend',18,0,0,NULL),
	 ('2023-06-12','vk','cpm','prof-data-analytics',14,0,0,NULL),
	 ('2023-06-12','vk','cpm','prof-frontend',6,0,0,NULL),
	 ('2023-06-12','timepad','cpp','base-frontend',4,0,0,NULL),
	 ('2023-06-12','vk','cpp','base-frontend',4,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-12','telegram','cpp','base-python',3,0,0,NULL),
	 ('2023-06-12','telegram','cpp','dod-frontend',3,0,0,NULL),
	 ('2023-06-12','vk','social','prof-rails',3,0,0,NULL),
	 ('2023-06-12','telegram','cpp','base-java',2,0,0,NULL),
	 ('2023-06-12','vk','cpp','dod-frontend',2,0,0,NULL),
	 ('2023-06-12','vk','social','hexlet-blog',2,0,0,NULL),
	 ('2023-06-12','Yandex','cpm','25530592',1,0,0,NULL),
	 ('2023-06-12','facebook','social','how-to-sleep',1,0,0,NULL),
	 ('2023-06-12','facebook.com','social','mozhno-li-ustroitsya-na-rabotu-posle-heks',1,0,0,NULL),
	 ('2023-06-12','google','cpc','freemium',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-12','instagram','social','base-java',1,0,0,NULL),
	 ('2023-06-12','telegram','social','promo',1,0,0,NULL),
	 ('2023-06-12','tg','social','codecamp',1,0,0,NULL),
	 ('2023-06-12','twitter','social','devushki_v_it',1,0,0,NULL),
	 ('2023-06-12','vk','cpm','base_python',1,0,0,NULL),
	 ('2023-06-12','vk','cpp','intensive-python',1,0,0,NULL),
	 ('2023-06-12','vk','social','base-java',1,0,0,NULL),
	 ('2023-06-12','vk','social','base-python',1,0,0,NULL),
	 ('2023-06-12','vk','social','general',1,0,0,NULL),
	 ('2023-06-12','vk','social','prof-python',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-12','vk','social','promo',1,0,0,NULL),
	 ('2023-06-12','yandex-direct','cpc','96566756',1,0,0,NULL),
	 ('2023-06-13','yandex','cpc','freemium',138,0,0,NULL),
	 ('2023-06-13','yandex','cpc','prof-frontend',105,0,0,NULL),
	 ('2023-06-13','yandex','cpc','prof-python',104,0,0,NULL),
	 ('2023-06-13','yandex','cpc','prof-java',83,0,0,NULL),
	 ('2023-06-13','vk','cpc','prof-python',66,0,0,NULL),
	 ('2023-06-13','vk','cpc','freemium-java',57,0,0,NULL),
	 ('2023-06-13','vk','cpc','freemium-python',52,0,0,NULL),
	 ('2023-06-13','vk','cpc','prof-data-analytics',49,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-13','vk','cpc','base-python',41,0,0,NULL),
	 ('2023-06-13','yandex','cpc','base-java',41,0,0,NULL),
	 ('2023-06-13','vk','cpc','prof-frontend',37,0,0,NULL),
	 ('2023-06-13','yandex','cpc','base-python',35,0,0,NULL),
	 ('2023-06-13','yandex','cpc','prof-professions-brand',33,0,0,NULL),
	 ('2023-06-13','yandex','cpc','base-frontend',29,0,0,NULL),
	 ('2023-06-13','telegram','cpp','base-frontend',21,0,0,NULL),
	 ('2023-06-13','yandex','cpc','prof-professions-retarget',18,0,0,NULL),
	 ('2023-06-13','yandex','cpc','prof-data-analytics',17,0,0,NULL),
	 ('2023-06-13','telegram','cpp','prof-python',13,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-13','vk-senler','cpc','freemium',12,0,0,NULL),
	 ('2023-06-13','yandex','cpc','dod-professions',12,0,0,NULL),
	 ('2023-06-13','yandex','cpc','dod-frontend',10,0,0,NULL),
	 ('2023-06-13','yandex','cpc','dod-python-java',9,0,0,NULL),
	 ('2023-06-13','telegram','cpp','prof-java',8,0,0,NULL),
	 ('2023-06-13','yandex','cpc','base-professions-retarget',5,0,0,NULL),
	 ('2023-06-13','vk','cpm','prof-data-analytics',4,0,0,NULL),
	 ('2023-06-13','yandex','cpc','dod-java',4,0,0,NULL),
	 ('2023-06-13','telegram','cpp','prof-frontend',3,0,0,NULL),
	 ('2023-06-13','timepad','cpp','base-frontend',3,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-13','yandex','cpc','dod-php',3,0,0,NULL),
	 ('2023-06-13','vk','cpp','dod-frontend',2,0,0,NULL),
	 ('2023-06-13','vk','social','base-frontend',2,0,0,NULL),
	 ('2023-06-13','vk','social','base-python',2,0,0,NULL),
	 ('2023-06-13','vk','social','hexlet-blog',2,0,0,NULL),
	 ('2023-06-13','yandex','cpc','dod-qa',2,0,0,NULL),
	 ('2023-06-13','Yandex','cpc','80100720',1,0,0,NULL),
	 ('2023-06-13','facebook','cpc','python',1,0,0,NULL),
	 ('2023-06-13','facebook','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-13','facebook','social','my-sozdali-kurs-osnovy-redis-pro-rabot',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-13','telegram','cpm','base_java',1,0,0,NULL),
	 ('2023-06-13','telegram','cpp','base-java',1,0,0,NULL),
	 ('2023-06-13','telegram','cpp','base-python',1,0,0,NULL),
	 ('2023-06-13','telegram','cpp','dod-php',1,0,0,NULL),
	 ('2023-06-13','telegram','social','course_completed',1,0,0,NULL),
	 ('2023-06-13','vc','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-13','vc','cpp','dod-professions',1,0,0,NULL),
	 ('2023-06-13','vk','cpc','base',1,0,0,NULL),
	 ('2023-06-13','vk','cpc','dod-professions',1,0,0,NULL),
	 ('2023-06-13','vk','cpm','prof-frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-13','vk','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-13','vk','cpp','dod-php',1,0,0,NULL),
	 ('2023-06-13','vk','cpp','intensive-python',1,0,0,NULL),
	 ('2023-06-13','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-13','vk','social','english-soft',1,0,0,NULL),
	 ('2023-06-13','vk','social','general',1,0,0,NULL),
	 ('2023-06-13','vk','social','hexlet.io/my',1,0,0,NULL),
	 ('2023-06-13','vk','social','prof-rails',1,0,0,NULL),
	 ('2023-06-13','zen','social','all-courses',1,0,0,NULL),
	 ('2023-06-14','yandex','cpc','freemium',215,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-14','yandex','cpc','prof-python',170,0,0,NULL),
	 ('2023-06-14','yandex','cpc','prof-frontend',165,0,0,NULL),
	 ('2023-06-14','yandex','cpc','prof-java',163,0,0,NULL),
	 ('2023-06-14','yandex','cpc','base-java',57,0,0,NULL),
	 ('2023-06-14','yandex','cpc','base-python',53,0,0,NULL),
	 ('2023-06-14','yandex','cpc','prof-professions-brand',49,0,0,NULL),
	 ('2023-06-14','admitad','cpa','admitad',44,0,0,NULL),
	 ('2023-06-14','timepad','cpp','base-frontend',43,0,0,NULL),
	 ('2023-06-14','yandex','cpc','base-frontend',42,0,0,NULL),
	 ('2023-06-14','yandex','cpc','prof-data-analytics',32,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-14','yandex','cpc','prof-professions-retarget',27,0,0,NULL),
	 ('2023-06-14','vk-senler','cpc','freemium',15,0,0,NULL),
	 ('2023-06-14','yandex','cpc','dod-frontend',15,0,0,NULL),
	 ('2023-06-14','telegram','cpp','prof-python',13,0,0,NULL),
	 ('2023-06-14','telegram','cpp','base-frontend',12,0,0,NULL),
	 ('2023-06-14','yandex','cpc','dod-java',12,0,0,NULL),
	 ('2023-06-14','yandex','cpc','dod-professions',12,0,0,NULL),
	 ('2023-06-14','vk','cpc','prof-data-analytics',10,0,0,NULL),
	 ('2023-06-14','vk','cpc','freemium-frontend',8,0,0,NULL),
	 ('2023-06-14','vk','cpc','freemium-python',8,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-14','yandex','cpc','base-professions-retarget',8,0,0,NULL),
	 ('2023-06-14','yandex','cpc','dod-php',8,0,0,NULL),
	 ('2023-06-14','vk','cpp','dod-frontend',7,0,0,NULL),
	 ('2023-06-14','yandex','cpc','dod-python-java',7,0,0,NULL),
	 ('2023-06-14','yandex','cpc','dod-qa',7,0,0,NULL),
	 ('2023-06-14','vk','cpc','prof-frontend',5,0,0,NULL),
	 ('2023-06-14','vk','cpc','prof-java',5,0,0,NULL),
	 ('2023-06-14','vk','cpc','prof-python',5,0,0,NULL),
	 ('2023-06-14','vk','social','dod-professions',4,0,0,NULL),
	 ('2023-06-14','telegram','cpp','base-python',3,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-14','telegram','cpp','prof-java',3,0,0,NULL),
	 ('2023-06-14','vk','social','base-python',3,0,0,NULL),
	 ('2023-06-14','vk','social','hexlet-blog',2,0,0,NULL),
	 ('2023-06-14','vk','social','prof-python',2,0,0,NULL),
	 ('2023-06-14','vk-senler','cpc','dod-frontend',2,0,0,NULL),
	 ('2023-06-14','facebook','cpc','freemium.ua-by',1,0,0,NULL),
	 ('2023-06-14','mytarget','cpc','freemium',1,0,0,NULL),
	 ('2023-06-14','telegram','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-14','telegram','cpp','dod-php',1,0,0,NULL),
	 ('2023-06-14','telegram','cpp','prof-frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-14','telegram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-14','telegram','social','mdtruehaskell--funktsionalnyy-yazyk',1,0,0,NULL),
	 ('2023-06-14','telegram','social','promo',1,0,0,NULL),
	 ('2023-06-14','twitter','social','51-letniy-student-heksleta-dmitriy-rassk',1,0,0,NULL),
	 ('2023-06-14','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-14','vk','social','dod-frontend',1,0,0,NULL),
	 ('2023-06-14','vk','social','general',1,0,0,NULL),
	 ('2023-06-14','vk-senler','cpc','dod-professions',1,0,0,NULL),
	 ('2023-06-14','yandex-direct','cpc','19183657',1,0,0,NULL),
	 ('2023-06-14','zen','social','prof-frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-15','yandex','cpc','freemium',238,0,0,NULL),
	 ('2023-06-15','yandex','cpc','prof-frontend',164,0,0,NULL),
	 ('2023-06-15','yandex','cpc','prof-python',156,0,0,NULL),
	 ('2023-06-15','yandex','cpc','prof-java',130,0,0,NULL),
	 ('2023-06-15','yandex','cpc','base-java',61,0,0,NULL),
	 ('2023-06-15','yandex','cpc','base-python',49,0,0,NULL),
	 ('2023-06-15','yandex','cpc','prof-professions-brand',49,0,0,NULL),
	 ('2023-06-15','admitad','cpa','admitad',48,0,0,NULL),
	 ('2023-06-15','yandex','cpc','base-frontend',38,0,0,NULL),
	 ('2023-06-15','yandex','cpc','prof-data-analytics',28,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-15','yandex','cpc','prof-professions-retarget',27,0,0,NULL),
	 ('2023-06-15','yandex','cpc','dod-frontend',20,0,0,NULL),
	 ('2023-06-15','yandex','cpc','dod-professions',17,0,0,NULL),
	 ('2023-06-15','vk-senler','cpc','freemium',14,0,0,NULL),
	 ('2023-06-15','telegram','cpp','base-frontend',12,0,0,NULL),
	 ('2023-06-15','yandex','cpc','dod-python-java',10,0,0,NULL),
	 ('2023-06-15','vk','cpc','freemium-python',9,0,0,NULL),
	 ('2023-06-15','vk','cpc','prof-data-analytics',9,0,0,NULL),
	 ('2023-06-15','yandex','cpc','base-professions-retarget',8,0,0,NULL),
	 ('2023-06-15','yandex','cpc','dod-java',8,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-15','vk','cpc','freemium-frontend',7,0,0,NULL),
	 ('2023-06-15','yandex','cpc','dod-qa',7,0,0,NULL),
	 ('2023-06-15','telegram','cpp','prof-python',6,0,0,NULL),
	 ('2023-06-15','vk','cpc','freemium-java',6,0,0,NULL),
	 ('2023-06-15','vk','cpc','prof-java',6,0,0,NULL),
	 ('2023-06-15','yandex','cpc','dod-php',6,0,0,NULL),
	 ('2023-06-15','telegram','cpp','prof-java',5,0,0,NULL),
	 ('2023-06-15','telegram','social','dod-professions',3,0,0,NULL),
	 ('2023-06-15','vk','cpc','prof-python',3,0,0,NULL),
	 ('2023-06-15','vk','cpp','dod-frontend',3,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-15','vk','social','all-courses',3,0,0,NULL),
	 ('2023-06-15','vk','social','hexlet-blog',3,0,0,NULL),
	 ('2023-06-15','telegram','cpp','base-java',2,0,0,NULL),
	 ('2023-06-15','telegram','social','course_completed',2,0,0,NULL),
	 ('2023-06-15','vk','cpp','base-frontend',2,0,0,NULL),
	 ('2023-06-15','vk-senler','cpc','dod-frontend',2,0,0,NULL),
	 ('2023-06-15','dzen','social','dzen-post',1,0,0,NULL),
	 ('2023-06-15','facebook','cpc','python',1,0,0,NULL),
	 ('2023-06-15','instagram','social','all-courses',1,0,0,NULL),
	 ('2023-06-15','podcast','social','all-courses',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-15','slack','social','hexlet',1,0,0,NULL),
	 ('2023-06-15','telegram','cpm','java',1,0,0,NULL),
	 ('2023-06-15','telegram','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-15','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-15','telegram','social','prof-qa',1,0,0,NULL),
	 ('2023-06-15','telegram','social','webinars',1,0,0,NULL),
	 ('2023-06-15','timepad','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-15','twitter','social','grokaem_algoritmy',1,0,0,NULL),
	 ('2023-06-15','twitter','social','oop-i-arhitektura-koda-kirill-mokevni',1,0,0,NULL),
	 ('2023-06-15','twitter','social','podrobno-rasskazyvaem--pochemu-pleysholde',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-15','twitter.com','social','istorii-uspeha-nashih-uchenikov-i-vypuskni',1,0,0,NULL),
	 ('2023-06-15','vc','cpp','dod-professions',1,0,0,NULL),
	 ('2023-06-15','vk','cpc','yaintern',1,0,0,NULL),
	 ('2023-06-15','vk','social','base-python',1,0,0,NULL),
	 ('2023-06-15','vk','social','dod-professions',1,0,0,NULL),
	 ('2023-06-15','vkontakte','social','button-vk',1,0,0,NULL),
	 ('2023-06-15','zen','social','all-courses',1,0,0,NULL),
	 ('2023-06-16','yandex','cpc','freemium',233,0,0,NULL),
	 ('2023-06-16','yandex','cpc','prof-python',168,0,0,NULL),
	 ('2023-06-16','yandex','cpc','prof-frontend',137,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-16','yandex','cpc','prof-java',112,0,0,NULL),
	 ('2023-06-16','yandex','cpc','base-java',59,0,0,NULL),
	 ('2023-06-16','yandex','cpc','base-python',51,0,0,NULL),
	 ('2023-06-16','yandex','cpc','prof-professions-brand',48,0,0,NULL),
	 ('2023-06-16','yandex','cpc','base-frontend',44,0,0,NULL),
	 ('2023-06-16','yandex','cpc','prof-data-analytics',39,0,0,NULL),
	 ('2023-06-16','admitad','cpa','admitad',37,0,0,NULL),
	 ('2023-06-16','yandex','cpc','prof-professions-retarget',35,0,0,NULL),
	 ('2023-06-16','yandex','cpc','dod-frontend',22,0,0,NULL),
	 ('2023-06-16','yandex','cpc','dod-professions',15,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-16','vk','cpc','prof-data-analytics',13,0,0,NULL),
	 ('2023-06-16','yandex','cpc','dod-java',12,0,0,NULL),
	 ('2023-06-16','vk-senler','cpc','freemium',11,0,0,NULL),
	 ('2023-06-16','yandex','cpc','base-professions-retarget',10,0,0,NULL),
	 ('2023-06-16','telegram','cpp','base-frontend',9,0,0,NULL),
	 ('2023-06-16','vk','cpc','freemium-java',7,0,0,NULL),
	 ('2023-06-16','yandex','cpc','dod-php',6,0,0,NULL),
	 ('2023-06-16','telegram','cpp','prof-python',5,0,0,NULL),
	 ('2023-06-16','vk','cpc','freemium-python',5,0,0,NULL),
	 ('2023-06-16','yandex','cpc','dod-python-java',5,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-16','yandex','cpc','dod-qa',5,0,0,NULL),
	 ('2023-06-16','vk','cpc','freemium-frontend',4,0,0,NULL),
	 ('2023-06-16','telegram','cpp','prof-java',3,0,0,NULL),
	 ('2023-06-16','vk','social','base-python',3,0,0,NULL),
	 ('2023-06-16','telegram','cpp','dod-java',2,0,0,NULL),
	 ('2023-06-16','vk','cpc','php',2,0,0,NULL),
	 ('2023-06-16','vk','social','dod-professions',2,0,0,NULL),
	 ('2023-06-16','vk','social','prof-python',2,0,0,NULL),
	 ('2023-06-16','admitad','cpa','442763',1,0,0,NULL),
	 ('2023-06-16','admitad','cpc','183258',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-16','instagram','social','base-python',1,0,0,NULL),
	 ('2023-06-16','instagram','social','promo',1,0,0,NULL),
	 ('2023-06-16','slack','social','hexlet',1,0,0,NULL),
	 ('2023-06-16','telegram','cpm','java',1,0,0,NULL),
	 ('2023-06-16','telegram','cpp','base-java',1,0,0,NULL),
	 ('2023-06-16','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-16','telegram','social','course_completed',1,0,0,NULL),
	 ('2023-06-16','telegram Этот курс побеждён! 💪💪💪 Было круто! 🚀','social','course_completed',1,0,0,NULL),
	 ('2023-06-16','timepad','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-16','twitter','social','all-courses',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-16','twitter','social','v-etoy-statie-my-dadim-neskolko-sovetov',1,0,0,NULL),
	 ('2023-06-16','twitter','social','v-kontse-yanvarya-praktika-heksleta-ne-rabo',1,0,0,NULL),
	 ('2023-06-16','vk','cpc','prof-php',1,0,0,NULL),
	 ('2023-06-16','vk','cpc','yaintern',1,0,0,NULL),
	 ('2023-06-16','vk','cpm','base',1,0,0,NULL),
	 ('2023-06-16','vk','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-16','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-16','vk','social','base-frontend',1,0,0,NULL),
	 ('2023-06-16','vk','social','dod-frontend',1,0,0,NULL),
	 ('2023-06-16','vk','social','general',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-17','yandex','cpc','freemium',200,0,0,NULL),
	 ('2023-06-17','yandex','cpc','prof-python',174,0,0,NULL),
	 ('2023-06-17','yandex','cpc','prof-frontend',132,0,0,NULL),
	 ('2023-06-17','yandex','cpc','prof-java',131,0,0,NULL),
	 ('2023-06-17','yandex','cpc','base-python',63,0,0,NULL),
	 ('2023-06-17','yandex','cpc','prof-professions-brand',58,0,0,NULL),
	 ('2023-06-17','yandex','cpc','base-java',43,0,0,NULL),
	 ('2023-06-17','yandex','cpc','base-frontend',39,0,0,NULL),
	 ('2023-06-17','admitad','cpa','admitad',38,0,0,NULL),
	 ('2023-06-17','yandex','cpc','prof-data-analytics',34,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-17','yandex','cpc','dod-professions',25,0,0,NULL),
	 ('2023-06-17','yandex','cpc','prof-professions-retarget',22,0,0,NULL),
	 ('2023-06-17','vk-senler','cpc','freemium',15,0,0,NULL),
	 ('2023-06-17','yandex','cpc','dod-frontend',13,0,0,NULL),
	 ('2023-06-17','yandex','cpc','dod-php',11,0,0,NULL),
	 ('2023-06-17','yandex','cpc','dod-qa',11,0,0,NULL),
	 ('2023-06-17','yandex','cpc','dod-python-java',9,0,0,NULL),
	 ('2023-06-17','telegram','cpp','base-frontend',8,0,0,NULL),
	 ('2023-06-17','vk','cpc','prof-python',8,0,0,NULL),
	 ('2023-06-17','yandex','cpc','base-professions-retarget',8,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-17','vk','cpc','prof-frontend',7,0,0,NULL),
	 ('2023-06-17','vk','cpc','prof-java',6,0,0,NULL),
	 ('2023-06-17','yandex','cpc','dod-java',6,0,0,NULL),
	 ('2023-06-17','vk','cpc','freemium-java',5,0,0,NULL),
	 ('2023-06-17','vk','cpc','prof-data-analytics',5,0,0,NULL),
	 ('2023-06-17','vk','social','dod-professions',5,0,0,NULL),
	 ('2023-06-17','vk','cpc','freemium-frontend',4,0,0,NULL),
	 ('2023-06-17','vk','cpc','freemium-python',4,0,0,NULL),
	 ('2023-06-17','telegram','cpp','prof-frontend',3,0,0,NULL),
	 ('2023-06-17','telegram','cpp','base-java',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-17','vk','cpc','frontend',2,0,0,NULL),
	 ('2023-06-17','vk','social','general',2,0,0,NULL),
	 ('2023-06-17','Yandex','cpc','06892634',1,0,0,NULL),
	 ('2023-06-17','Yandex','cpc','93234055',1,0,0,NULL),
	 ('2023-06-17','facebook','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-17','instagram','social','prof-data-analyst',1,0,0,NULL),
	 ('2023-06-17','telegram','cpm','base_python',1,0,0,NULL),
	 ('2023-06-17','telegram','cpm','frontend',1,0,0,NULL),
	 ('2023-06-17','telegram','cpm','java',1,0,0,NULL),
	 ('2023-06-17','telegram','cpp','base-python',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-17','telegram','cpp','prof-java',1,0,0,NULL),
	 ('2023-06-17','telegram','cpp','prof-python',1,0,0,NULL),
	 ('2023-06-17','timepad','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-17','vk','cpc','prof-qa',1,0,0,NULL),
	 ('2023-06-17','vk','cpm','base',1,0,0,NULL),
	 ('2023-06-17','vk','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-17','vk','social','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-17','vk','social','promo',1,0,0,NULL),
	 ('2023-06-17','yandex-direct','cpc','50088205',1,0,0,NULL),
	 ('2023-06-17','zen','social','zen_post',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-18','yandex','cpc','freemium',219,0,0,NULL),
	 ('2023-06-18','yandex','cpc','prof-python',163,0,0,NULL),
	 ('2023-06-18','yandex','cpc','prof-frontend',149,0,0,NULL),
	 ('2023-06-18','yandex','cpc','prof-java',111,0,0,NULL),
	 ('2023-06-18','yandex','cpc','base-java',61,0,0,NULL),
	 ('2023-06-18','yandex','cpc','prof-professions-brand',51,0,0,NULL),
	 ('2023-06-18','admitad','cpa','admitad',50,0,0,NULL),
	 ('2023-06-18','yandex','cpc','base-python',43,0,0,NULL),
	 ('2023-06-18','yandex','cpc','base-frontend',27,0,0,NULL),
	 ('2023-06-18','yandex','cpc','prof-data-analytics',27,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-18','yandex','cpc','prof-professions-retarget',25,0,0,NULL),
	 ('2023-06-18','yandex','cpc','dod-frontend',21,0,0,NULL),
	 ('2023-06-18','yandex','cpc','dod-professions',14,0,0,NULL),
	 ('2023-06-18','vk-senler','cpc','freemium',13,0,0,NULL),
	 ('2023-06-18','yandex','cpc','dod-php',11,0,0,NULL),
	 ('2023-06-18','telegram','cpp','base-frontend',9,0,0,NULL),
	 ('2023-06-18','vk','cpc','prof-data-analytics',9,0,0,NULL),
	 ('2023-06-18','yandex','cpc','base-professions-retarget',9,0,0,NULL),
	 ('2023-06-18','vk-senler','cpc','dod-professions',8,0,0,NULL),
	 ('2023-06-18','yandex','cpc','dod-java',8,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-18','yandex','cpc','dod-python-java',8,0,0,NULL),
	 ('2023-06-18','vk','cpc','freemium-python',6,0,0,NULL),
	 ('2023-06-18','vk','cpc','prof-java',6,0,0,NULL),
	 ('2023-06-18','vk','cpc','freemium-frontend',5,0,0,NULL),
	 ('2023-06-18','vk','cpc','prof-python',4,0,0,NULL),
	 ('2023-06-18','yandex','cpc','dod-qa',4,0,0,NULL),
	 ('2023-06-18','telegram','cpp','base-java',2,0,0,NULL),
	 ('2023-06-18','telegram','cpp','base-python',2,0,0,NULL),
	 ('2023-06-18','telegram','cpp','prof-python',2,0,0,NULL),
	 ('2023-06-18','vc','cpp','dod-professions',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-18','vk','cpc','prof-frontend',2,0,0,NULL),
	 ('2023-06-18','Yandex','cpc','39770358',1,0,0,NULL),
	 ('2023-06-18','Yandex','cpc','77386453',1,0,0,NULL),
	 ('2023-06-18','Yandex','cpc','81276251',1,0,0,NULL),
	 ('2023-06-18','facebook','cpc','freemium',1,0,0,NULL),
	 ('2023-06-18','partners','cpm','all',1,0,0,NULL),
	 ('2023-06-18','telegram','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-18','telegram','cpp','prof-java',1,0,0,NULL),
	 ('2023-06-18','telegram','cpp','prof-qa',1,0,0,NULL),
	 ('2023-06-18','telegram','social','base-frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-18','telegram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-18','telegram','social','mdtruehaskell--funktsionalnyy-yazyk',1,0,0,NULL),
	 ('2023-06-18','twitter','social','all-courses',1,0,0,NULL),
	 ('2023-06-18','twitter','social','course_completed',1,0,0,NULL),
	 ('2023-06-18','vk','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-18','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-18','vk','social','prof-python',1,0,0,NULL),
	 ('2023-06-18','vk-senler','cpc','dod-frontend',1,0,0,NULL),
	 ('2023-06-18','vkontakte','social','button-vk',1,0,0,NULL),
	 ('2023-06-18','yandex-direct','cpc','97574364',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-18','zen','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-18','zen','social','prof-data-analyst',1,0,0,NULL),
	 ('2023-06-19','yandex','cpc','freemium',239,0,0,NULL),
	 ('2023-06-19','yandex','cpc','prof-python',185,0,0,NULL),
	 ('2023-06-19','yandex','cpc','prof-java',143,0,0,NULL),
	 ('2023-06-19','yandex','cpc','prof-frontend',135,0,0,NULL),
	 ('2023-06-19','yandex','cpc','base-java',66,0,0,NULL),
	 ('2023-06-19','yandex','cpc','base-python',60,0,0,NULL),
	 ('2023-06-19','yandex','cpc','prof-professions-brand',45,0,0,NULL),
	 ('2023-06-19','yandex','cpc','base-frontend',43,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-19','admitad','cpa','admitad',35,0,0,NULL),
	 ('2023-06-19','yandex','cpc','prof-data-analytics',35,0,0,NULL),
	 ('2023-06-19','yandex','cpc','dod-frontend',18,0,0,NULL),
	 ('2023-06-19','yandex','cpc','prof-professions-retarget',18,0,0,NULL),
	 ('2023-06-19','vk','cpc','prof-python',15,0,0,NULL),
	 ('2023-06-19','yandex','cpc','base-professions-retarget',14,0,0,NULL),
	 ('2023-06-19','vk-senler','cpc','freemium',12,0,0,NULL),
	 ('2023-06-19','vk','cpc','prof-java',10,0,0,NULL),
	 ('2023-06-19','vk','cpc','prof-frontend',9,0,0,NULL),
	 ('2023-06-19','telegram','cpp','base-frontend',8,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-19','vk','cpc','freemium-python',8,0,0,NULL),
	 ('2023-06-19','vk','cpc','prof-data-analytics',8,0,0,NULL),
	 ('2023-06-19','yandex','cpc','dod-python-java',8,0,0,NULL),
	 ('2023-06-19','yandex','cpc','dod-qa',8,0,0,NULL),
	 ('2023-06-19','yandex','cpc','dod-java',6,0,0,NULL),
	 ('2023-06-19','yandex','cpc','dod-php',6,0,0,NULL),
	 ('2023-06-19','yandex','cpc','dod-professions',6,0,0,NULL),
	 ('2023-06-19','vk','cpp','dod-python-java',4,0,0,NULL),
	 ('2023-06-19','twitter.com','social','istorii-uspeha-nashih-uchenikov-i-vypuskni',3,0,0,NULL),
	 ('2023-06-19','vk','cpc','freemium-java',3,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-19','vk','social','base-python',3,0,0,NULL),
	 ('2023-06-19','telegram','cpp','prof-python',2,0,0,NULL),
	 ('2023-06-19','twitter','social','hexlet-blog',2,0,0,NULL),
	 ('2023-06-19','vk','cpc','freemium-frontend',2,0,0,NULL),
	 ('2023-06-19','vk','social','base-java',2,0,0,NULL),
	 ('2023-06-19','vk','social','general',2,0,0,NULL),
	 ('2023-06-19','Yandex','cpc','52168119',1,0,0,NULL),
	 ('2023-06-19','Yandex','cpm','84109871',1,0,0,NULL),
	 ('2023-06-19','dzen','social','dzen-post',1,0,0,NULL),
	 ('2023-06-19','instagram','social','all-courses',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-19','instagram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-19','telegram','cpm','java',1,0,0,NULL),
	 ('2023-06-19','telegram','cpp','base-python',1,0,0,NULL),
	 ('2023-06-19','telegram','cpp','dod-java',1,0,0,NULL),
	 ('2023-06-19','telegram','social','kak-blagodarya-heksletu-ya-ustroilsya-v-epa',1,0,0,NULL),
	 ('2023-06-19','telegram','social','promo',1,0,0,NULL),
	 ('2023-06-19','telegram','social','special-newyear23',1,0,0,NULL),
	 ('2023-06-19','timepad','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-19','twitter','social','devushki_v_it',1,0,0,NULL),
	 ('2023-06-19','twitter','social','obuchenie-programmirovaniyu-v-30 -let-pod',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-19','vc','cpp','dod-professions',1,0,0,NULL),
	 ('2023-06-19','vk','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-19','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-19','vk','social','base-php',1,0,0,NULL),
	 ('2023-06-19','vk','social','dod-professions',1,0,0,NULL),
	 ('2023-06-19','zen','social','all-courses',1,0,0,NULL),
	 ('2023-06-19','zen','social','hexlet',1,0,0,NULL),
	 ('2023-06-20','yandex','cpc','freemium',242,0,0,NULL),
	 ('2023-06-20','yandex','cpc','prof-python',184,0,0,NULL),
	 ('2023-06-20','yandex','cpc','prof-frontend',148,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-20','yandex','cpc','prof-java',119,0,0,NULL),
	 ('2023-06-20','yandex','cpc','base-python',58,0,0,NULL),
	 ('2023-06-20','yandex','cpc','base-java',53,0,0,NULL),
	 ('2023-06-20','yandex','cpc','prof-professions-brand',47,0,0,NULL),
	 ('2023-06-20','yandex','cpc','prof-data-analytics',38,0,0,NULL),
	 ('2023-06-20','yandex','cpc','base-frontend',33,0,0,NULL),
	 ('2023-06-20','yandex','cpc','prof-professions-retarget',27,0,0,NULL),
	 ('2023-06-20','yandex','cpc','dod-frontend',17,0,0,NULL),
	 ('2023-06-20','yandex','cpc','dod-professions',17,0,0,NULL),
	 ('2023-06-20','vk-senler','cpc','freemium',14,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-20','vk','cpc','prof-python',13,0,0,NULL),
	 ('2023-06-20','yandex','cpc','dod-python-java',10,0,0,NULL),
	 ('2023-06-20','vk','cpc','freemium-java',8,0,0,NULL),
	 ('2023-06-20','vk','cpc','prof-java',8,0,0,NULL),
	 ('2023-06-20','instagram','social','base-frontend',7,0,0,NULL),
	 ('2023-06-20','yandex','cpc','dod-php',7,0,0,NULL),
	 ('2023-06-20','telegram','cpp','base-frontend',6,0,0,NULL),
	 ('2023-06-20','yandex','cpc','dod-java',6,0,0,NULL),
	 ('2023-06-20','vk','cpc','prof-data-analytics',5,0,0,NULL),
	 ('2023-06-20','vk','cpp','dod-python-java',5,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-20','yandex','cpc','dod-qa',5,0,0,NULL),
	 ('2023-06-20','instagram','social','prof-frontend',4,0,0,NULL),
	 ('2023-06-20','vk','cpc','freemium-python',3,0,0,NULL),
	 ('2023-06-20','vk','cpc','prof-frontend',3,0,0,NULL),
	 ('2023-06-20','vk','social','dod-professions',3,0,0,NULL),
	 ('2023-06-20','instagram','social','prof-backend',2,0,0,NULL),
	 ('2023-06-20','telegram','cpp','base-python',2,0,0,NULL),
	 ('2023-06-20','vk','social','hexlet-blog',2,0,0,NULL),
	 ('2023-06-20','yandex','cpc','base-professions-retarget',2,0,0,NULL),
	 ('2023-06-20','Yandex','cpm','14191988',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-20','instagram','social','all-courses',1,0,0,NULL),
	 ('2023-06-20','instagram','social','prof-java',1,0,0,NULL),
	 ('2023-06-20','instagram','social','prof-python',1,0,0,NULL),
	 ('2023-06-20','instagram','social','prof-qa',1,0,0,NULL),
	 ('2023-06-20','instagram','social','prof-rails',1,0,0,NULL),
	 ('2023-06-20','telegram','cpm','frontend',1,0,0,NULL),
	 ('2023-06-20','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-20','telegram','cpp','prof-java',1,0,0,NULL),
	 ('2023-06-20','telegram','social','mdtruereshenie-zadach--horoshiy-sposob-z',1,0,0,NULL),
	 ('2023-06-20','twitter','social','my-poprosili-nastavnikov-heksleta-rasska',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-20','twitter.com','social','buffer',1,0,0,NULL),
	 ('2023-06-20','vk','social','base-frontend',1,0,0,NULL),
	 ('2023-06-20','vk','social','base-java',1,0,0,NULL),
	 ('2023-06-20','vk','social','base-python',1,0,0,NULL),
	 ('2023-06-20','vk','social','dod-python-java',1,0,0,NULL),
	 ('2023-06-20','vk-senler','cpc','dod-professions',1,0,0,NULL),
	 ('2023-06-20','yandex-direct','cpc','26593528',1,0,0,NULL),
	 ('2023-06-20','yandex-direct','cpc','70989018',1,0,0,NULL),
	 ('2023-06-20','yandex-direct','cpc','85838400',1,0,0,NULL),
	 ('2023-06-20','zen','social','all-courses',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-21','yandex','cpc','freemium',225,0,0,NULL),
	 ('2023-06-21','yandex','cpc','prof-python',155,0,0,NULL),
	 ('2023-06-21','yandex','cpc','prof-frontend',140,0,0,NULL),
	 ('2023-06-21','yandex','cpc','prof-java',126,0,0,NULL),
	 ('2023-06-21','yandex','cpc','base-java',59,0,0,NULL),
	 ('2023-06-21','yandex','cpc','base-frontend',55,0,0,NULL),
	 ('2023-06-21','admitad','cpa','admitad',51,0,0,NULL),
	 ('2023-06-21','yandex','cpc','base-python',44,0,0,NULL),
	 ('2023-06-21','yandex','cpc','prof-professions-brand',42,0,0,NULL),
	 ('2023-06-21','yandex','cpc','prof-data-analytics',32,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-21','yandex','cpc','prof-professions-retarget',25,0,0,NULL),
	 ('2023-06-21','vk','cpc','prof-python',18,0,0,NULL),
	 ('2023-06-21','yandex','cpc','dod-frontend',16,0,0,NULL),
	 ('2023-06-21','vk','cpc','prof-data-analytics',13,0,0,NULL),
	 ('2023-06-21','yandex','cpc','dod-java',13,0,0,NULL),
	 ('2023-06-21','vk-senler','cpc','freemium',12,0,0,NULL),
	 ('2023-06-21','yandex','cpc','dod-python-java',12,0,0,NULL),
	 ('2023-06-21','telegram','cpp','prof-java',11,0,0,NULL),
	 ('2023-06-21','yandex','cpc','dod-professions',11,0,0,NULL),
	 ('2023-06-21','vk','cpc','prof-frontend',9,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-21','yandex','cpc','dod-qa',9,0,0,NULL),
	 ('2023-06-21','vk','cpc','prof-java',8,0,0,NULL),
	 ('2023-06-21','vk','cpc','freemium-frontend',7,0,0,NULL),
	 ('2023-06-21','vk','cpp','dod-python-java',7,0,0,NULL),
	 ('2023-06-21','vk','cpc','freemium-java',6,0,0,NULL),
	 ('2023-06-21','yandex','cpc','base-professions-retarget',6,0,0,NULL),
	 ('2023-06-21','telegram','cpp','base-java',5,0,0,NULL),
	 ('2023-06-21','vk','cpc','freemium-python',5,0,0,NULL),
	 ('2023-06-21','yandex','cpc','dod-php',5,0,0,NULL),
	 ('2023-06-21','instagram','social','prof-frontend',4,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-21','telegram','cpp','base-frontend',3,0,0,NULL),
	 ('2023-06-21','instagram','social','prof-qa',2,0,0,NULL),
	 ('2023-06-21','vk','social','general',2,0,0,NULL),
	 ('2023-06-21','Yandex','cpc','08409986',1,0,0,NULL),
	 ('2023-06-21','Yandex','cpc','74431025',1,0,0,NULL),
	 ('2023-06-21','admitad','cpc','442763',1,0,0,NULL),
	 ('2023-06-21','dzen','social','dzen-post',1,0,0,NULL),
	 ('2023-06-21','facebook','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-21','instagram','social','base-frontend',1,0,0,NULL),
	 ('2023-06-21','instagram','social','prof-backend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-21','instagram','social','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-21','instagram','social','prof-java',1,0,0,NULL),
	 ('2023-06-21','instagram','social','prof-python',1,0,0,NULL),
	 ('2023-06-21','telegram','cpm','python',1,0,0,NULL),
	 ('2023-06-21','telegram','cpp','dod-java',1,0,0,NULL),
	 ('2023-06-21','telegram','cpp','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-21','telegram','social','kak-optimizirovat-tretiy-proekt-v-professii-python',1,0,0,NULL),
	 ('2023-06-21','telegram','social','mdtruehaskell--funktsionalnyy-yazyk',1,0,0,NULL),
	 ('2023-06-21','telegram','social','promo',1,0,0,NULL),
	 ('2023-06-21','telegram','social','u-nas-chasto-sprashivayut--kakie-knigi-nuzhn',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-21','tg','social','hostel',1,0,0,NULL),
	 ('2023-06-21','twitter','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-21','twitter','social','promo',1,0,0,NULL),
	 ('2023-06-21','vk','cpc','freemium',1,0,0,NULL),
	 ('2023-06-21','vk','cpc','prof-php',1,0,0,NULL),
	 ('2023-06-21','vk','social','base-java',1,0,0,NULL),
	 ('2023-06-21','vk','social','course_completed',1,0,0,NULL),
	 ('2023-06-21','vk','social','dod-professions',1,0,0,NULL),
	 ('2023-06-21','vk','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-21','vk','social','prof-python',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-21','vk.com','social','skolko-stoit-obuchenie-na-hekslete-dlya',1,0,0,NULL),
	 ('2023-06-21','yandex-direct','cpc','71522986',1,0,0,NULL),
	 ('2023-06-21','zen','social','hexlet',1,0,0,NULL),
	 ('2023-06-21','zen','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-22','yandex','cpc','freemium',251,0,0,NULL),
	 ('2023-06-22','yandex','cpc','prof-frontend',175,0,0,NULL),
	 ('2023-06-22','yandex','cpc','prof-python',163,0,0,NULL),
	 ('2023-06-22','yandex','cpc','prof-java',129,0,0,NULL),
	 ('2023-06-22','admitad','cpa','admitad',67,0,0,NULL),
	 ('2023-06-22','yandex','cpc','base-java',66,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-22','yandex','cpc','base-python',65,0,0,NULL),
	 ('2023-06-22','yandex','cpc','base-frontend',51,0,0,NULL),
	 ('2023-06-22','yandex','cpc','prof-professions-brand',41,0,0,NULL),
	 ('2023-06-22','yandex','cpc','prof-data-analytics',29,0,0,NULL),
	 ('2023-06-22','yandex','cpc','dod-frontend',20,0,0,NULL),
	 ('2023-06-22','yandex','cpc','prof-professions-retarget',19,0,0,NULL),
	 ('2023-06-22','vk-senler','cpc','freemium',18,0,0,NULL),
	 ('2023-06-22','vk','cpc','prof-python',17,0,0,NULL),
	 ('2023-06-22','vk','cpc','prof-java',13,0,0,NULL),
	 ('2023-06-22','yandex','cpc','dod-professions',12,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-22','yandex','cpc','dod-php',11,0,0,NULL),
	 ('2023-06-22','yandex','cpc','dod-python-java',10,0,0,NULL),
	 ('2023-06-22','vk','cpc','freemium-frontend',9,0,0,NULL),
	 ('2023-06-22','vk','cpc','prof-data-analytics',9,0,0,NULL),
	 ('2023-06-22','telegram','cpp','prof-java',7,0,0,NULL),
	 ('2023-06-22','vk','cpc','prof-frontend',7,0,0,NULL),
	 ('2023-06-22','vk','cpp','dod-python-java',7,0,0,NULL),
	 ('2023-06-22','yandex','cpc','base-professions-retarget',7,0,0,NULL),
	 ('2023-06-22','yandex','cpc','dod-java',7,0,0,NULL),
	 ('2023-06-22','telegram','cpp','prof-python',6,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-22','vk','cpc','freemium-java',4,0,0,NULL),
	 ('2023-06-22','yandex','cpc','dod-qa',4,0,0,NULL),
	 ('2023-06-22','dzen','social','dzen-post',3,0,0,NULL),
	 ('2023-06-22','vk','cpc','freemium-python',3,0,0,NULL),
	 ('2023-06-22','telegram','social','dod-professions',2,0,0,NULL),
	 ('2023-06-22','tg','social','hostel',2,0,0,NULL),
	 ('2023-06-22','zen','social','all-courses',2,0,0,NULL),
	 ('2023-06-22','facebook','cpc','freemium',1,0,0,NULL),
	 ('2023-06-22','instagram','social','all-courses',1,0,0,NULL),
	 ('2023-06-22','instagram','social','hexlet-blog',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-22','podcast','social','all-courses',1,0,0,NULL),
	 ('2023-06-22','telegram','cpm','base_java',1,0,0,NULL),
	 ('2023-06-22','telegram','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-22','telegram','cpp','base-java',1,0,0,NULL),
	 ('2023-06-22','telegram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-22','timepad','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-22','twitter','social','grokaem_algoritmy',1,0,0,NULL),
	 ('2023-06-22','vk','cpc','python',1,0,0,NULL),
	 ('2023-06-22','vk','social','base-html',1,0,0,NULL),
	 ('2023-06-22','vk','social','base-python',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-22','vk','social','course_completed',1,0,0,NULL),
	 ('2023-06-22','vk','social','dod-python-java',1,0,0,NULL),
	 ('2023-06-22','vk','social','planiruy-uchebu--fokusiruysya-na-protsesse',1,0,0,NULL),
	 ('2023-06-22','vk','social','prof-python',1,0,0,NULL),
	 ('2023-06-22','vk','social','promo',1,0,0,NULL),
	 ('2023-06-22','yandex-direct','cpc','18177858',1,0,0,NULL),
	 ('2023-06-22','zen','social','hexlet',1,0,0,NULL),
	 ('2023-06-22','zen_from_telegram','social',NULL,1,0,0,NULL),
	 ('2023-06-23','yandex','cpc','freemium',255,0,0,NULL),
	 ('2023-06-23','yandex','cpc','prof-python',207,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-23','yandex','cpc','prof-frontend',182,0,0,NULL),
	 ('2023-06-23','yandex','cpc','prof-java',134,0,0,NULL),
	 ('2023-06-23','yandex','cpc','base-java',71,0,0,NULL),
	 ('2023-06-23','yandex','cpc','base-python',66,0,0,NULL),
	 ('2023-06-23','yandex','cpc','base-frontend',58,0,0,NULL),
	 ('2023-06-23','yandex','cpc','prof-professions-brand',49,0,0,NULL),
	 ('2023-06-23','yandex','cpc','prof-data-analytics',43,0,0,NULL),
	 ('2023-06-23','yandex','cpc','prof-professions-retarget',34,0,0,NULL),
	 ('2023-06-23','yandex','cpc','dod-frontend',22,0,0,NULL),
	 ('2023-06-23','yandex','cpc','dod-professions',18,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-23','vk','cpc','prof-data-analytics',16,0,0,NULL),
	 ('2023-06-23','vk','cpc','prof-python',16,0,0,NULL),
	 ('2023-06-23','vk-senler','cpc','freemium',16,0,0,NULL),
	 ('2023-06-23','vk','cpc','prof-frontend',11,0,0,NULL),
	 ('2023-06-23','vk','cpc','freemium-frontend',9,0,0,NULL),
	 ('2023-06-23','yandex','cpc','dod-python-java',9,0,0,NULL),
	 ('2023-06-23','telegram','cpp','prof-python',8,0,0,NULL),
	 ('2023-06-23','yandex','cpc','base-professions-retarget',8,0,0,NULL),
	 ('2023-06-23','yandex','cpc','dod-php',8,0,0,NULL),
	 ('2023-06-23','yandex','cpc','dod-java',7,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-23','telegram','cpp','base-frontend',6,0,0,NULL),
	 ('2023-06-23','vk','cpc','freemium-java',6,0,0,NULL),
	 ('2023-06-23','vk','cpc','base-python',5,0,0,NULL),
	 ('2023-06-23','vk','cpc','prof-java',5,0,0,NULL),
	 ('2023-06-23','yandex','cpc','dod-qa',5,0,0,NULL),
	 ('2023-06-23','timepad','cpp','base-frontend',3,0,0,NULL),
	 ('2023-06-23','telegram','social','dod-professions',2,0,0,NULL),
	 ('2023-06-23','vk','cpp','dod-python-java',2,0,0,NULL),
	 ('2023-06-23','vk','social','all-courses',2,0,0,NULL),
	 ('2023-06-23','vk','social','prof-python',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-23','zen','social','hexlet',2,0,0,NULL),
	 ('2023-06-23','facebook','cpc','freemium',1,0,0,NULL),
	 ('2023-06-23','instagram','social','prof-frontend',1,0,0,NULL),
	 ('2023-06-23','instagram','social','prof-qa-auto',1,0,0,NULL),
	 ('2023-06-23','telegram','cpm','base_python',1,0,0,NULL),
	 ('2023-06-23','telegram','cpm','java',1,0,0,NULL),
	 ('2023-06-23','telegram','cpp','dod-php',1,0,0,NULL),
	 ('2023-06-23','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-23','telegram','social','base',1,0,0,NULL),
	 ('2023-06-23','telegram','social','promo',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-23','twitter','social','how-to-sleep',1,0,0,NULL),
	 ('2023-06-23','vk','cpc','freemium-python',1,0,0,NULL),
	 ('2023-06-23','vk','social','8-statey--kotorye-budut-polezny-novichku',1,0,0,NULL),
	 ('2023-06-23','vk','social','base-python',1,0,0,NULL),
	 ('2023-06-23','vk','social','course_completed',1,0,0,NULL),
	 ('2023-06-23','vk','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-23','vk','social','open_lectures23',1,0,0,NULL),
	 ('2023-06-24','yandex','cpc','freemium',263,0,0,NULL),
	 ('2023-06-24','yandex','cpc','prof-frontend',172,0,0,NULL),
	 ('2023-06-24','yandex','cpc','prof-python',164,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-24','yandex','cpc','prof-java',129,0,0,NULL),
	 ('2023-06-24','yandex','cpc','base-java',58,0,0,NULL),
	 ('2023-06-24','yandex','cpc','base-frontend',41,0,0,NULL),
	 ('2023-06-24','yandex','cpc','base-python',40,0,0,NULL),
	 ('2023-06-24','yandex','cpc','prof-professions-brand',35,0,0,NULL),
	 ('2023-06-24','yandex','cpc','prof-data-analytics',29,0,0,NULL),
	 ('2023-06-24','yandex','cpc','prof-professions-retarget',27,0,0,NULL),
	 ('2023-06-24','telegram','social','hexlet-blog',26,0,0,NULL),
	 ('2023-06-24','yandex','cpc','dod-frontend',24,0,0,NULL),
	 ('2023-06-24','yandex','cpc','dod-professions',23,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-24','vk','cpc','prof-python',18,0,0,NULL),
	 ('2023-06-24','vk','cpc','prof-data-analytics',14,0,0,NULL),
	 ('2023-06-24','telegram','cpp','base-frontend',11,0,0,NULL),
	 ('2023-06-24','telegram','cpp','prof-java',10,0,0,NULL),
	 ('2023-06-24','yandex','cpc','dod-python-java',10,0,0,NULL),
	 ('2023-06-24','vk','cpc','prof-java',9,0,0,NULL),
	 ('2023-06-24','yandex','cpc','dod-java',9,0,0,NULL),
	 ('2023-06-24','vk','cpc','prof-frontend',8,0,0,NULL),
	 ('2023-06-24','yandex','cpc','dod-php',8,0,0,NULL),
	 ('2023-06-24','vk','cpc','base-python',7,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-24','yandex','cpc','base-professions-retarget',6,0,0,NULL),
	 ('2023-06-24','vk','cpc','freemium-frontend',5,0,0,NULL),
	 ('2023-06-24','vk-senler','cpc','freemium',5,0,0,NULL),
	 ('2023-06-24','yandex','cpc','dod-qa',5,0,0,NULL),
	 ('2023-06-24','telegram','cpp','prof-frontend',2,0,0,NULL),
	 ('2023-06-24','telegram','cpp','prof-python',2,0,0,NULL),
	 ('2023-06-24','vk','cpc','freemium-java',2,0,0,NULL),
	 ('2023-06-24','vk','cpp','dod-python-java',2,0,0,NULL),
	 ('2023-06-24','vk','social','base-python',2,0,0,NULL),
	 ('2023-06-24','vk','social','prof-python',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-24','facebook','cpc','python',1,0,0,NULL),
	 ('2023-06-24','telegram','cpm','frontend',1,0,0,NULL),
	 ('2023-06-24','telegram','cpp','base-java',1,0,0,NULL),
	 ('2023-06-24','timepad','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-24','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-24','vk','social','matematika-ilnar',1,0,0,NULL),
	 ('2023-06-24','vk','social','reshenie-zadach--horoshiy-sposob-zakrepit',1,0,0,NULL),
	 ('2023-06-24','vk-senler','cpc','base-python',1,0,0,NULL),
	 ('2023-06-24','vk-senler','cpc','dod-frontend',1,0,0,NULL),
	 ('2023-06-24','vk-senler','cpc','dod-python-java',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-24','yandex-direct','cpc','57063851',1,0,0,NULL),
	 ('2023-06-25','yandex','cpc','freemium',211,0,0,NULL),
	 ('2023-06-25','yandex','cpc','prof-python',157,0,0,NULL),
	 ('2023-06-25','yandex','cpc','prof-java',149,0,0,NULL),
	 ('2023-06-25','yandex','cpc','prof-frontend',147,0,0,NULL),
	 ('2023-06-25','yandex','cpc','base-java',66,0,0,NULL),
	 ('2023-06-25','yandex','cpc','base-python',61,0,0,NULL),
	 ('2023-06-25','admitad','cpa','admitad',49,0,0,NULL),
	 ('2023-06-25','yandex','cpc','prof-professions-brand',46,0,0,NULL),
	 ('2023-06-25','yandex','cpc','base-frontend',40,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-25','yandex','cpc','prof-professions-retarget',29,0,0,NULL),
	 ('2023-06-25','vk','cpc','prof-python',25,0,0,NULL),
	 ('2023-06-25','yandex','cpc','prof-data-analytics',23,0,0,NULL),
	 ('2023-06-25','yandex','cpc','dod-frontend',22,0,0,NULL),
	 ('2023-06-25','vk','cpc','prof-java',21,0,0,NULL),
	 ('2023-06-25','telegram','cpp','prof-java',16,0,0,NULL),
	 ('2023-06-25','vk','cpc','prof-data-analytics',14,0,0,NULL),
	 ('2023-06-25','yandex','cpc','dod-professions',12,0,0,NULL),
	 ('2023-06-25','vk','cpc','base-python',10,0,0,NULL),
	 ('2023-06-25','yandex','cpc','dod-java',9,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-25','vk','cpc','freemium-frontend',8,0,0,NULL),
	 ('2023-06-25','vk','cpc','freemium-python',7,0,0,NULL),
	 ('2023-06-25','yandex','cpc','dod-php',7,0,0,NULL),
	 ('2023-06-25','yandex','cpc','dod-qa',6,0,0,NULL),
	 ('2023-06-25','telegram','social','hexlet-blog',4,0,0,NULL),
	 ('2023-06-25','yandex','cpc','base-professions-retarget',4,0,0,NULL),
	 ('2023-06-25','yandex','cpc','dod-python-java',4,0,0,NULL),
	 ('2023-06-25','vk','cpc','prof-frontend',3,0,0,NULL),
	 ('2023-06-25','vk-senler','cpc','freemium',3,0,0,NULL),
	 ('2023-06-25','telegram','cpp','base-frontend',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-25','telegram','cpp','prof-python',2,0,0,NULL),
	 ('2023-06-25','timepad','cpp','base-frontend',2,0,0,NULL),
	 ('2023-06-25','vk','cpc','freemium-java',2,0,0,NULL),
	 ('2023-06-25','vk','cpp','base-frontend',2,0,0,NULL),
	 ('2023-06-25','instagram','social','base-pyton',1,0,0,NULL),
	 ('2023-06-25','telegram','cpp','base-java',1,0,0,NULL),
	 ('2023-06-25','telegram','social','course_completed',1,0,0,NULL),
	 ('2023-06-25','telegram','social','studenty-heksleta-inogda-rasstraivayutsya',1,0,0,NULL),
	 ('2023-06-25','twitter','social','devushki_v_it',1,0,0,NULL),
	 ('2023-06-25','vk','social','base-python',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-25','vk','social','dod-python-java',1,0,0,NULL),
	 ('2023-06-25','vk','social','general',1,0,0,NULL),
	 ('2023-06-25','vk','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-25','vk','social','prof-python',1,0,0,NULL),
	 ('2023-06-25','vk-senler','cpc','dod-frontend',1,0,0,NULL),
	 ('2023-06-25','vkontakte','social','button-vk',1,0,0,NULL),
	 ('2023-06-25','zen','social','hexlet',1,0,0,NULL),
	 ('2023-06-26','yandex','cpc','freemium',251,0,0,NULL),
	 ('2023-06-26','yandex','cpc','prof-python',187,0,0,NULL),
	 ('2023-06-26','yandex','cpc','prof-frontend',166,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-26','yandex','cpc','prof-java',121,0,0,NULL),
	 ('2023-06-26','telegram','social','hexlet-blog',66,0,0,NULL),
	 ('2023-06-26','telegram','cpp','base-python',58,0,0,NULL),
	 ('2023-06-26','yandex','cpc','base-python',57,0,0,NULL),
	 ('2023-06-26','yandex','cpc','base-java',52,0,0,NULL),
	 ('2023-06-26','yandex','cpc','base-frontend',43,0,0,NULL),
	 ('2023-06-26','yandex','cpc','prof-professions-brand',40,0,0,NULL),
	 ('2023-06-26','yandex','cpc','prof-data-analytics',36,0,0,NULL),
	 ('2023-06-26','vk','cpc','prof-python',21,0,0,NULL),
	 ('2023-06-26','yandex','cpc','dod-frontend',19,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-26','yandex','cpc','dod-professions',19,0,0,NULL),
	 ('2023-06-26','yandex','cpc','prof-professions-retarget',18,0,0,NULL),
	 ('2023-06-26','vk','cpc','prof-java',17,0,0,NULL),
	 ('2023-06-26','vk-senler','cpc','freemium',12,0,0,NULL),
	 ('2023-06-26','yandex','cpc','dod-python-java',11,0,0,NULL),
	 ('2023-06-26','telegram','cpp','base-java',9,0,0,NULL),
	 ('2023-06-26','vk','cpc','freemium-frontend',8,0,0,NULL),
	 ('2023-06-26','vk','cpc','freemium-python',7,0,0,NULL),
	 ('2023-06-26','yandex','cpc','dod-qa',7,0,0,NULL),
	 ('2023-06-26','yandex','cpc','dod-java',6,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-26','facebook','social','hexlet-blog',4,0,0,NULL),
	 ('2023-06-26','telegram','cpp','prof-python',4,0,0,NULL),
	 ('2023-06-26','vk','cpc','prof-data-analytics',4,0,0,NULL),
	 ('2023-06-26','vk','cpc','prof-frontend',4,0,0,NULL),
	 ('2023-06-26','vk','social','hexlet-blog',4,0,0,NULL),
	 ('2023-06-26','yandex','cpc','base-professions-retarget',4,0,0,NULL),
	 ('2023-06-26','telegram','cpp','prof-java',3,0,0,NULL),
	 ('2023-06-26','vk','cpc','base-python',3,0,0,NULL),
	 ('2023-06-26','yandex','cpc','dod-php',3,0,0,NULL),
	 ('2023-06-26','vk','cpp','base-java',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-26','vk','social','base-java',2,0,0,NULL),
	 ('2023-06-26','vk','social','prof-python',2,0,0,NULL),
	 ('2023-06-26','admitad','cpa','442763',1,0,0,NULL),
	 ('2023-06-26','admitad','cpc','183258',1,0,0,NULL),
	 ('2023-06-26','dzen','social','dzen-post',1,0,0,NULL),
	 ('2023-06-26','instagram','social','all-courses',1,0,0,NULL),
	 ('2023-06-26','instagram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-26','instagram','social','promo',1,0,0,NULL),
	 ('2023-06-26','podcast','social','interview',1,0,0,NULL),
	 ('2023-06-26','telegram','cpp','base-frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-26','telegram','cpp','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-26','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-26','telegram','social','course_completed',1,0,0,NULL),
	 ('2023-06-26','telegram','social','dod-professions',1,0,0,NULL),
	 ('2023-06-26','telegram','social','uyazvimost-v-java-ugrozhaet-sotnyam-tysyach',1,0,0,NULL),
	 ('2023-06-26','twitter','social','9-marta-v-1930-po-moskovskomu-vremeni-p',1,0,0,NULL),
	 ('2023-06-26','vk','cpc','freemium-java',1,0,0,NULL),
	 ('2023-06-26','vk','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-26','vk','cpp','dod-python-java',1,0,0,NULL),
	 ('2023-06-26','vk','social','base-python',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-26','vk','social','general',1,0,0,NULL),
	 ('2023-06-26','vk-senler','cpc','base-frontend',1,0,0,NULL),
	 ('2023-06-26','zen','social','prof-python',1,0,0,NULL),
	 ('2023-06-27','yandex','cpc','freemium',238,0,0,NULL),
	 ('2023-06-27','yandex','cpc','prof-python',175,0,0,NULL),
	 ('2023-06-27','yandex','cpc','prof-frontend',158,0,0,NULL),
	 ('2023-06-27','yandex','cpc','prof-java',128,0,0,NULL),
	 ('2023-06-27','yandex','cpc','base-java',58,0,0,NULL),
	 ('2023-06-27','yandex','cpc','base-python',58,0,0,NULL),
	 ('2023-06-27','yandex','cpc','prof-professions-brand',58,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-27','admitad','cpa','admitad',45,0,0,NULL),
	 ('2023-06-27','yandex','cpc','base-frontend',39,0,0,NULL),
	 ('2023-06-27','yandex','cpc','prof-data-analytics',38,0,0,NULL),
	 ('2023-06-27','yandex','cpc','prof-professions-retarget',32,0,0,NULL),
	 ('2023-06-27','yandex','cpc','dod-professions',27,0,0,NULL),
	 ('2023-06-27','vk-senler','cpc','freemium',20,0,0,NULL),
	 ('2023-06-27','telegram','cpp','base-python',19,0,0,NULL),
	 ('2023-06-27','vk','cpc','prof-python',16,0,0,NULL),
	 ('2023-06-27','yandex','cpc','dod-frontend',13,0,0,NULL),
	 ('2023-06-27','telegram','cpp','base-java',11,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-27','vk','cpc','freemium-frontend',11,0,0,NULL),
	 ('2023-06-27','telegram','cpp','base-frontend',10,0,0,NULL),
	 ('2023-06-27','yandex','cpc','dod-python-java',10,0,0,NULL),
	 ('2023-06-27','vk','cpc','base-python',9,0,0,NULL),
	 ('2023-06-27','vk','cpc','prof-java',9,0,0,NULL),
	 ('2023-06-27','yandex','cpc','dod-java',9,0,0,NULL),
	 ('2023-06-27','vk','cpc','freemium-python',7,0,0,NULL),
	 ('2023-06-27','vk','cpc','prof-frontend',5,0,0,NULL),
	 ('2023-06-27','yandex','cpc','dod-qa',5,0,0,NULL),
	 ('2023-06-27','facebook','social','hexlet-blog',4,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-27','yandex','cpc','dod-php',3,0,0,NULL),
	 ('2023-06-27','vk','cpc','freemium-java',2,0,0,NULL),
	 ('2023-06-27','vk','social','all-courses',2,0,0,NULL),
	 ('2023-06-27','vk','social','general',2,0,0,NULL),
	 ('2023-06-27','yandex','cpc','base-professions-retarget',2,0,0,NULL),
	 ('2023-06-27','Yandex','cpc','73043444',1,0,0,NULL),
	 ('2023-06-27','admitad','cpc','183258',1,0,0,NULL),
	 ('2023-06-27','dzen','social','dzen_post',1,0,0,NULL),
	 ('2023-06-27','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-27','telegram','cpp','prof-python',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-27','telegram','social','20-sovetov-dlya-buduschih-programmistov--ko',1,0,0,NULL),
	 ('2023-06-27','telegram','social','all-courses',1,0,0,NULL),
	 ('2023-06-27','telegram','social','dod-professions',1,0,0,NULL),
	 ('2023-06-27','twitter','social','analitik-dannyh',1,0,0,NULL),
	 ('2023-06-27','twitter','social','course_completed',1,0,0,NULL),
	 ('2023-06-27','twitter','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-27','vk','cpc','yaintern',1,0,0,NULL),
	 ('2023-06-27','vk','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-27','vk','cpp','base-java',1,0,0,NULL),
	 ('2023-06-27','vk','social','base-frontend',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-27','vk','social','base-python',1,0,0,NULL),
	 ('2023-06-27','vk','social','dod-professions',1,0,0,NULL),
	 ('2023-06-27','vk','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-27','vk','social','prof-python',1,0,0,NULL),
	 ('2023-06-27','yandex-direct','cpc','26980930',1,0,0,NULL),
	 ('2023-06-27','zen','social','blog',1,0,0,NULL),
	 ('2023-06-28','yandex','cpc','freemium',239,0,0,NULL),
	 ('2023-06-28','yandex','cpc','prof-python',186,0,0,NULL),
	 ('2023-06-28','yandex','cpc','prof-frontend',139,0,0,NULL),
	 ('2023-06-28','yandex','cpc','prof-java',112,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-28','yandex','cpc','base-python',60,0,0,NULL),
	 ('2023-06-28','yandex','cpc','base-java',47,0,0,NULL),
	 ('2023-06-28','yandex','cpc','base-frontend',43,0,0,NULL),
	 ('2023-06-28','yandex','cpc','prof-professions-brand',34,0,0,NULL),
	 ('2023-06-28','telegram','cpp','base-python',32,0,0,NULL),
	 ('2023-06-28','yandex','cpc','prof-data-analytics',27,0,0,NULL),
	 ('2023-06-28','yandex','cpc','prof-professions-retarget',27,0,0,NULL),
	 ('2023-06-28','yandex','cpc','dod-frontend',19,0,0,NULL),
	 ('2023-06-28','telegram','cpp','prof-python',16,0,0,NULL),
	 ('2023-06-28','telegram','cpp','base-java',15,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-28','vk','cpc','prof-python',15,0,0,NULL),
	 ('2023-06-28','vk','cpc','freemium-frontend',14,0,0,NULL),
	 ('2023-06-28','yandex','cpc','dod-professions',11,0,0,NULL),
	 ('2023-06-28','vk-senler','cpc','freemium',10,0,0,NULL),
	 ('2023-06-28','yandex','cpc','dod-python-java',9,0,0,NULL),
	 ('2023-06-28','vk','cpc','prof-java',8,0,0,NULL),
	 ('2023-06-28','yandex','cpc','dod-qa',8,0,0,NULL),
	 ('2023-06-28','vk','cpc','base-python',7,0,0,NULL),
	 ('2023-06-28','vk','cpc','prof-frontend',6,0,0,NULL),
	 ('2023-06-28','yandex','cpc','base-professions-retarget',6,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-28','facebook','social','hexlet-blog',5,0,0,NULL),
	 ('2023-06-28','telegram','cpp','base-frontend',5,0,0,NULL),
	 ('2023-06-28','vk','cpp','base-java',5,0,0,NULL),
	 ('2023-06-28','yandex','cpc','dod-java',5,0,0,NULL),
	 ('2023-06-28','vk','cpc','freemium-java',3,0,0,NULL),
	 ('2023-06-28','vk','social','hexlet-blog',3,0,0,NULL),
	 ('2023-06-28','vk','social','prof-python',3,0,0,NULL),
	 ('2023-06-28','yandex','cpc','dod-php',3,0,0,NULL),
	 ('2023-06-28','telegram','cpp','prof-java',2,0,0,NULL),
	 ('2023-06-28','telegram','social','course_completed',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-28','vk','social','all-courses',2,0,0,NULL),
	 ('2023-06-28','Yandex','cpc','67469241',1,0,0,NULL),
	 ('2023-06-28','admitad','cpc','183258',1,0,0,NULL),
	 ('2023-06-28','instagram','social','hexlet-blog',1,0,0,NULL),
	 ('2023-06-28','instagram','social','prof-java',1,0,0,NULL),
	 ('2023-06-28','mytarget','cpc','freemium',1,0,0,NULL),
	 ('2023-06-28','mytarget','cpc','retarget',1,0,0,NULL),
	 ('2023-06-28','partners','cpm','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-28','telegram','cpm','base',1,0,0,NULL),
	 ('2023-06-28','telegram','social','dod-professions',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-28','telegram.me','social','kakoy-yazyk-programmirovaniya-vybrat-dlya',1,0,0,NULL),
	 ('2023-06-28','twitter','social','promo',1,0,0,NULL),
	 ('2023-06-28','twitter','social','webinars',1,0,0,NULL),
	 ('2023-06-28','vk','cpc','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-28','vk','cpm','java',1,0,0,NULL),
	 ('2023-06-28','vk','social','base-python',1,0,0,NULL),
	 ('2023-06-28','vk','social','prof-qa',1,0,0,NULL),
	 ('2023-06-28','vk','social','promo',1,0,0,NULL),
	 ('2023-06-28','vk-senler','cpc','dod-php',1,0,0,NULL),
	 ('2023-06-29','yandex','cpc','freemium',227,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-29','yandex','cpc','prof-python',194,0,0,NULL),
	 ('2023-06-29','yandex','cpc','prof-frontend',149,0,0,NULL),
	 ('2023-06-29','yandex','cpc','prof-java',122,0,0,NULL),
	 ('2023-06-29','yandex','cpc','base-python',61,0,0,NULL),
	 ('2023-06-29','admitad','cpa','admitad',56,0,0,NULL),
	 ('2023-06-29','yandex','cpc','base-java',49,0,0,NULL),
	 ('2023-06-29','vk-senler','cpc','base-python',46,0,0,NULL),
	 ('2023-06-29','telegram','cpp','base-python',43,0,0,NULL),
	 ('2023-06-29','yandex','cpc','prof-professions-brand',37,0,0,NULL),
	 ('2023-06-29','yandex','cpc','base-frontend',35,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-29','yandex','cpc','prof-data-analytics',29,0,0,NULL),
	 ('2023-06-29','yandex','cpc','prof-professions-retarget',25,0,0,NULL),
	 ('2023-06-29','vk','cpc','freemium-frontend',20,0,0,NULL),
	 ('2023-06-29','vk-senler','cpc','freemium',19,0,0,NULL),
	 ('2023-06-29','yandex','cpc','dod-frontend',18,0,0,NULL),
	 ('2023-06-29','telegram','social','hexlet-blog',16,0,0,NULL),
	 ('2023-06-29','yandex','cpc','dod-professions',14,0,0,NULL),
	 ('2023-06-29','vk','cpc','prof-python',13,0,0,NULL),
	 ('2023-06-29','yandex','cpc','dod-python-java',12,0,0,NULL),
	 ('2023-06-29','yandex','cpc','dod-java',11,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-29','telegram','cpp','dod-qa',9,0,0,NULL),
	 ('2023-06-29','telegram','cpp','base-java',8,0,0,NULL),
	 ('2023-06-29','vk','cpc','prof-java',8,0,0,NULL),
	 ('2023-06-29','vk','social','base-python',7,0,0,NULL),
	 ('2023-06-29','vk','cpc','freemium-python',6,0,0,NULL),
	 ('2023-06-29','vk','social','base-frontend',6,0,0,NULL),
	 ('2023-06-29','telegram','cpp','base-frontend',5,0,0,NULL),
	 ('2023-06-29','yandex','cpc','dod-qa',5,0,0,NULL),
	 ('2023-06-29','vk','cpp','base-java',4,0,0,NULL),
	 ('2023-06-29','vk','social','general',4,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-29','yandex','cpc','dod-php',4,0,0,NULL),
	 ('2023-06-29','vk','cpc','base-python',3,0,0,NULL),
	 ('2023-06-29','vk','social','base-java',3,0,0,NULL),
	 ('2023-06-29','telegram','social','promo',2,0,0,NULL),
	 ('2023-06-29','vc','cpp','dod-qa',2,0,0,NULL),
	 ('2023-06-29','vk','cpc','freemium-java',2,0,0,NULL),
	 ('2023-06-29','yandex','cpc','base-professions-retarget',2,0,0,NULL),
	 ('2023-06-29','admitad','cpc','442763',1,0,0,NULL),
	 ('2023-06-29','facebook','cpm','freemium-en',1,0,0,NULL),
	 ('2023-06-29','instagram','social','hexlet-blog',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-29','instagram','social','prof-python',1,0,0,NULL),
	 ('2023-06-29','partners','cpm','all',1,0,0,NULL),
	 ('2023-06-29','telegram','cpm','base',1,0,0,NULL),
	 ('2023-06-29','telegram','cpp','dod-data-analytics',1,0,0,NULL),
	 ('2023-06-29','telegram','cpp','dod-frontend',1,0,0,NULL),
	 ('2023-06-29','telegram','cpp','prof-frontend',1,0,0,NULL),
	 ('2023-06-29','telegram','social','analitik-dannyh',1,0,0,NULL),
	 ('2023-06-29','telegram','social','dod-professions',1,0,0,NULL),
	 ('2023-06-29','timepad','cpp','base-frontend',1,0,0,NULL),
	 ('2023-06-29','twitter','social','hexlet-blog',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-29','twitter.com','social','chto-napisat-v-soprovoditelnom-pisme-i',1,0,0,NULL),
	 ('2023-06-29','vk','cpc','freemium',1,0,0,NULL),
	 ('2023-06-29','vk','cpc','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-29','vk','social','all-courses',1,0,0,NULL),
	 ('2023-06-29','vk','social','prof-data-analyst',1,0,0,NULL),
	 ('2023-06-29','vk','social','unpack',1,0,0,NULL),
	 ('2023-06-30','yandex','cpc','freemium',200,0,0,NULL),
	 ('2023-06-30','yandex','cpc','prof-python',179,0,0,NULL),
	 ('2023-06-30','yandex','cpc','prof-frontend',165,0,0,NULL),
	 ('2023-06-30','yandex','cpc','prof-java',125,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-30','yandex','cpc','base-python',77,0,0,NULL),
	 ('2023-06-30','yandex','cpc','base-java',64,0,0,NULL),
	 ('2023-06-30','yandex','cpc','prof-professions-brand',43,0,0,NULL),
	 ('2023-06-30','yandex','cpc','base-frontend',37,0,0,NULL),
	 ('2023-06-30','yandex','cpc','prof-data-analytics',37,0,0,NULL),
	 ('2023-06-30','telegram','cpp','base-java',29,0,0,NULL),
	 ('2023-06-30','yandex','cpc','dod-frontend',20,0,0,NULL),
	 ('2023-06-30','yandex','cpc','prof-professions-retarget',19,0,0,NULL),
	 ('2023-06-30','telegram','social','hexlet-blog',16,0,0,NULL),
	 ('2023-06-30','vk-senler','cpc','freemium',16,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-30','vk-senler','cpc','base-python',15,0,0,NULL),
	 ('2023-06-30','vk','cpc','prof-java',14,0,0,NULL),
	 ('2023-06-30','telegram','cpp','base-frontend',13,0,0,NULL),
	 ('2023-06-30','telegram','cpp','base-python',13,0,0,NULL),
	 ('2023-06-30','yandex','cpc','dod-professions',12,0,0,NULL),
	 ('2023-06-30','vk','cpc','freemium-frontend',8,0,0,NULL),
	 ('2023-06-30','yandex','cpc','dod-java',8,0,0,NULL),
	 ('2023-06-30','vk','cpc','prof-python',7,0,0,NULL),
	 ('2023-06-30','yandex','cpc','dod-python-java',7,0,0,NULL),
	 ('2023-06-30','vk','cpp','base-java',6,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-30','vk','social','base-frontend',5,0,0,NULL),
	 ('2023-06-30','yandex','cpc','base-professions-retarget',5,0,0,NULL),
	 ('2023-06-30','yandex','cpc','dod-php',5,0,0,NULL),
	 ('2023-06-30','yandex','cpc','dod-qa',5,0,0,NULL),
	 ('2023-06-30','vk','cpc','freemium-java',4,0,0,NULL),
	 ('2023-06-30','vk','cpc','base-python',3,0,0,NULL),
	 ('2023-06-30','vk','social','base-java',3,0,0,NULL),
	 ('2023-06-30','facebook','social','hexlet-blog',2,0,0,NULL),
	 ('2023-06-30','twitter','social','promo',2,0,0,NULL),
	 ('2023-06-30','vk','cpp','base-frontend',2,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-30','vk','social','all-courses',2,0,0,NULL),
	 ('2023-06-30','vk','social','base-python',2,0,0,NULL),
	 ('2023-06-30','vk','social','general',2,0,0,NULL),
	 ('2023-06-30','vk','social','hexlet',2,0,0,NULL),
	 ('2023-06-30','vk','social','prof-python',2,0,0,NULL),
	 ('2023-06-30','admitad','cpc','183258',1,0,0,NULL),
	 ('2023-06-30','facebook','cpc','freemium',1,0,0,NULL),
	 ('2023-06-30','partners','cpm','prof-data-analytics',1,0,0,NULL),
	 ('2023-06-30','rutube','social','all-courses',1,0,0,NULL),
	 ('2023-06-30','social','youtube','php-open-lesson-260321',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-30','telegram','cpp','dod-java',1,0,0,NULL),
	 ('2023-06-30','telegram','social','course_completed',1,0,0,NULL),
	 ('2023-06-30','telegram','social','dod-professions',1,0,0,NULL),
	 ('2023-06-30','telegram','social','ni-dlya-kogo-ne-sekret--chto-iz-knig-mozhno',1,0,0,NULL),
	 ('2023-06-30','telegram.me','social','neobhodimyy-minimum-linux-dlya-produktivn',1,0,0,NULL),
	 ('2023-06-30','tg','social','internship_summer23',1,0,0,NULL),
	 ('2023-06-30','vk','cpc','frontend',1,0,0,NULL),
	 ('2023-06-30','vk','cpc','yaintern',1,0,0,NULL),
	 ('2023-06-30','vk','cpp','dod-qa',1,0,0,NULL),
	 ('2023-06-30','vk','cpp','intensive-python',1,0,0,NULL);
INSERT INTO "WITH t1 AS (
    SELECT
        visitor_id,
        MAX(visit_date) AS last_paid_visit
    FROM sessions
    WHERE medium != 'organic'
    GROUP BY visitor_id
),
last_paid_attribution AS (
    SELECT
        s.visitor_id,
        s.visit_date,
        s.source AS utm_source,
        s.medium AS utm_medium,
        s.campaign AS utm_campaign,
        l.lead_id,
        l.created_at,
        l.amount,
        l.closing_reason,
        l.status_id
    FROM t1
    INNER JOIN sessions AS s
        ON t1.visitor_id = s.visitor_id AND t1.last_paid_visit = s.visit_date
    LEFT JOIN leads AS l
        ON s.visitor_id = l.visitor_id
    WHERE s.medium IN ('cpc', 'cpm', 'cpa', 'youtube', 'cpp', 'tg', 'social')
)
SELECT
    DATE(last_paid_attribution.visit_date) AS visit_date,
    last_paid_attribution.utm_source,
    last_paid_attribution.utm_medium,
    last_paid_attribution.utm_campaign,
    COUNT(DISTINCT last_paid_attribution.visitor_id) AS visitors_count,
    COUNT(last_paid_attribution.lead_id) AS leads_count,
    COUNT(last_paid_attribution.amount) 
        FILTER (WHERE last_paid_attribution.closing_reason = 'Успешно реализованно' OR last_paid_attribution.status_id = 142) AS purchases_count,
    SUM(last_paid_attribution.amount) AS revenue
FROM last_paid_attribution
GROUP BY 1, 2, 3, 4
ORDER BY revenue desc nulls last, visit_date asc, visitors_count desc, utm_source asc, utm_medium asc, utm_campaign asc" (visit_date,utm_source,utm_medium,utm_campaign,visitors_count,leads_count,purchases_count,revenue) VALUES
	 ('2023-06-30','vkontakte','social','button-vk',1,0,0,NULL),
	 ('2023-06-30','zen','social','prof-frontend',1,0,0,NULL);

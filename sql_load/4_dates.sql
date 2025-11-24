-- DATA_TYPE Casting
SELECT '2025-07-12' :: DATE,
       false :: BOOLEAN,
       '123' :: INT,
       3.14 :: TEXT;

-- Retrieving
SELECT
    job_title_short AS job,
    job_location,
    job_posted_date
FROM
    job_postings_fact
LIMIT 10;

-- Casting TIME_ZONE to DATE
SELECT
    job_title_short AS job,
    job_location,
    job_posted_date :: DATE AS job_date
FROM
    job_postings_fact
LIMIT 10;

-- Changing TIME_ZONE
SELECT
    job_title_short AS job,
    job_location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' AS job_date
FROM
    job_postings_fact
LIMIT 10;

-- EXTRACT Function for month and year
SELECT
    job_title_short AS job,
    job_location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' AS job_date,
    EXTRACT(YEAR FROM job_posted_date) AS year,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
LIMIT 10;

SELECT
    job_title_short AS job,
    job_location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' AS job_date,
    EXTRACT(YEAR FROM job_posted_date) AS year,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact;

-- Job_Count BY Month
SELECT
    COUNT(job_id) AS job_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
GROUP BY
    month
ORDER BY
    job_count DESC; 

-- Data Analyst job_count BY Month
SELECT
    COUNT(job_id) AS job_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'    
GROUP BY
    month
ORDER BY
    job_count DESC;

SELECT
    job_schedule_type AS job_type,
    AVG(salary_hour_avg) AS hr_avg,
    AVG(salary_year_avg) AS yr_avg
FROM
    job_postings_fact
WHERE
    EXTRACT (YEAR FROM job_posted_date) >= 2023 AND 
    EXTRACT (MONTH FROM job_posted_date) >= 6 AND
    EXTRACT (DAY FROM job_posted_date) >= 1
GROUP BY
    job_type;  

SELECT
    COUNT(job_id) AS job_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY
    month
ORDER BY
    month;  
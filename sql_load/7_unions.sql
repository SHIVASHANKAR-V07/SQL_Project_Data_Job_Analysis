-- UNION
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 1

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 2

-- UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 1

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 2



SELECT
    job_title_short,
    job_posted_date :: DATE,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    (EXTRACT(YEAR FROM job_posted_date) = 2023 AND
    (EXTRACT(MONTH FROM job_posted_date) BETWEEN 1 AND 3) AND
    salary_year_avg >= 70000) AND
    job_title_short LIKE 'Data%'
ORDER BY
    salary_year_avg DESC;
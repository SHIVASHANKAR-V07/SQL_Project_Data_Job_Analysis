-- Case Expressions
SELECT
    job_title,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'On-site'
    END AS location_category
FROM
    job_postings_fact
LIMIT 10;

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'On-site'
    END AS location_category
FROM
    job_postings_fact
GROUP BY
    location_category;
    
SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'On-site'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category    
ORDER BY
    number_of_jobs DESC;    

-- Salary Category
SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN salary_year_avg <= 200000 THEN 'Low Salary'
        WHEN salary_year_avg <= 650000 THEN 'Moderate Salary'
        WHEN salary_year_avg <= 1000000 THEN 'High Salary'
        ELSE 'Unstable'
    END AS salary_category        
FROM 
    job_postings_fact
GROUP BY
    salary_category    
LIMIT 25;

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN salary_year_avg <= 200000 THEN 'Low Salary'
        WHEN salary_year_avg <= 650000 THEN 'Moderate Salary'
        WHEN salary_year_avg <= 1000000 THEN 'High Salary'
        ELSE 'Unstable'
    END AS salary_category        
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'    
GROUP BY
    salary_category
ORDER BY
    number_of_jobs DESC;
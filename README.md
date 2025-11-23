# Introduction
📊 Exploring the basis of " Data Analysis " with real-world 🗺️ data, this project explores 💸 top paying jobs as well as in-demand 🗝️ key skills for top ' DATA ANALYST JOBS ' in 2023.

💡SQL queries ~ [ project_sql folder ](/project_sql/)🗃️

# Background
To understand the implications of SQL, this project guided me throughout the process to make myself familiar with discovering hidden patterns 🧮 and trends from database.

The [ SQL Course ](https://lukebarousse.com/sql) was very useful and it was well-designed to understand each and every topic with clear understandings 🏆 and conceptual examples.

## Main Insights 🧩 :

1. Top-paying data analyst jobs
2. Skills for higher-tier jobs
3. Most in-demand skills
4. Skills with higher salaries
5. Most optimal skills

# Tools I used

Deepened my analysis by using several powerful tools:

- **SQL :** Served as the core component for database querying and discovering hidden trends.

- **PostgreSQL :** DBMS [ Database Management System ] to handle datasets efficiently.

- **Visual Studio Code :** User-friendly interface for creating and executing SQL queries.

- **Git & GitHub :** Essential for version control that made easy to collab my local directory files with the cloud repository service and an detail-oriented project tracking.

# Analysis

This project aims to bring-out the best aspects of a " Data Analyst " Role helping to figure out key points of the job environment.

### 1. Top Paying Data Analyst Jobs
Identifying the top-tier jobs based on Data Analyst role positioned by yearly average salary with location specified as remote job.

```sql
SELECT
    job_id,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date :: DATE
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Breaking down the top paying data analyst jobs in 2023 :

- **Salary Range :** Top 10 paying jobs significantly ranges from $184,000 to $650,000 indicating the role potential.
- **Company Verstality :** Different companies provide these high stakes for the role like SmartAsset, AT&T and Meta.
- **Job Diversity :** Same Data Analyst role have different specialization from Director to Principal.

### 2. Skills for Top Paying Jobs
Understanding the different skills that are required for high-paying job roles.

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
Frequent skills for top paying Data Analyst roles in 2023 :

- **SQL** is leading with a head-start of ' 8 '.
- **Python** takes the runner-up position with count of ' 7 '.
- **Tableau** is following the race in third place trailed by **R**, **Snowflake**, and **Pandas**.

![Skills for Top Paying Jobs](assets\2_top_paying_job_skills.png)
*Bar Chart Visualisation for top paying job skills was genearated using ChatGPT*

### 3. Most In-Demand Skills

This mainly focuses on skills that are needed the most with a higher degree of demand.

```sql
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```
Most demanded skills for a Data Analyst role in 2023 :

- **SQL** and **Excel** takes up the top position as they serve the fundamentals for storing and manipulating data.
- **Python** stands out as the best **programming language** for its applications and verstality.
- **BI Tools** - **Tableau** and **Power BI** bring out best for data visualization and empowers decision support.

### 4. Skills with Higher Salaries 

Finding out the Skills that actually pays with the highest salaries.
```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
Insights about Skills paying top salaries :

- High Demand for **Big Data** & **ML [ Machine Learning ] Skills**.
- **Software Development** and **Deployment** Proficiency.
- Cloud Computing Expertise - **ElasticSearch** and **DataBricks**.

![Top Paying Skills](assets\4_top_paying_skills.png)
*Bar Chart Visualization for top paying skills was generated using ChatGPT*

### 5. Optimal Skills 
Combining results from demand and salary data, this focuses on streamlining skills that have both high demand as well as salaries.
```sql
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
Recognising most Optimal Skills required for Data Analyst role in 2023 :

- **High-Demand Programming Languages** : Python and R.
- **Cloud Technology** : Snowflake, Azure, AWS and BigQuery.
- **BI Tools** : Tableau and Looker.
- **DBMS** : Oracle and NoSQL.

# What I Learned

Started with a magnificent ride with data and got the exposure of SQL tools and their use cases :

- **Query - Making** : Learned the art of making complex queries and made myself comfortable with basic CRUD Operations.
- **Data Aggregation** : Got familiar with GROUP BY clause and aggregate functions like SUM() and COUNT() and where to use them.
- **DBMS** : Made myself comfortable with popular Database Management System - PostgreSQL and query management.

# Closing Thoughts

This project enhanced my SQL Skills and made me to write complex queries and gave a detailed approach on how to handle data and finding out the hidden insights with high potential for a data-driven decision. 
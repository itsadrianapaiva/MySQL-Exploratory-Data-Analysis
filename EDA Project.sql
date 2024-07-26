-- Exploratory Data Analysis (EDA)

-- 1. Understand the data
-- 2. Understand distribution
-- 3. Examine relationships
-- 4. Get a summary
-- 5. Analyze categorical data

-- For this phase there's not one specific agenda I have to meet.
-- I'm going to be exploring the dataset and see what I find.
-- My goal is to find trends, patterns or anything interesting like outliers.


SELECT *
FROM world_layoffs.layoffs_staging2;

-- I start by looking at percentage to see how big these layoffs were
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM world_layoffs.layoffs_staging2;

-- Companies that had 1 which is basically 100 percent of their company laid off
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- If I order by funds_raised we can see how big some of these companies were
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 1
ORDER BY funds_raised DESC;
-- funds_raised are in millions and we can see big companies like Quibi who raised almost 2 millions and went under

-- Looking at the companies with biggest layoffs
SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;
-- I can recognize many big companies who let a lot of people go

-- Checking the date it all started
SELECT MIN(`date`), MAX(`date`)
FROM world_layoffs.layoffs_staging2;
-- It seems like right after COVID hit United Stated


-- Looking into most layoffs through other relevant columns

SELECT industry, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT *
FROM world_layoffs.layoffs_staging2;

SELECT country, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY YEAR (`date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY stage
ORDER BY 1 DESC;

-- I'm going to looking into the progression of layoff

SELECT *
FROM world_layoffs.layoffs_staging2;

SELECT SUBSTRING(`date`, 1,7) AS `MONTH`, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE SUBSTRING(`date`, 1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

-- Rolling total of layoffs per month

-- I'm going to use the query above in a CTE to get the rolling total off of it
WITH Rolling_Total AS 
(
SELECT SUBSTRING(`date`, 1,7) AS `MONTH`, SUM(total_laid_off) AS t_layoff
FROM world_layoffs.layoffs_staging2
WHERE SUBSTRING(`date`, 1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, t_layoff,
SUM(t_layoff) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;

-- With that information about the progression of layoffs over a year 
-- I'm going to focus on the companies
SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT company, YEAR (`date`), SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

-- Ranking the most of layoffs per year by company

WITH Company_Year (company, years, total_laid_off) AS 
(
SELECT company, YEAR (`date`), SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(
SELECT *, 
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <=5;
-- Through the CTE I decided to filter off of the rank to keep the top 5 companies 
-- that had more layoffs per year







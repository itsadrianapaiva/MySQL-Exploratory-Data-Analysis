<h1>Exploratory Data Analysis (EDA)</h1>

<h2>Overview</h2>
<p>This project involves performing Exploratory Data Analysis (EDA) on a dataset containing information about layoffs, which I previously cleaned in another project. The primary objective was to understand the data, analyze its distribution, examine relationships between different variables, and perform a categorical analysis. By the end of this project, I was able to rank the top 5 companies with the most layoffs per year from 2020 to the present. 
</p>
<h2>Dataset</h2>
<ul>
<li><strong>Source:</strong> Kaggle https://www.kaggle.com/datasets/swaptr/layoffs-2022</li>
<li><strong>Description:</strong> The dataset contains records of layoffs, including details such as company name, industry, total laid off, date of layoff, and other relevant attributes.</li>
</ul>
<h2>Objectives</h2>
<ul>
<li>Understand the structure and content of the dataset.</li>
<li>Analyze the distribution of key variables.</li>
<li>Examine relationships between different variables.</li>
<li>Summarize the data to gain insights.</li>
<li>Perform a categorical analysis of layoffs.</li>
<li>Rank the top 5 companies with the most layoffs per year from 2020 to the present.</li>
</ul>
<h2>Steps Performed</h2>

<h3>1. Data Understanding</h3>
<ul>
<li>Loaded the dataset and performed an initial inspection to understand its structure and content.</li>
<li>Checked data types, identified missing values, and examined basic statistics. (previously done on a <a href="https://github.com/itsadrianapaiva/MySQL-Data-Cleaning">Data Cleaning Project</a>)</li>
</ul>

<h3>2. Distribution Analysis</h3>
<ul>
<li>Analyzed the distribution of numerical variables such as <code>total_laid_off</code> and <code>percentage_laid_off</code> .</li>
<li>Identified any skewness or outliers in the data.</li>
</ul>

<h3>3. Relationship Examination</h3>
<ul>
<li>Explored relationships between key variables using correlation analysis.</li>
<li>Used SQL CTEs to investigate relationships between different tables in the dataset.</li>
</ul>
<h3>4. Data Summary</h3>
<ul>
<li>Generated summary statistics for the dataset.</li>
<li>Created pivot tables and aggregate views to summarize data by different categories.</li>
</ul>

<h3>5. Categorical Analysis</h3>
<ul>
<li>Analyzed categorical variables such as <code>industry</code> and <code>company</code> to understand the distribution of layoffs across different categories.</li>
</ul>

<h3>6. Top Companies Ranking</h3>
<ul>
<li>Grouped the data by year and company to calculate the total number of layoffs per year for each company.</li>
<li>Ranked companies by the total number of layoffs each year from 2020 to the present.</li>
<li>Identified and listed the top 5 companies with the most layoffs per year.</li>
</ul>

<h2>Tools Used</h2>
<ul>
<li>SQL for data extraction, transformation, manipulation and analysis</li>
<li>MySQL server and database management</li>
</ul>

<h2>Results</h2>
<ul>
<li>Successfully understood the structure and content of the layoff dataset.</li>
<li>Analyzed the distribution and relationships of key variables.</li>
<li>Summarized the data to provide meaningful insights.</li>
<li>Performed a categorical analysis of layoffs by industry and company.</li>
<li>Ranked the top 5 companies with the most layoffs per year from 2020 to the present.</li>
</ul>

<h2>Conclusion</h2>
<p>This EDA project provided valuable insights into the layoff trends in recent years.
  The analysis helped identify key patterns and relationships within the data. 
  The ranking of the top 5 companies with the most layoffs per year highlights significant trends in the job market since 2020.</p>



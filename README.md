Overview of the Case Study

This project focuses on analysing a coffee shop’s transactional sales data to support business growth and improve product performance. The dataset consists of daily sales records, including information such as transaction date and time, product details, store location, unit price, and quantity sold.
The objective of the analysis was to extract meaningful insights from historical data to help management understand:

	•	Which products generate the most revenue
	•	What times of day the store performs best
	•	Sales trends across different products and time intervals
	•	Opportunities to improve overall sales performance

Methodology & Approach

The project followed a structured data analytics workflow:
 
 Data Collection & Cleaning
	•	Imported the raw CSV dataset into Databricks
	•	Cleaned and validated the data (handled missing values, corrected formats)
	•	Ensured consistency in date and time fields
 
 Data Transformation (ETL Process)
	
	Created calculated fields:
	•	Total Revenue = Unit Price × Transaction Quantity
	•	Derived time-based features:
	•	Hourly and 30-minute intervals for deeper analysis
	•	Structured the dataset for efficient querying

Data Analysis (SQL in Databricks)

	•	Performed aggregations using SQL (SUM, COUNT, GROUP BY)
	•	Analysed data across multiple dimensions:
	•	Product type and category
	•	Product-level performance
	•	Store location
	•	Time of day

Data Visualisation

	•	Built dashboards using Power BI / Excel
	•	Created visualisations such as:
	•	Revenue by product/category
	•	Sales trends over time
	•	Peak vs off-peak hours

Project Planning

	•	Designed a data flow and architecture diagram in Miro/Canva, outlining:
	•	Data source
	•	ETL pipeline
	•	Storage (Databricks Lakehouse)
	•	Analytics and visualisation layers

Key Insights & Findings

The analysis revealed several important business insights:

Product Performance
	•	Certain products (e.g. coffee-based items) generate the highest revenue
	•	Some products have high sales volume but lower revenue contribution
	•	Low-performing products were identified as potential candidates for promotion or removal

Time-Based Trends

	•	Sales peak during specific times of the day (e.g. morning hours)
	•	Off-peak periods present opportunities for targeted promotions

Store & Category Insights

	•	Variations in performance across store locations
	•	Some product categories contribute more significantly to overall revenue

Sales Trends

	•	Clear patterns in customer purchasing behaviour over time
	•	Opportunities to optimise staffing, stock levels, and marketing strategies

Summary

This project demonstrates how raw transactional data can be transformed into actionable insights using data analytics techniques. By leveraging SQL, data modelling, and visualisation tools, key business questions were answered, enabling data-driven decision-making.

The findings provide practical recommendations to:

	•	Improve product offerings
	•	Optimise pricing and promotions
	•	Enhance operational efficiency
	•	Support strategic growth initiatives

Tools & Technologies Used

	•	Databricks → Data processing, SQL analysis, and storage
	•	SQL → Data querying, aggregation, and transformation
	•	Miro/Canva → Data flow and project planning (architecture diagram)
	•	Power BI / Excel → Data visualisation and dashboard creation
	•	GitHub → Project documentation and version control

Final Note

This project highlights the value of data analytics in transforming business operations by turning data into meaningful insights that drive smarter decisions.

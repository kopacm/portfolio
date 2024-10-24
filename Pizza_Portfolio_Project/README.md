# Portfolio Project: Pizza DB

#### Made in: Quick DBD & MYSQL & Looker studio

## Fictional Task:
- New Pizza Store is running takeout and delivery business. 
The owner requires to design and build relational database that allow him to capture and store all of important 
information and data that the business generates. This will help him to monitor business performance in dashboards

### Clients wants to know:
- Customer orders information
- When it’s time to order new stock
- Which staff members are working when
- The staff salary information

### My Approach:
1. Design and built mock-up 
2. Collect and normalize the data 
	- I created fictional data - [see example csv](CSV/orders.csv) 
3. Define the table relationships and create relational database 
	- [see code here](PizzaDB.sql) or [graphics here](relational_database.png)
4. Create all queries in SQL 
	- see Queries [orders_query](QUERY/Dashboard_1_orders_query.md), [stock_query1](QUERY/Dashboard_2_stock_query1.md), [stock_query2](QUERY/Dashboard_2_stock_query2.md), [staff_query](QUERY/Dashboard_3_staff_query.md)
5. Create CSV from queries for vizualization
	- CSV ready for visualization [orders](VISUALIZATION/CSV/orders.csv), [stock_1](VISUALIZATION/CSV/stock_1.csv), [stock_2](VISUALIZATION/CSV/stock_2.csv), [staff](VISUALIZATION/CSV/staff.csv)
6. Visualize dashboards in Looker studio using CSV from Queries
	- [see link here](https://lookerstudio.google.com/reporting/12682c81-25b5-40e9-9856-e93422b88a84) or [pdf here](VISUALIZATION/Report_pizza.pdf)



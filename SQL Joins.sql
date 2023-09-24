/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 
SELECT products.Name, categories.Name
FROM products
 LEFT JOIN categories
 ON products.CategoryID = categories.CategoryID
 WHERE categories.CategoryID LIKE 1;

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT products.Name, products.Price, reviews.Rating
FROM products
LEFT JOIN reviews ON
products.ProductID = reviews.ProductID
WHERE Rating = 5;

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT sales.EmployeeID, employees.FirstName, employees.LastName, SUM(Quantity) as 'Total'
FROM sales
LEFT JOIN employees ON
employees.EmployeeID = sales.EmployeeID
group by sales.EmployeeID
ORDER BY Total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT categories.Name as "Category Name", departments.Name as 'Department Name'
FROM categories
LEFT JOIN departments ON
categories.DepartmentID = departments.DepartmentID
WHERE categories.name = "Games" OR categories.Name = "Appliances";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

SELECT products.Name, SUM(sales.Quantity * sales.PricePerUnit) as 'Total Sales', SUM(Quantity) as ' Total Quantity Sold'
FROM products
INNER JOIN sales ON
sales.ProductID = products.ProductID
WHERE products.Name LIKE "%Macbook%";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT products.Name as "Product Name", reviews.Reviewer as "Reviewer Name", reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews 
on products.ProductID = reviews.ProductID
WHERE reviews.Rating = 1 AND products.ProductID = 857;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, SUM(sales.Quantity) as "Total Items Sold"
FROM employees
INNER JOIN sales on employees.EmployeeID = sales.EmployeeID
INNER JOIN products on sales.ProductID = products.ProductID
GROUP BY employees.EmployeeID, products.ProductID
ORDER BY employees.FirstName;
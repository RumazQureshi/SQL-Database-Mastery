-- 1.Fetch following details
-- Result: Order No, Order Date, Product Name
-- Query: 
select o.orderid as "Order No", o.orderdate as "Order Date",p.productid as "Product Name"
from orders o 
join orderdetails od on o.orderid = od.orderid
join products p on p.productid = od.productid;

-- 2.Fetch following details
-- Result: Order No, Order Date, Product Name, Customer Name
-- Query: 
select o.orderid as "Order No",o.orderdate as "Order Date",p.productid as "Product Name",o.customerid as "Customer Name"
from orders o
join orderdetails od on o.orderid=od.orderid
join products p on p.productid = od.productid;

-- 3.Fetch following details
-- Result: Order No, Order Date, Product Name, Category Name, Customer Name
-- Query: 
select o.orderid as "Order No",o.orderdate as "Order Date",p.productid as "Product Name",p.categoryid as "Category Name",o.customerid as "Customer Name"
from orders o
inner join orderdetails od on o.orderid=od.orderid
inner join products p on p.productid = od.productid;	

-- 4.Select all orders having products belonging to ‘Sea Food’ category 
-- Result: OrderNo, OrderDate, Product Name
-- Query: 
select o.orderid,o.orderdate,p.productname
from orders o 
inner join orderdetails od on o.orderid = od.orderid
inner join products p on p.productid = od.productid
inner join categories cs on p.categoryid =cs.categoryid 
where cs.categoryname='Seafood';

-- 5.List suppliers in the order of no. of products supplied (Supplier Name, No Of Products). 
-- Result: Supplier Name, No. of Products
-- Query: 
select s.companyname as "Supplier Name",count(p.productid) as "No of Products"
from suppliers s
inner join products p on p.supplierid = s.supplierid
group by s.companyname
order by count(p.productid) DESC;

-- 6.Select Suppliers supplying more than 4 products. 
-- Result: Supplier Name
-- Query: 
-- select s.companyname as "Supplier Name"
-- from suppliers s
-- inner join products p on p.supplierid = s.supplierid
-- group by s.companyname
-- having count(p.productid)>4;

-- 7.Fetch no. of employees working in each region. 
-- (RegionName, No. of employees)
-- Query: 
-- select r.regiondescription as "Region Name" , count(distinct et.employeeid) as "No of Employees"
-- from employeeterritories et
-- inner join territories t on et.territoryid = t.territoryid
-- inner join region r on r.regionid = t.regionid
-- group by regiondescription; 

-- 8. Fetch no. of employees in each region. If there is no employee in any region, even then region name should appear in the list with employee count of 0.
-- (RegionName, No. of employees)
-- Query: 
-- select r.regiondescription as "Region Name", count(distinct et.employeeid) as "No of Employees"
-- from region r
-- left join territories t on r.regionid = t.regionid
-- left join employeeterritories et on t.territoryid = et.territoryid
-- group by r.regiondescription;

-- 9.Fetch Customers who have not placed any order. (Customer Name)
-- Query: 
-- select c.contactname 
-- from customers c
-- left join orders o on c.customerid = o.customerid
-- where o.orderid is null;

-- 10.Select Top 3 employees of company. Employees are ranked on the basis of no. of orders they have processed.
-- (ROWNUM <= 3, ORDER BY number of orders processed)
-- Query: 
-- select e.firstname || ' ' || e.lastname as employeename, count(o.orderid) as total_orders
-- from employees e
-- join orders o on e.employeeid = o.employeeid
-- group by e.firstname, e.lastname
-- order by total_orders desc
-- fetch first 3 rows only;

-- 11. Select orders in which products of neither ‘Meat/Poultry’ nor ‘Dairy Products’ categories exist. (Order ID)
-- Query: 
-- select distinct o.orderid 
-- from orders o
-- join orderdetails od on o.orderid = od.orderid
-- join products p on p.productid = od.productid
-- join categories c on c.categoryid = p.categoryid
-- where o.orderid not in (
--     select o2.orderid 
--     from orders o2
--     join orderdetails od2 on o2.orderid = od2.orderid
--     join products p2 on p2.productid = od2.productid
--     join categories c2 on c2.categoryid = p2.categoryid
--     where c2.categoryname in ('meat/poultry', 'dairy products') );

-- 12.Select total amount of each order.
-- Result: Order ID, Total Amount
-- [Total amount is calculated by summing up (Unit Price * Qty)-Discount in order details.]
-- Query: 
-- select orderid, sum((unitprice * quantity) - discount) as total_amount
-- from orderdetails
-- group by orderid;

-- 13.Find country to which maximum of customers belong.
-- Query: 
-- select country
-- from (
--     select country, COUNT(*) as customer_count
--     from customers
--     group by country
--     order by customer_count desc
-- )
-- where rownum = 1;

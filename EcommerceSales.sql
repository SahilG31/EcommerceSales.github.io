
#Task 1

#Find the list of email IDs of all the customers

select Email_ID as "Email addresses of Customers" from public.customers;



#Task 2

#Get all attributes of the vendors data

select * from public.vendors;



#Task 3

#Check the first 5 first names of customers

select First_Name as "First Name of Customers" from public.customers limit 5;



#Task 4

#Check the list of unique ages of vendors for each gender

select distinct Gender,Age from public.vendors;



#Task 5

#Check for count of unique customers in the Customers dataset

select * from public.sales;

select count(distinct(ID)) from public.customers;



#Task 6

#Check for count of unique customers who made a purchase at the store

select count(distinct (Customer_ID)) from public.sales

where Sale_Amount>0;



#Task 6

#Find the unique list of first name and last name of customers

select distinct first_name,last_name from public.customers;



#Task 7

#Find the count of distinct dates that sales were made on in the month of February

select count(distinct Sale_Date ) from public.sales

where Sale_Date between '2020-02-01' and '2020-02-28';





#Task 8

#Find the age and email id of the customer by the name Jasmine.

select Age,Email_ID from public.customers

where first_name='Jasmine';



#Task 9

#Find the number of transactions that took place all dates except for 18th 

#January 2020 and 1st March 2020

select count(Sale_ID) from public.sales

where Sale_date not in ('2020-01-18','2020-03-01');



#Task 10

#Check first name of all the Male customers

select first_name from public.customers

where upper(gender)='M';



#Task 11

#Find the unique list of first name of customers who either have ID more

#than 15000 or are female and at least 34 years old.

select distinct first_name from public.customers

where ID>15000 or (upper(gender)='F' and age>=34);





#Task 12

#Find out how many returns (negative sale amount) happened between 1st Jan and 1st March

select count(Sale_Amount) from public.sales

where Sale_Amount<0 and Sale_Date between '2020-01-01' and '2020=03-01';





#TASK 13

#Find first name of the customers who have a 2 in their email ID.

select first_name from public.customers

where email_ID like '%2';



#TASK 14

#Find list of email id of the customers whose last name contains the letter ‘N’.

select email_ID from public.customers

where upper(last_name) like '%N%';





#TASK 15

#Find first name and last name of vendors with either first name or

#last name as one of the following : Peake,Matt,Simon,Dyer

select * from public.vendors;

select First_Name , Last_Name from public.vendors 

where first_name in ('Peake','Matt','Simon','Dyer') or last_name in ('Peake','Matt','Simon','Dyer');





#TASK 16

#Find first name of all customers whose first name has the character ‘a’ as the second letter

select first_name from public.customers

where first_name like ('_a%');





#TASK 17

#Find first name of all vendors whose first name has the character ‘a’

select First_Name from public.vendors

where upper(First_Name) like ('%A%');





#TASK 18

#Considering only sales (that is, not considering returns), find the lowest and highest sale amount that happened

#between 14th January and 8th April 2020.

select min(Sale_Amount) as "Lowest_Sale_Amount",max(Sale_Amount) as "Maximum_Sale_Amount" 

from public.sales

where Sale_Amount>0 and Sale_Date between '2020-01-14' and '2020-04-08';





#TASK 19

#Find the first and last date on which a sale happened.

select min(Sale_Date) as "First_Date" , max(Sale_Date) as "Last_Date"

from public.sales

where Sale_Amount>0;





#TASK 20

#Find the first date that a transaction took place in the month of April

Select min(Sale_date) as "First_Day_Of_Transaction"

from public.sales

where Sale_Date>='2020-04-01' and Sale_Date<='2020-04-30';





#TASK 21

#For each customer, calculate the number of dates he made a trip to the store.

select * from public.customers;

select * from public.sales;

select Customer_ID,count(Sale_date) as "trips" from public.sales

where (Sale_Amount>0 or Sale_Amount<0)

group by Customer_ID;





#TASK 22

#Find the sum of sale amount, the average of sale amount, the max sale amount and the min

#sale amount for all transactions that took place in the month of March

select sum(Sale_Amount) as "Sum",avg(Sale_Amount) as "Average" , max(Sale_Amount) as "Maximum",

min(Sale_Amount) as "Minimum" from public.sales

where Sale_date between '2020-03-01' and '2020-03-31';





#TASK 23

#Find unique list of first name and last names of customers.

select distinct first_name,last_name from public.customers;



select first_name, last_name from public.customers

group by first_name,last_name;





#TASK 24

#How many vendors are there who have a last name?

select * from public.vendors;





#TASK 25

select count(last_name) as "count of last name" from public.vendors;





#TASK 26

#Find the unique dates on which a transaction/sale occurred in 

#January, but you can’t use DISTINCT keyword

select Sale_Date from public.sales

where Sale_Date between '2020-01-01' and '2020-01-31'

group by Sale_Date;





#TASK 27

#Find the total sale amount on each day a transaction was made but

#consider only those dates where more than one customer made a purchase.

Select Sale_Date , sum(Sale_Amount) from public.sales

where (Sale_Amount>0 or Sale_Amount<0) 

group by Sale_Date

having count(Customer_ID)>1;





#TASK 28

#Find a list of pair of customer ID and vendor ID where a customer

#has been billed by same vendor more than once.

select * from public.sales;

select customer_ID , vendor_id from public.sales

group by customer_ID,vendor_ID

having count(vendor_ID)>1;





#TASK 29

#Get the total sale amount that each vendor has been independently responsible for, 

#but only considering those vendors whose first transaction was after 1st Feb 2020.

select vendor_ID , sum(Sale_Amount) from public.sales

group by vendor_ID

having min(Sale_Date)>'2020-02-01';





#TASK 30

#Find the transaction id (sale_id) and the sale amount of each transaction that

#Frank (customer) made at the store.

select sale_ID , Sale_Amount from public.sales

where Customer_ID=(select ID from public.customers where First_Name='Frank');




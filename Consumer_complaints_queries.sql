Create Database consumer_complaints;
use consumer_complaints;
show tables;
select * from table_name;
describe table_name;

-- renaming table name 
alter table table_name 
rename  to data;

-- table name is data

select * from data;
describe data;



-- beginner queries

-- select all columns
select * from data;
-- select product name and issues
select data.product_name,data.issue from data;

-- Filter complaints submitted via 'Web'

select *
from data
where data.submitted_via='Web';



-- Find complaints from 'california' which is ca in state_name column
select * from data
where state_name='CA';


-- Get unique products
select distinct(product_name) from  data;

-- count how many complaints are there
select count(*) as total_complaints from data;


-- complaints recieved in july (month 7)
select * from data
where date_received like '__-07-__';

-- show complaints for specific company;
select * from data
where company='Bank of America';

-- Order complaints by date received (latest first)
select * from data
order by (date_received) desc;

-- Check how many complaints were submitted by phone
select count(*) from data
where data.submitted_via='Phone';




select * from data;



-- Intermediate queries

-- count complaints per product
select product_name,count(product_name) as complaint_counts
from data
group by product_name;

-- top 5 companies with most complaints
select company,count(*) as total_complaints
from data
group by company
order by count(*) desc
limit 5;

select * from data;

-- Monthly complaints trend

select date_received as Months, count(*) as complaints
from data
group by (date_received)
order by date_received;


-- Count disputes vs no disputes
select consumer_disputed ,count(*)  
from data 
group by consumer_disputed;


-- Complaints per state
select state_name, count(state_name) as total_complaints
from data
group by state_name
order by count(state_name) desc;



-- Timely response ratio
select timely_response,count(timely_response) as total_responses
from data
group by timely_response;


-- Complaints submitted by each channel
select submitted_via , count(*) 
from data 
group by submitted_via
order by count(*) desc;


select * from data;
-- Get total zip code by state (just for fun – not meaningful)

select state_name , avg(zip_code) as avg_zip_codes
from data
group by state_name
order by avg(zip_code) desc;

-- total zip codes make more sense
select state_name , count(zip_code) as avg_zip_codes
from data
group by state_name
order by avg(zip_code) desc;


-- Complaints with narrative
select * from data
where consumer_complaint_narrative is not null;



-- Get all complaints tagged as 'Servicemember'
select * from data
where tags like '%Servicemember%';





-- advance queries
-- Get complaint count and percentage share by company

select * from data;


select company,count(*) as total,
 ROUND(count(*) * 100.0 / (select count(*) from data),2) as percentage_share
from data 
group by company
order by count(*) desc;

-- Company response breakdown per product
select product_name,company_response_to_consumer,
count(company_response_to_consumer) as total_response 
from data
group by product_name,company_response_to_consumer;


 

-- Compare dispute ratio by product

select * from data;
select product_name,sum(consumer_disputed= "Yes") as disputed,
count(consumer_disputed) as total,
Round(Sum(consumer_disputed= 'Yes') * 100.0 /count(consumer_disputed),2) as dispute_ratio
from data
group by product_name;


-- Find top 3 issues for each product

select * from data;
select product_name,issue,complaint_count
from (select product_name,issue,count(issue) as complaint_count,
		ROW_NUMBER() OVER 
        (PARTITION BY product_name Order by Count(issue) Desc) As rr
from data         
group by product_name,issue) as ranked
where rr <=3;


-- Complaints not responded timely and disputed
SELECT * FROM data
WHERE timely_response = 'No' AND consumer_disputed = 'Yes';



-- Count of complaints with missing company responses
select * from data;
select  count(company_response_to_consumer) as responses
from data 
where company_response_to_consumer is null or company_response_to_consumer='';

-- -- Count of complaints with 'closed' company responses
select count(company_response_to_consumer) as responses
from data 
where company_response_to_consumer ='closed';



-- Find complaint durations (date sent - date received)
select complaint_id, DateDiff(date_sent_to_company,date_received) as durations
from data;

-- State with highest number of timely responses
select state_name,count(state_name) as total
from data
where timely_response='yes'
group by state_name
order by count(state_name) DESC;


-- Complaints with long narratives (over 500 characters)
select * from data
where length(consumer_complaint_narrative)> 500;


-- Most disputed company

select company, count(consumer_disputed='Yes') as total_disputes
from data
group by company
order by total_disputes desc
limit 1;
/* What It Does:
consumer_disputed = 'Yes' returns a Boolean value (either TRUE or FALSE), which in MySQL is treated as:
TRUE → 1
FALSE → 0
So this query counts:
How many rows exist per company, regardless of whether the value is 'Yes' or not — but it adds 1 only if the condition is true, else adds 0.
*/


 -- correct query 
SELECT company, COUNT(*) AS disputed_count
FROM data
WHERE consumer_disputed = 'Yes' -- filters rows only where consumer_disputed is = yes
GROUP BY company
ORDER BY disputed_count DESC
LIMIT 1;

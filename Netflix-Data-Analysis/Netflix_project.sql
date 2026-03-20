create database Netflix_project;
use Netflix_project;
-- create Netflix table to store movies and shows data
create table Netflix(
show_ID varchar(10),   
show_type varchar(10),
Title varchar(100),
Director varchar(100),
Country varchar(50),
Date_added varchar(50),
Release_year int,
Rating varchar(10),
Duration varchar(20),
Listed_in varchar(100)
)
-- Insert sample data into Netflix table
insert into Netflix
(show_ID,show_type,Title,Director,Country,Date_added,Release_year,Rating,Duration,Listed_in)
values
('s1','Movie','3 Idiots','Rajkumar Hirani','India','Jan 2020',2009,'PG-13','170 min','Comedy'),
('s2','TV Show','Stranger Things','Duffer Brothers','USA','Jul 2019',2016,'TV-14','4 Seasons','Sci-Fi'),
('s3','Movie','Inception','Christopher Nolan','USA','May 2018',2010,'PG-13','148 min','Sci-Fi'),
('s4','Movie','Dangal','Nitesh Tiwari','India','Aug 2019',2016,'PG','161 min','Drama');
-- Analysis Queries
-- count nuumer of Movies vs Shows
select
show_type,
count(*) as total_count
from Netflix
group by show_type;
-- Find most common genre
select
Listed_in,
count(*) as total_count
from Netflix
group by Listed_in
order by total_count DESC;
-- Movies released after 2015
select
Title,
Release_year
from Netflix
where Release_year > 2015;
-- Count show by country 
select
Country,
count(*)as total_shows
from Netflix
group by Country
order by total_shows DESC;
--Find average release year
select
AVG(Release_year) as avg_release_year
from Netflix;








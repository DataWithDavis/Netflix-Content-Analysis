create database netflix_dataset;

use netflix_dataset;
 
select * from
netflix_titles limit 5;

# Count Total Records
select count(*) as total_title
from netflix_titles;

# view the table structure
describe netflix_titles;

# Display all data
select * from netflix_titles;

# Display specific columns
select title, type, release_year
from netflix_titles;

# Find unique content rating 
select distinct rating
from netflix_titles;

# Find only movies
select * from 
netflix_titles
where type = "movie";

# Find only tv shows
select * from 
netflix_titles
where type = "tv show";

# Movies release after 2020
select title, release_year
from netflix_titles
where release_year > 2020;

# Top 10 newest titles
select title, release_year
from netflix_titles
order by release_year desc
limit 10;

# count movies and tv shows
select type,
count(*) as total_title
from netflix_titles
group by type;

# Count titles by rating
select rating,
count(*) as total_title
from netflix_titles
group by rating
order by total_title desc;

# Titlesc release each year
select release_year,
count(*) as total_title
from netflix_titles
group by release_year
order by release_year; 

# Average release year
select avg(release_year) as 
average_release_year
from netflix_titles; 

# Oldest and Newest release year
select 
	min(release_year) as oldest_year,
	max(release_year) as newest_year
from netflix_titles;

# Having clause
select rating,
	count(*) as total_title
from netflix_titles
group by rating
having count(*) > 500
order by total_title desc;

# Categorize content as old or new
select title, release_year,
case 
when release_year >= 2015 then "New Content"
else "Old Content"
end as content_category
from netflix_titles
order by release_year asc;

#  count old vs new content
select case
when release_year >= 2015 then "New Content"
else "Old Content"
end as content_category,
count(*) as total_title
from netflix_titles
group by content_category;

# Movies vs tv shows by release year
select release_year, type,
count(*) as total_title
from netflix_titles
group by release_year, type
order by release_year;

# Rating for movies only
select rating,
count(*) as total_title
from netflix_titles
where type = "movie"
group by rating
order by total_title desc;

# Top 10 release years
select release_year,
count(*) as total_title
from netflix_titles
group by release_year
order by total_title desc
limit 10;

# create a CTE
with country_count as (
select country,
count(*) as total_title
from netflix_titles
where country is not null
group by country
order by total_title asc
)

select * from country_count;

# Ranking Countries
with country_count as (
select country,
count(*) as total_title
from netflix_titles
where country is not null
group by country
)
 
select country, total_title,
dense_rank() over(order by total_title desc) as
country_rank
from country_count;

# dense_rank() over(order by total_titles desc

# Basic solution
select country,
count(*) as total_title
from netflix_titles
where country is not null
group by country
order by total_title desc
limit 10;

#  Overall rating distribution
select rating,
count(*) as total_title
from netflix_titles
where rating is not null
group by rating
order by total_title desc;

# Rating distribution for movies
select rating,
count(*) as total_movies
from netflix_titles
where type = "movie"
group by rating
order by total_movies desc;

# Rating distribution for tv shows
select rating,
count(*) as total_movies
from netflix_titles
where type = "tv show"
group by rating
order by total_movies desc;

# Percentage of each rating
select rating,
count(*) as total_title,
round(count(*) * 100.0 / (select count(*)
from netflix_titles), 2) as percentage
from netflix_titles
group by rating
order by total_title desc;

# count titles by release year
select release_year,
count(*) as total_title
from netflix_titles
group by release_year
order by total_title asc;

# Rank release years
select release_year,
count(*) as total_title,
rank() over(order by count(*) desc) as year_rank
from netflix_titles
group by release_year
order by total_title asc;

# Recent content only
select release_year,
count(*) as total_title
from netflix_titles
where release_year >= 2015
group by release_year
order by release_year;

# Top 10 directors
select director,
count(*) as total_title
from netflix_titles
where director is not null
and director <> "Unknown"
group by director
order by total_title desc
limit 10;

# Director with more than 5 titles
select director,
count(*) as total_title
from netflix_titles
where director is not null
and director <> "Unknown"
group by director
having count(*) > 5
order by total_title desc;

# Rank directors
select director,
count(*) as total_title,
rank() over (order by count(*) desc) as
director_rank
from netflix_titles
where director is not null
and director <> "Unknown"
group by director
order by total_title asc;

# Movie director only
select director,
count(*) as total_movies
from netflix_titles
where type = "movie"
and director is not null
and director <> "Unknown"
group by director
order by total_movies desc
limit 10;
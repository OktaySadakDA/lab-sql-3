use sakila;

# 1.How many distinct (different) actors' last names are there?
select count(distinct last_name)
from actor;

# 2.In how many different languages where the films originally produced? (Use the column language_id from the film table)

select count( distinct language_id)
from film;

# 3.How many movies were released with "PG-13" rating?
select count(rating) from film
where rating="PG-13";

# 4.Get 10 the longest movies from 2006.
select* 
from film 
where release_year = '2006' 
order by length desc limit 10;

# 5.How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(rental_date),min(rental_date)) as operating_days 
from rental;

# 6.Show rental info with additional columns month and weekday. Get 20.
select*, month(rental_date) as month, dayofmonth(rental_date) as weekday from rental limit 20;

# 7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, 
case 
	when (dayname(rental_date) = 'Saturday' or 'Sunday') then 'weekend'
	else 'workday'
	end as daytype
from rental;

# 8.How many rentals were in the last month of activity?
select year(rental_date),month(rental_date) from rental limit 10000,20000; # Last month was February 2006

select count(rental_id) as total from rental where rental_date between '2006-02-01' and '2006-02-28';

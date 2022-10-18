-- Lab SQL Queries - Lesson 2.5
-- 1. Select all the actors with the first name ‘Scarlett’.
select * from sakila.actor
where first_name ='Scarlett';

-- 2. Select all the actors with the last name ‘Johansson’.
select * from sakila.actor
where last_name = 'Johansson';

-- 3. How many films (movies) are available for rent?
select count(*) from rental
where return_date is not null; -- 15861 movies are available

-- 4. How many films have been rented?
select count(*) from rental
where return_date is null; -- 183 movies are rented

-- 5. What is the shortest and longest rental period?
select max(rental_duration) from film; -- 7 days is the longest rental period
select min(rental_duration) from film; -- 3 days is the shortest rental period

-- 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select max(length) as max_duration from film; -- 185 mins is the longest duration
select min(length) as min_duration from film; -- 46 mins is the shortest duration

-- 7. What's the average movie duration?
select avg(length) from film; -- The average movie duration is 115,27 mins

-- 8. What's the average movie duration expressed in format (hours, minutes)?
select convert(avg(length), time) from film; -- 1h 15min

-- 9. How many movies are longer than 3 hours?
select count(*) from film
where convert(length, time) > '00:03:00'; -- 0 movies

-- 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select *, concat(first_name, ' ', upper(last_name), ' - ', lower(email)) as name_email from staff;

-- 11. What's the length of the longest film title?
select max(length(title)) from film;
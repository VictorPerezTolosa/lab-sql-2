use sakila;

-- Instructions

-- 1. Select all the actors with the first name ‘Scarlett’.
select * from actor;
select * from actor where first_name = "Scarlett";


-- 2. Select all the actors with the last name ‘Johansson’.
select * from actor where last_name = "Johansson";


-- 3. How many films (movies) are available for rent?
select * from film;
select count(film_id) from film;


-- 4. How many films have been rented?
select * from rental;
select count(rental_id) from rental;


-- 5. What is the shortest and longest rental period?

select *, timestampdiff(minute, rental_date, return_date) as shortest_period from rental
 where timestampdiff(minute, rental_date, return_date) = (select min(timestampdiff(minute, rental_date, return_date)) from rental); -- This is the shortest rental period in minutes
 
select *, timestampdiff(minute, rental_date, return_date) as longest_period from rental
 where timestampdiff(minute, rental_date, return_date) = (select max(timestampdiff(minute, rental_date, return_date)) from rental); -- This is the longest rental period in minutes


-- 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
select * from film;
select title, length as min_duration from film where length = (select min(length) from film); -- Minimum duration of the film
select title, length as max_duration from film where length = (select max(length) from film); -- Maximum duration of the film


-- 7. What's the average movie duration?
select avg(length) as average_duration from film;


-- 8. What's the average movie duration expressed in format (hours, minutes)?
select cast(avg(length) as time) as average_duration from film; -- This give us a time made with the numbers, but it doesn't give us the correct answer
select avg(length/60) from film; -- This gives us the average duration in hours


-- 9. How many movies longer than 3 hours?
select count(title) from film where length > "180";  


-- 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
select concat(first_name, " ", last_name, " - ", lower(email)) as name_and_email_formatted from customer;


-- 11. What's the length of the longest film title?
select title from film;
select title, length(title) as longest_length from film where length(title) = (select max(length(title)) from film);

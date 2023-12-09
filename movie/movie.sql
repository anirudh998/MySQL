create database movies;
use movies;
select * from actor;
select * from cast;
select * from director;
select * from genres;
select * from movie;
select * from movie_direction;
select * from movie_genres;
select * from ratings;
select * from reviewer;

-- # i.	Write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
select mov_title,mov_year,mov_dt_rel from movie where mov_title = 'american beauty';

select mov_title,mov_year,mov_dt_rel from movie where mov_title = 'titanic';

-- # ii.	Write a SQL query to find those movies, which were released before 1998. Return movie title.
select mov_title,mov_year from movie where mov_year<1998;

-- # iii.	Write a query where it should contain all the data of the movies which were released after 1995 and their movie duration was greater than 120.
select * from  movie where mov_year>1995 and mov_time>120;

-- # iv.	Write a query to determine the Top 7 movies which were released in United Kingdom. Sort the data in ascending order of the movie year.
select mov_title, mov_rel_country from movie where mov_rel_country ='UK' order by mov_year asc limit 7;

-- # v.	Set the language of movie language as 'Chinese' for the movie which has its existing language as Japanese and the movie year was 2001.
update movie set mov_lang = 'Chinese' where mov_lang = 'Japanese' and mov_year =2001;

-- # vi.	Write a SQL query to find name of all the reviewers who rated the movie 'Slumdog Millionaire'.
select rev_name from reviewer where rev_id in(select rev_id from ratings where mov_id =(select mov_id from movie where mov_title = 'Slumdog millionaire') group by rev_id);

select rev_name,mov_title from reviewer join ratings using(rev_id) join movie using(mov_id) where mov_title = 'Slumdog millionaire';

-- # vii.	Write a query which fetch the first name, last name & role played by the actor where output should all exclude Male actors.
select act_fname as 'first name',act_lname as 'last name', role as 'role played' from actor join cast using(act_id) where act_gender !='M';#if multiple conditions then use not in

-- # viii.	Write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Fetch all the fields of actor table. (Hint: Use the IN operator).
select concat(act_fname,' ',act_lname) as 'Actors',role from actor join cast using(act_id) where mov_id in( select mov_id from movie where mov_title = 'Annie Hall');

select a.*,mov_title from actor a join cast using (act_id) join movie using (mov_id) where mov_title = 'Annie Hall';

-- # ix.	Write a SQL query to find those movies that have been released in countries other than the United Kingdom. Return movie title, movie year, movie time, and date of release, releasing country.
select mov_title as 'movie title',mov_year as 'movie year',mov_time as 'movie time',mov_dt_rel as 'date of release',mov_rel_country as 'releasing country' from movie where mov_rel_country not in('UK');

-- # x.	Print genre title, maximum movie duration and the count the number of movies in each genre. (HINT: By using inner join)
select gen_title as 'genre title',count(*) ,mov_time from movie join movie_genres using(mov_id) join genres using(gen_id) group by gen_id;

-- # xi.	Create a view which should contain the first name, last name, title of the movie & role played by particular actor.
create view actors_info as
(select act_fname,act_lname,mov_title,role from actor join cast using (act_id) join movie using (mov_id));

-- # xii.	Write a SQL query to find the movies with the lowest ratings
select * from movie;
select mov_title, rev_stars from movie join ratings using(mov_id) order by rev_stars asc limit 1;
select mov_title, rev_stars from movie join ratings using(mov_id) where rev_stars = (select min(rev_stars) from ratings);
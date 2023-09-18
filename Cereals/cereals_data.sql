create database cereals;
use cereals;
select * from cereals_data;

# 1. Add index name fast on name 
create index fast on cereals_data(name);
SELECT MAX(LENGTH(NAME)) FROM CEREALS_DATA;
ALTER TABLE CEREALS_DATA MODIFY NAME VARCHAR(40);
SHOW INDEX FROM CEREALS_DATA;

# 2. Describe the schema of table 
describe cereals_data;

# 3. Create view name as see where users can not see type column [first run appropriate query then create view] 
create view see as (select name,mfr,calories,protein,sodium,fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating,hl_calories from cereals_data);

# 4. Rename the view as saw 
rename table see to saw;

# 5. Count how many are cold cereals 
select count(type) as No_of_cold_cereals from cereals_data where type = 'C';

# 6. Count how many cereals are kept in shelf 3
select count(shelf) as No_of_cereals_kept_in_shelf_3 from cereals_data where shelf =3;

# 7. Arrange the table from high to low according to ratings 
select * from cereals_data order by rating desc;

# 8. Suggest some column/s which can be Primary key
# Ans. Name 

# 9. Find average of calories of hot cereal and cold cereal in one query
select type,avg(calories) from cereals_data group by type; 

# 10. Add new column as HL_Calories where more than average calories should be categorized as HIGH and less than average calories should be categorized as LOW 
alter table cereals_data add column HL_Calories float;
alter table cereals_data modify hl_calories varchar(10);
select avg(calories) from cereals_data;
update cereals_data set HL_Calories = case
 when calories> 106.97 THEN 'HIGH'
 when calories< 106.97 then 'low' END;

# 11. List only those cereals whose name begins with B 
select * from cereals_data where name like('B%');

# 12. List only those cereals whose name begins with F 
select * from cereals_data where name like ('F%');

# 13. List only those cereals whose name ends with s
SELECT * FROM cereals_data where name like ('%s');
 
# 14. Select only those records which are HIGH in column HL_calories
 select * from cereals_data 
where HL_Calories='HIGH';

# 15. Find maximum of ratings
select max(rating) from cereals_data;

# 16. Find average ratings of those were High and Low calories 
select avg(rating),hl_calories from cereals_data group by hl_calories;


# 17. Remove column fat 
alter table cereals_data drop column fat;


# 18. Count records for each manufacturer [mfr] 
select mfr,count(*) from cereals_data group by mfr;

# 19. Select name, calories and ratings only
select name,calories,rating from cereals_data;
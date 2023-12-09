create database insurance;
use insurance;
select * from insurance;
# 1. Count for each categories of region
select region,count(*) from insurance group by region; 

#2. Find 50 records of highest ‘age’ and export data/table to desktop
select * from insurance order by age desc limit 50;
 
#3. Add index name ‘quick’ on ‘id’ 
alter table insurance add index quick(id);

# 4. Describe the schema of table 
describe insurance;

# 5. Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view] 
create view gender as select * from insurance where sex is null;

# 6. Rename the view as ‘type’ 

# 7. Count how many are ‘northwest’ insurance holders 
select region, count(*) from insurance where region = 'northwest';

# 8. Count how many insurance holders were ‘femail’
select sex,count(*) from insurance where sex ='female';
 
# 9. Create Primary key on a suitable column
alter table insurance modify id int primary key;
 
# 10. Create a new column ‘ratio’ which is age multiply by bmi
alter table insurance add column ratio int; 
update insurance set ratio = age*bmi;

# 11. Arrange the table from high to low according to charges 
select * from insurance order by charges desc;

# 12. Find MAX of ‘charges’
select max(charges) from insurance;
 
# 13. Find MIN of ‘charges’
 select min(charges) from insurance;
 
# 14. Find average of ‘charges’ of male and female
select sex,avg(charges) from insurance group by sex;
 
# 15. Write a Query to rename column name sex to Gender
alter table insurance rename column sex to gender;
 
# 16. Add new column as HL_Charges where more than average charges should be categorized as HIGH and less than average charges should be categorized as LOW
alter table insurance add column HL_Charges varchar(10);
select avg(charges) from insurance;
update insurance set HL_charges = case
when charges>13270.42 then 'HIGH'
when charges<13270.42 then 'LOW' end; 

# 17. Change location/position of ‘smoker’ and bring before ‘children’ 
alter table insurance change column children children int after smoker;

# 18. Show top 20 records 
select * from insurance order by id asc limit 20;

# 19. Show bottom 20 records
select * from insurance order by id desc limit 20; 


# 20. Randomly select 20% of records and export to desktop
 select count(*)*0.2 from insurance;
select * from insurance order by rand() limit 268;

# 21. Remove column ‘ratio’ 
alter table insurance drop column ratio;

# 22. Craete one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in  the script itself with remarks by using #
#second highest bmi where sex = male
select * from insurance where gender = 'male' order by bmi desc limit 1,1;
 
# 23. Create a view called Female_HL_Charges that shows only those data where  HL_Charges is High, Female, Smokers and with 0 children
create view female_hl_charges as (select * from insurance where hl_charges = 'high' and children = 'zero children' and smoker = 'yes' and gender = 'female');
select * from female_hl_charges;

# 24. Update children column if there is 0 children then make it as Zero Children, if 1 then one_children, if 2 then two_children, if 3 then three_children, if 4 then four_children if 5 then five_children else print it as More_than_five_children.
alter table insurance modify children varchar(15);
update insurance set children = case
when children = 0 then 'Zero Children'
when children = 1 then 'one children'
when children = 2 then 'two children'
when children = 3 then 'three children'
when children = 4 then 'four children'
else 'five children' end;

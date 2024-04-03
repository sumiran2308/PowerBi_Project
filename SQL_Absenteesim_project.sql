--create a join table
select * from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;

--find the healthiest employee s for the bonus
select * from Absenteeism_at_work
where Social_drinker = 0 and Social_smoker = 0
and Body_mass_index <25 and 
Absenteeism_time_in_hours <(select avg(Absenteeism_time_in_hours) from Absenteeism_at_work)

-- compensation rate increase for the non-smoker/ budget $983,221 so .68 increase per hour and $1414.4 per year
select count(*) as nonsmoker from Absenteeism_at_work
where Social_smoker=0

--optimize this query
select a.ID, r.Reason, Month_of_absence, 
Body_mass_index,
CASE WHEN Body_mass_index <18.5 then 'Underweight'
	WHEN Body_mass_index BETWEEN 18.5 and 25 then 'Healthy weight'
	WHEN Body_mass_index BETWEEN 25 and 30 then 'Overweight'
	WHEN Body_mass_index >18.5 then 'Obese'
	ELSE 'Unknown' END as BMI_category,
CASE WHEN Month_of_absence IN (12,1,2) THEN 'WINTER' 
	WHEN Month_of_absence IN (3,4,5) THEN 'Spring'
	WHEN Month_of_absence IN (6,7,8) THEN 'Summer'
	WHEN Month_of_absence IN (9,10,11) THEN 'Fall'
	ELSE 'UNKNOWN' END as Seasons_names, 
	Seasons, Month_of_absence, Day_of_the_week, Transportation_expense,
	Education, Son, Social_drinker, Social_smoker,
	Pet, Disciplinary_failure, Age, Work_load_Average_day,
	Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;
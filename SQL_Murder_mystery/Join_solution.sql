SELECT * from person
JOIN interview ON person.id = interview.person_id
WHERE 
( address_street_name = 'Northwestern Dr'
 	AND address_number = (SELECT MAX(address_number) FROM person 
	   WHERE address_street_name = "Northwestern Dr"  GROUP BY address_street_name))
	OR
	 (name like '%Annabel%' AND address_street_name = "Franklin Ave")

/*I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
The membership number on the bag started with "48Z". Only gold members have those bags. 
The man got into a car with a plate that included "H42W".

I saw the murder happen, and I recognized the killer from my gym when 
I was working out last week on January the 9th.
*/
SELECT * from person
JOIN drivers_license ON person.license_id = drivers_license.id
JOIN get_fit_now_member ON person.id = get_fit_now_member.person_id
WHERE plate_number LIKE '%H42W%' AND get_fit_now_member.id LIKE '48Z%'

/*
Congrats, you found the murderer! But wait, there's more... If you think you're up
 for a challenge, try querying the interview transcript of the murderer to find 
the real villain behind this crime. If you feel especially confident in your SQL skills, 
try to complete this final step with no more than 2 queries. Use this same 
INSERT statement with your new suspect to check your answer.
*/

SELECT * from person
JOIN drivers_license ON person.license_id = drivers_license.id
JOIN get_fit_now_member ON person.id = get_fit_now_member.person_id
JOIN interview ON person.id = interview.person_id
WHERE plate_number LIKE '%H42W%' AND get_fit_now_member.id LIKE '48Z%'

/*
I was hired by a woman with a lot of money. I don't know her name but I know she's 
around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. 
I know that she attended the SQL Symphony Concert 3 times in December 2017.
*/
  
SELECT * from person
JOIN drivers_license ON person.license_id = drivers_license.id
JOIN facebook_event_checkin f ON person.id = f.person_id
WHERE hair_color = 'red' AND car_make = 'Tesla' 
	AND car_model = 'Model S' AND gender = 'female'
ORDER BY date
LIMIT 1

/* Miranda Priestly */

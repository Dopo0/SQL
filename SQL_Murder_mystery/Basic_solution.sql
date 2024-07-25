SELECT * FROM crime_scene_report
WHERE date=20180115 and type='murder' and city='SQL City'

/*
  R/ Security footage shows that there were 2 witnesses. The first witness 
	lives at the last house on "Northwestern Dr". The second witness, named Annabel, 
	lives somewhere on "Franklin Ave".
*/
  
SELECT * FROM person
WHERE address_street_name='Northwestern Dr' ORDER BY address_number DESC LIMIT 1

/*
id	name	license_id	address_number	address_street_name	ssn
14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949
*/
  
SELECT * FROM person
WHERE name like '%Annabel%' and address_street_name='Franklin Ave'

/*
id	name	license_id	address_number	address_street_name	ssn
16371	Annabel Miller	490173	103	Franklin Ave	318771143
*/
  
SELECT * FROM interview
WHERE person_id in(14887,16371)

/*
person_id	transcript
14887	I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
	The membership number on the bag started with "48Z". Only gold members have those bags.
	The man got into a car with a plate that included "H42W".

16371	I saw the murder happen, and I recognized the killer from my gym when I was working out
	 last week on January the 9th.
*/

SELECT * FROM get_fit_now_member
WHERE membership_status = 'gold' and id like '48Z%'

/*
id	person_id	name	membership_start_date	membership_status
48Z7A	28819	Joe Germuska	20160305	gold
48Z55	67318	Jeremy Bowers	20160101	gold
*/
  
SELECT * FROM drivers_license
WHERE plate_number like '%H42W%'

/*
id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
183779	21	65	blue	blonde	female	H42W0X	Toyota	Prius
423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS
664760	21	71	black	black	male	4H42WR	Nissan	Altima
*/
  
SELECT * FROM person
where license_id in(183779,423327,664760)

/*
id	name	license_id	address_number	address_street_name	ssn
51739	Tushar Chandra	664760	312	Phi St	137882671
67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279
78193	Maxine Whitely	183779	110	Fisk Rd	137882671

Jeremy Bowers
*/
  
SELECT * FROM interview
where person_id in(67318)

/*
person_id	transcript
67318	I was hired by a woman with a lot of money. I don't know her name but I know she's 
	around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S.
	I know that she attended the SQL Symphony Concert 3 times in December 2017.
*/

SELECT * FROM drivers_license
where gender = 'female' and height BETWEEN 65 AND 67 AND hair_color = 'red'
and car_make = 'Tesla' and car_model = 'Model S'

/*
id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
202298	68	66	green	red	female	500123	Tesla	Model S
291182	65	66	blue	red	female	08CM64	Tesla	Model S
918773	48	65	black	red	female	917UU3	Tesla	Model S
*/

SELECT * FROM person
where license_id in(202298,291182,918773)

/*
id	name	license_id	address_number	address_street_name	ssn
78881	Red Korb	918773	107	Camerata Dr	961388910
90700	Regina George	291182	332	Maple Ave	337169072
99716	Miranda Priestly	202298	1883	Golden Ave	987756388
*/

SELECT person_id, COUNT(*) FROM facebook_event_checkin
where event_name= 'SQL Symphony Concert' and date between 20171201 and 20171231
group by person_id
having count(*)=3

/*
person_id	COUNT(*)
24556	3
99716	3

	Miranda Priestly
*/

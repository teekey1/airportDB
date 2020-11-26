Create view passengers_with_contact as
Select p.id, p.name, p.surname, p.age, cd.email, cd.phone, cd.country, cd.city, cd.street
from passengers p
left join contact_details cd on p.contact = cd.id;

Create view flights_with_details as
select f.id, a1.name as airport_from, a2.name as airport_to, fs.date, p.model as plane_model, f.crew
from flights f
left join airports a1 on f.airport_from = a1.id
left join airports a2 on f.airport_to = a2.id
left join flight_schedule fs on f.schedule = fs.id
left join planes p on f.plane = p.id;
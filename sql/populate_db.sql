create or replace function populate_designations() returns void
    language plpgsql
as
$$
begin

    insert into designations(id, designation) values (1, 'pilot');
    insert into designations(id, designation) values (2, 'stewardessa/steward');
    insert into designations(id, designation) values (3, 'office worker');

end;
$$;

select populate_designations();


create or replace function populate_employees()
returns void
language plpgsql
as
$$
begin
    for i in 1..60000 loop
        insert into employees (id, name, surname, email, phone, designation )
        values (i,
        (select name as name1 from names ORDER BY random() limit 1)  ,
        (select surname from surnames ORDER BY random() limit 1),
                (select
          'employee' || i || '@' ||
          (case (random() * 2)::int
            when 0 then 'gmail'
            when 1 then 'hotmail'
            when 2 then 'yahoo'
          end) || '.com'),
        (select floor(random() * (100000000-999999999) + 999999999)::int), random()*(3-1)+1);
    end loop;
end;
$$;

SELECT populate_employees();


create or replace function populate_contact_details() returns void
    language plpgsql
as
$$
begin
    for i in 1..40000 loop
        insert into contact_details (id, email, phone, country, city, street)
        values (i, (select
          'passenger' || i || '@' ||
          (case (random() * 2)::int
            when 0 then 'gmail'
            when 1 then 'hotmail'
            when 2 then 'yahoo'
          end) || '.com'),
        (select floor(random() * (100000000-999999999) + 999999999)::int),
        (select country from cities_countries ORDER BY random() limit 1),
        (select city from cities_countries ORDER BY random() limit 1),
        (select street from streets ORDER BY random() limit 1));
    end loop;
end;
$$;

select populate_contact_details();


create or replace function populate_passengers() returns void
    language plpgsql
as
$$
begin
    for i in 1..40000 loop
        insert into passengers (id, name, surname, age, contact)
        values (i,
        (select name from names ORDER BY random() limit 1),
        (select surname from surnames ORDER BY random() limit 1),
        (select floor(random() * (1-100) + 100)::int),
        i);
    end loop;
end;
$$;

select populate_passengers();


create or replace function populate_airports() returns void
    language plpgsql
as
$$
begin

    insert into airports select * from airports_names order by airports_names.id;

end;
$$;

select populate_airports();


create or replace function populate_planes() returns void
    language plpgsql
as
$$
begin

    insert into planes select * from planes_names order by planes_names.id;

end;
$$;

select populate_planes();


create or replace function populate_flight_schedule() returns void
    language plpgsql
as
$$
begin
    for i in 1..1000 loop
        insert into flight_schedule (id, date, departure, arrival)
        values (i,
        floor(random() * (31-1+1) + 1)::int || '-' || floor(random() * (12-1+1) + 1)::int || '-' || floor(random() * (2022-2021+1) + 2021)::int,
        floor(random() * (24-1+1) + 1)::int || ':' || floor(random() * (59-0+1) + 0)::int,
        floor(random() * (24-1+1) + 1)::int || ':' || floor(random() * (59-0+1) + 0)::int);
    end loop;
end;
$$;

select populate_flight_schedule();


create or replace function populate_crews() returns void
    language plpgsql
as
$$
begin
    for i in 1..1000 loop
        insert into crews (id, name)
        values (i, 'zaloga ' || i);
    end loop;
end;
$$;

select populate_crews();


create or replace function populate_flights() returns void
    language plpgsql
as
$$
begin
    for i in 1..1000 loop
        insert into flights (id, airport_from, airport_to, schedule, plane, crew)
        values (i, floor(random() * (22-1+1) + 1)::int, floor(random() * (22-1+1) + 1)::int, floor(random() * (1000-1+1) + 1)::int, floor(random() * (78-1+1) + 1)::int, floor(random() * (1000-1+1) + 1)::int);
    end loop;
end;
$$;

select populate_flights();


create or replace function populate_tickets() returns void
    language plpgsql
as
$$
begin
    for i in 1..1000 loop
        insert into tickets (id, passenger, flight, employee, booking_date, price)
        values (i, floor(random() * (40000-1+1) + 1)::int, floor(random() * (1000-1+1) + 1)::int, (select id from employees where designation = 3 ORDER BY random() limit 1), (select cast(timestamp '2019-01-01 01:00:00' +
       random() * (timestamp '2020-11-26 24:00:00' -
                   timestamp '2019-01-01 01:00:00') as varchar(50))), floor(random() * (10000-200+1) + 200)::int);
    end loop;
end;
$$;

select populate_tickets();

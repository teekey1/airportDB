CREATE TABLE airports (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    country character varying(100) NOT NULL
);

CREATE TABLE contact_details (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    country character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    street character varying(50) NOT NULL
);

CREATE TABLE crews (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);

CREATE TABLE crews_employees (
    employee_id integer NOT NULL,
    crew_id integer NOT NULL
);

CREATE TABLE designations (
    id integer NOT NULL,
    designation character varying(50) NOT NULL
);

CREATE TABLE employees (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    designation integer NOT NULL
);

CREATE TABLE flight_schedule (
    id integer NOT NULL,
    date character varying(100) NOT NULL,
    departure character varying(100) NOT NULL,
    arrival character varying(100) NOT NULL
);

CREATE TABLE flights (
    id integer NOT NULL,
    airport_from integer NOT NULL,
    airport_to integer NOT NULL,
    schedule integer NOT NULL,
    plane integer NOT NULL,
    crew integer NOT NULL
);

CREATE TABLE planes (
    id integer NOT NULL,
    model character varying(100) NOT NULL
);

CREATE TABLE insert_messages (
    message character varying(500)
);

CREATE TABLE passengers (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    age integer NOT NULL,
    contact integer NOT NULL
);

CREATE TABLE tickets (
    id integer NOT NULL,
    passenger integer NOT NULL,
    flight integer NOT NULL,
    employee integer NOT NULL,
    booking_date character varying(50) NOT NULL,
    price integer NOT NULL
);


ALTER TABLE airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);

ALTER TABLE contact_details
    ADD CONSTRAINT contact_details_pkey PRIMARY KEY (id);

ALTER TABLE crews
    ADD CONSTRAINT crews_pkey PRIMARY KEY (id);

ALTER TABLE designations
    ADD CONSTRAINT designations_pkey PRIMARY KEY (id);

ALTER TABLE employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);

ALTER TABLE flight_schedule
    ADD CONSTRAINT flight_schedule_pkey PRIMARY KEY (id);

ALTER TABLE flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);

ALTER TABLE passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);

ALTER TABLE planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id);

ALTER TABLE tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);

ALTER TABLE flights
    ADD CONSTRAINT airport_from FOREIGN KEY (airport_from) REFERENCES public.airports(id);

ALTER TABLE flights
    ADD CONSTRAINT airport_to FOREIGN KEY (airport_to) REFERENCES public.airports(id);

ALTER TABLE flights
    ADD CONSTRAINT crew FOREIGN KEY (crew) REFERENCES public.crews(id);

ALTER TABLE crews_employees
    ADD CONSTRAINT crew_id FOREIGN KEY (crew_id) REFERENCES public.crews(id);

ALTER TABLE employees
    ADD CONSTRAINT designation FOREIGN KEY (designation) REFERENCES public.designations(id);

ALTER TABLE tickets
    ADD CONSTRAINT employee FOREIGN KEY (employee) REFERENCES public.employees(id);

ALTER TABLE crews_employees
    ADD CONSTRAINT employee_id FOREIGN KEY (employee_id) REFERENCES public.employees(id);

ALTER TABLE tickets
    ADD CONSTRAINT flight FOREIGN KEY (flight) REFERENCES public.flights(id);

ALTER TABLE tickets
    ADD CONSTRAINT passenger FOREIGN KEY (passenger) REFERENCES public.passengers(id);

ALTER TABLE flights
    ADD CONSTRAINT plane FOREIGN KEY (plane) REFERENCES public.planes(id);

ALTER TABLE flights
    ADD CONSTRAINT schedule FOREIGN KEY (schedule) REFERENCES public.flight_schedule(id);
-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE seats
(
  id SERIAL PRIMARY KEY,
  seat_num TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country INT REFERENCES countries
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure_time TIMESTAMP,
  arrival_time TIMESTAMP,
  airline INT REFERENCES airlines,
  departs_from INT REFERENCES cities,
  arrives_in INT REFERENCES cities
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INT REFERENCES passengers,
  seat INT REFERENCES seats,
  flight INT REFERENCES flights
);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley'), ('Waneta', 'Skeleton'), ('Berkie', 'Wycliff'), ('Alvin', 'Leathes'), ('Cory', 'Squibbes');

INSERT INTO seats
  (seat_num)
VALUES
  ('33B'), ('8A'), ('12F'), ('20A'), ('23D'), ('18C'), ('9E'), ('1A'), ('32B'), ('10D');

INSERT INTO airlines
  (name)
VALUES
  ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

INSERT INTO countries
  (country_name)
VALUES
  ('United States'), ('Japan'), ('France'), ('UAE'), ('Brazil'), ('United Kingdom'), ('Mexico'), ('Morocco'), ('China'), ('Chile');

INSERT INTO cities
  (city_name, country)
VALUES
  ('Washington DC', 1), ('Tokyo', 2), ('Los Angeles', 1), ('Seattle', 1), ('Paris', 3), ('Dubai', 4), ('New York', 1), ('Cedar Rapids', 1), ('Charlotte', 1), ('Sao Paolo', 5), ('London', 6), ('Las Vegas', 1), ('Mexico City', 7), ('Casablanca', 8), ('Beijing', 9), ('Chicago', 1), ('New Orleans', 1), ('Santiago', 10);

INSERT INTO flights
  (departure_time, arrival_time, airline, departs_from, arrives_in)
VALUES 
  (TIMESTAMP '2018-04-08 09:00:00', TIMESTAMP '2018-04-08 12:00:00', 1, 1, 4),
  (TIMESTAMP '2018-12-19 12:45:00', TIMESTAMP '2018-12-19 16:15:00', 2, 2, 11),
  (TIMESTAMP '2018-01-02 07:00:00', TIMESTAMP '2018-01-02 08:03:00', 3, 3, 12),
  (TIMESTAMP '2018-04-15 16:50:00', TIMESTAMP '2018-04-15 21:00:00', 3, 4, 13),
  (TIMESTAMP '2018-08-01 18:30:00', TIMESTAMP '2018-08-01 21:50:00', 4, 5, 14),
  (TIMESTAMP '2018-10-31 01:15:00', TIMESTAMP '2018-10-31 12:55:00', 5, 6, 15),
  (TIMESTAMP '2019-02-06 06:00:00', TIMESTAMP '2019-02-06 07:47:00', 1, 7, 9),
  (TIMESTAMP '2018-12-22 14:42:00', TIMESTAMP '2018-12-22 15:56:00', 6, 8, 16),
  (TIMESTAMP '2019-02-06 16:28:00', TIMESTAMP '2019-02-06 19:18:00', 6, 9, 17),
  (TIMESTAMP '2019-01-20 19:30:00', TIMESTAMP '2019-01-20 22:45:00', 7, 10, 18);

INSERT INTO tickets
  (passenger, seat, flight)
VALUES
  (1, 1, 1), (2, 2, 2), (3, 3, 3), (1, 4, 4), (4, 5, 5), (2, 6, 6), (5, 7, 7), (6, 8, 8), (5, 9, 9), (7, 10, 10);


DROP DATABASE IF EXISTS guitars;
CREATE DATABASE guitars;

\c guitars 

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	username VARCHAR(32),
	password_digest VARCHAR(60)
);

CREATE Table guitarists(
	id SERIAL PRIMARY KEY,
	band_url VARCHAR(2000),
	name VARCHAR(128),
	band VARCHAR(60) REFERENCES bands(id),
	user_id INTEGER REFERENCES users(id)
);

CREATE TABLE bands ( 
	band_name
	...
)

CREATE TABLE guitars(
	id SERIAL PRIMARY KEY,
	guitar_url VARCHAR(2000),
	make VARCHAR(60),
	model VARCHAR(60),
	year SMALLINT,
	finish VARCHAR(60)
);

CREATE TABLE instrument_choices(
	id SERIAL PRIMARY KEY,
	band_id INTEGER REFERENCES bands(id)
	guitar_id INTEGER REFERENCES guitars(id)
);



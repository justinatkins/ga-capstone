DROP DATABASE IF EXISTS guitars;
CREATE DATABASE guitars;

\c guitars 

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	username VARCHAR(64),
	password_digest VARCHAR(120)
);

CREATE TABLE bands(
	id SERIAL PRIMARY KEY, 
	band_name VARCHAR(256),
	guitarist_id INTEGER REFERENCES guitarists(id), 
	added_by INTEGER REFERENCES users(id)
);

CREATE Table guitarists(
	id SERIAL PRIMARY KEY,
	band_url VARCHAR(2000),
	name VARCHAR(128),
	added_by INTEGER REFERENCES users(id)
	-- band_id VARCHAR(60) REFERENCES bands(id), 
);


CREATE TABLE guitars(
	id SERIAL PRIMARY KEY,
	guitar_url VARCHAR(2000),
	make VARCHAR(60),
	model VARCHAR(60),
	year SMALLINT,
	finish VARCHAR(60),
	added_by INTEGER REFERENCES users(id)
);

CREATE TABLE instrument_choices_bands(
	id SERIAL PRIMARY KEY,
	band_id INTEGER REFERENCES bands(id),
	guitar_id INTEGER REFERENCES guitars(id) 
);

CREATE TABLE instrument_choices_guitarists(
	id SERIAL PRIMARY KEY,
	guitar_id INTEGER REFERENCES guitars(id)
);

CREATE TABLE musicians_bands(
	id SERIAL PRIMARY KEY,
	guitarist_id INTEGER REFERENCES guitarists(id),

);

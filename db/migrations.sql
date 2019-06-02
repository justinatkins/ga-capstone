DROP DATABASE IF EXISTS guitars;
CREATE DATABASE guitars;

\c guitars

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	username VARCHAR(32),
	password_digest VARCHAR(60)
);

CREATE Table bands(
	id SERIAL PRIMARY KEY,
	band_url VARCHAR(2000),
	band_name VARCHAR(60),
	guitarist VARCHAR(60),
	user_id INTEGER REFERENCES users(id)
);


CREATE TABLE guitars(
	id SERIAL PRIMARY KEY,
	guitar_url VARCHAR(2000),
	make VARCHAR(60),
	model VARCHAR(60),
	year SMALLINT,
	finish VARCHAR(60),
	band_id INTEGER REFERENCES bands(id)
);
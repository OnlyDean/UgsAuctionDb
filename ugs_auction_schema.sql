CREATE TABLE person (
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(75),
	suffix VARCHAR(15),
	honorific VARCHAR(25),
	primary_phone VARCHAR(25),
	secondary_phone VARCHAR(25),
	email VARCHAR(120),
	notes TEXT,
	created DATETIME,
	last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE family (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(120),
	address1 VARCHAR(120),
	address2 VARCHAR(120),
	city VARCHAR(45),
	state VARCHAR(25),
	zipcode VARCHAR(15),
	created DATETIME,
	last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	notes TEXT,
	PRIMARY KEY (id)
);

CREATE TABLE person_to_family (
	id INT NOT NULL AUTO_INCREMENT,
	person_id INT,
	family_id INT,
	created DATETIME,
	last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (person_id) REFERENCES person(id),
	FOREIGN KEY (family_id) REFERENCES family(id)
);

CREATE TABLE item (
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(150) NOT NULL,
	description TEXT,
	donor_id INT,
	estimated_value DECIMAL(8,2),
	minimum_bid DECIMAL(8,2),
	adult_price DECIMAL(8,2),
	child_price DECIMAL(8,2),
	family_price DECIMAL(8,2),
	min_number TINYINT,
	max_number TINYINT,
	scheduled_for DATETIME,
	created DATETIME,
	last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	selling_price DECIMAL(8,2),
	winner_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (donor_id) REFERENCES person(id),
	FOREIGN KEY (winner_id) REFERENCES person(id)
);

CREATE TABLE auction (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(10),
	PRIMARY KEY (id)
);

INSERT INTO auction (name) VALUES ('Silent');
INSERT INTO auction (name) VALUES ('Poster');
INSERT INTO auction (name) VALUES ('Live');

CREATE TABLE auction_to_item (
	id INT NOT NULL AUTO_INCREMENT,
	auction_id INT,
	item_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (auction_id) REFERENCES auction(id),
	FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE payment_method (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE payment (
	id INT NOT NULL AUTO_INCREMENT,
	payment_method_id INT,
	remitter_id INT,
	amount_paid DECIMAL(8,2) NOT NULL,
	check_number INT,
	payment_made DATETIME,
	last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	notes TEXT,
	PRIMARY KEY (id),
	FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
	FOREIGN KEY (remitter_id) REFERENCES person(id)
);

CREATE TABLE payment_to_item (
	id INT NOT NULL AUTO_INCREMENT,
	payment_id INT,
	item_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (payment_id) REFERENCES payment(id),
	FOREIGN KEY (item_id) REFERENCES item(id)
);



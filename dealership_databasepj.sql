CREATE TABLE "customer"(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE "mechanic"(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE "salesperson"(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE "serviced_car"(
	serviced_car_id SERIAL PRIMARY KEY,
	model VARCHAR(50),
	year_ INTEGER,
	customer_id INTEGER
);

CREATE TABLE "dealership_car"(
	dealer_id SERIAL PRIMARY KEY,
	model VARCHAR(50),
	year_ INTEGER,
	availability VARCHAR(50),
	price INTEGER,
	customer_id INTEGER,
	salesperson_id INTEGER
);

CREATE TABLE "invoice"(
	invoice_id SERIAL PRIMARY KEY,
	price INTEGER,
	dealer_id INTEGER,
	customer_id INTEGER,
	salesperson_id INTEGER
);

CREATE TABLE "serviced_ticket"(
	service_ticket_id SERIAL PRIMARY KEY,
	price INTEGER,
	part_used VARCHAR(50),
	customer_id INTEGER,
	serviced_car_id INTEGER
);

CREATE TABLE "serviced_history"(
	history_id SERIAL PRIMARY KEY,
	part VARCHAR(50),
	service_price INTEGER,
	serviced_car_id INTEGER,
	customer_id INTEGER
);

CREATE TABLE "mechanic_serviced_car"(
	id SERIAL PRIMARY KEY,
	mechanic_id INTEGER,
	serviced_car_id INTEGER
);

ALTER TABLE "dealership_car"
ADD FOREIGN KEY (customer_id) REFERENCES "customer"(customer_id);

ALTER TABLE "invoice"
ADD FOREIGN KEY (customer_id) REFERENCES "customer"(customer_id);

ALTER TABLE "dealership_car"
ADD FOREIGN KEY (salesperson_id) REFERENCES "salesperson"(salesperson_id);

ALTER TABLE "invoice"
ADD FOREIGN KEY (salesperson_id) REFERENCES "salesperson"(salesperson_id);

ALTER TABLE "invoice"
ADD FOREIGN KEY (dealer_id) REFERENCES "dealership_car"(dealer_id);

ALTER TABLE "serviced_car"
ADD FOREIGN KEY (customer_id) REFERENCES "customer"(customer_id);

ALTER TABLE "serviced_ticket"
ADD FOREIGN KEY (customer_id) REFERENCES "customer"(customer_id);

ALTER TABLE "serviced_ticket"
ADD FOREIGN KEY (serviced_car_id) REFERENCES "serviced_car"(serviced_car_id);

ALTER TABLE "serviced_history"
ADD FOREIGN KEY (serviced_car_id) REFERENCES "serviced_car"(serviced_car_id);

ALTER TABLE "serviced_history"
ADD FOREIGN KEY (customer_id) REFERENCES "customer"(customer_id);

ALTER TABLE "mechanic_serviced_car"
ADD FOREIGN KEY (mechanic_id) REFERENCES "mechanic"(mechanic_id);

ALTER TABLE "mechanic_serviced_car"
ADD FOREIGN KEY (serviced_car_id) REFERENCES "serviced_car"(serviced_car_id);

INSERT INTO "customer"(customer_id, first_name, last_name)
VALUES (1, 'kevin', 'Ngyen'), (2, 'Andrea', 'Pirela'), (3, 'Antonio', 'Turner')
RETURNING *;

INSERT INTO "mechanic"(mechanic_id, first_name, last_name)
VALUES (1, 'Derek', 'Hawkins'), (2, 'Lucas', 'Lang')
RETURNING *;

INSERT INTO "salesperson"(salesperson_id, first_name, last_name)
VALUES(1, 'Tammie', 'Hall'), (2, 'Brittany', 'Jones')
RETURNING *;

-- added a make to table
ALTER TABLE "serviced_car"
ADD COLUMN Make VARCHAR(50);

INSERT INTO "serviced_car"(serviced_car_id, make, model, year_, customer_id)
VALUES (3, 'Subaru', 'Forester', '2004', 1), (4, 'Subaru', 'WRX', '2021', 2)
RETURNING *;
		
-- added a make to table
ALTER TABLE "dealership_car"
ADD COLUMN make VARCHAR(50);

INSERT INTO "dealership_car"(dealer_id, make, model, year_, price, customer_id, salesperson_id)
VALUES (12, 'Jeep', 'Wrangler', '2021', 40000, 3, 1), (34, 'Toyota', 'RAV4', '2021', 45000, 3, 2)
RETURNING *;

INSERT INTO "invoice"(invoice_id, price, dealer_id, customer_id, salesperson_id)
VALUES (1, 40000, 12, 3, 1), (2, 45000, 34, 3, 2)
RETURNING *;

INSERT INTO "serviced_ticket"(service_ticket_id, price, part_used, customer_id, serviced_car_id)
VALUES (1, 80, 'oil change', 1, 3), (2, 400, 'brake pad change', 2, 4)
RETURNING *;
						
INSERT INTO "serviced_history"(history_id, part, service_price, serviced_car_id, customer_id)
VALUES (123, 'oil change', 80, 3, 1)
RETURNING *;

INSERT INTO "serviced_history"(history_id, part, service_price, serviced_car_id, customer_id)
VALUES (456, 'brake pad change', 400, 4, 2)
RETURNING *;

SELECT *
FROM customer;

SELECT *
FROM dealership_car;

SELECT *
FROM invoice;

SELECT *
FROM mechanic;

-- nothing created yet
SELECT *
FROM mechanic_serviced_car;

SELECT *
FROM salesperson;

SELECT *
FROM serviced_car;

SELECT *
FROM serviced_ticket;


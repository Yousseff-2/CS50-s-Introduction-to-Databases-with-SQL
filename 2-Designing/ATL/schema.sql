CREATE TABLE IF NOT EXISTS Customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL CHECK (age > 0)
);

CREATE TABLE IF NOT EXISTS Carriers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    gate TEXT NOT NULL CHECK (gate IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
);

CREATE TABLE IF NOT EXISTS Journeys (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    journey_number TEXT NOT NULL,
    carrier_id INTEGER NOT NULL,
    departure_code TEXT NOT NULL,
    arrival_code TEXT NOT NULL,
    scheduled_departure TEXT NOT NULL,
    scheduled_arrival TEXT NOT NULL,
    FOREIGN KEY (carrier_id) REFERENCES Carriers(id)
);

CREATE TABLE IF NOT EXISTS Boarding (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    journey_id INTEGER NOT NULL,
    boarding_time TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(id),
    FOREIGN KEY (journey_id) REFERENCES Journeys(id)
);

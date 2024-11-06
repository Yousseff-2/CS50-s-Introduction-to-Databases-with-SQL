CREATE TABLE Individuals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE Institutions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    location TEXT NOT NULL,
    established_year INTEGER NOT NULL
);

CREATE TABLE Businesses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    sector TEXT NOT NULL,
    location TEXT NOT NULL
);

CREATE TABLE Connections (
    individual1_id INTEGER,
    individual2_id INTEGER,
    PRIMARY KEY (individual1_id, individual2_id),
    FOREIGN KEY (individual1_id) REFERENCES Individuals(id),
    FOREIGN KEY (individual2_id) REFERENCES Individuals(id),
    CHECK (individual1_id != individual2_id)
);

CREATE TABLE IndividualInstitutions (
    individual_id INTEGER,
    institution_id INTEGER,
    enrollment_start_date TEXT NOT NULL,
    enrollment_end_date TEXT,
    qualification TEXT NOT NULL,
    PRIMARY KEY (individual_id, institution_id),
    FOREIGN KEY (individual_id) REFERENCES Individuals(id),
    FOREIGN KEY (institution_id) REFERENCES Institutions(id)
);

CREATE TABLE IndividualBusinesses (
    individual_id INTEGER,
    business_id INTEGER,
    employment_start_date TEXT NOT NULL,
    employment_end_date TEXT,
    position TEXT NOT NULL,
    PRIMARY KEY (individual_id, business_id),
    FOREIGN KEY (individual_id) REFERENCES Individuals(id),
    FOREIGN KEY (business_id) REFERENCES Businesses(id)
);

CREATE TABLE Users (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50),
    Second_name VARCHAR(50),
    Username VARCHAR(30) UNIQUE NOT NULL,
    Password TEXT NOT NULL
);

CREATE TABLE Schools_and_Universities (
    School_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(40),
    Type ENUM('Primary', 'Secondary', 'Higher Education'),
    Location TEXT,
    Year_ YEAR
);

CREATE TABLE Companies (
    Company_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Industry ENUM('Technology', 'Education', 'Business') NOT NULL,
    Location VARCHAR(100)
);

CREATE TABLE Connections (
    User1_ID INT NOT NULL,
    User2_ID INT NOT NULL,
    Connection_Date DATE,
    PRIMARY KEY (User1_ID, User2_ID),
    FOREIGN KEY (User1_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (User2_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Connections_with_Schools (
    User_ID INT NOT NULL,
    School_ID INT NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE,
    Degree_Type VARCHAR(50),
    PRIMARY KEY (User_ID, School_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (School_ID) REFERENCES Schools_and_Universities(School_ID)
);

CREATE TABLE Connections_with_Companies (
    User_ID INT NOT NULL,
    Company_ID INT NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE,
    PRIMARY KEY (User_ID, Company_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Company_ID) REFERENCES Companies(Company_ID)
);

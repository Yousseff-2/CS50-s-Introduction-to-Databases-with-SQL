CREATE TABLE IngredientsList (
    ingredient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price_per_unit REAL NOT NULL,
    unit TEXT NOT NULL
);

CREATE TABLE Donuts (
    donut_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    gluten_free BOOLEAN NOT NULL,
    price REAL NOT NULL
);

CREATE TABLE Donut_Ingredients (
    donut_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    FOREIGN KEY (donut_id) REFERENCES Donuts(donut_id),
    FOREIGN KEY (ingredient_id) REFERENCES IngredientsList(ingredient_id),
    PRIMARY KEY (donut_id, ingredient_id)
);

CREATE TABLE Clients (
    client_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE Purchases (
    purchase_id INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id INTEGER NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE Purchase_Donuts (
    purchase_id INTEGER NOT NULL,
    donut_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES Purchases(purchase_id),
    FOREIGN KEY (donut_id) REFERENCES Donuts(donut_id),
    PRIMARY KEY (purchase_id, donut_id)
);

-- create rangers, species, sightings tables
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    "name" VARCHAR(50),
    region VARCHAR(100)
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status VARCHAR(30)
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INTEGER REFERENCES species(species_id) ON DELETE CASCADE,
    ranger_id INTEGER REFERENCES rangers(ranger_id) ON DELETE SET NULL,
    "location" TEXT,
    sighting_time TIMESTAMP,
    note TEXT
);

-- insert data into rangers, species and sightings tables
INSERT INTO rangers ("name", region)
    VALUES
        ('John Carter', 'Serengeti National Park'),
        ('Emily Stone', 'Yellowstone'),
        ('Carlos Rivera', 'Amazon Rainforest'),
        ('Sarah Lee', 'Kruger National Park'),
        ('Michael Tan', 'Borneo Forest'),
        ('Linda Park', 'Yosemite'),
        ('Ali Khan', 'Himalayas'),
        ('Rachel Green', 'Galápagos Islands'),
        ('Tom Becker', 'Great Barrier Reef'),
        ('Nadia Petrova', 'Kamchatka Peninsula');

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
    VALUES
        ('African Elephant', 'Loxodonta africana', '1758-01-01', 'Vulnerable'),
        ('Bengal Tiger', 'Panthera tigris tigris', '1758-05-10', 'Endangered'),
        ('Harpy Eagle', 'Harpia harpyja', '1758-03-20', 'Near Threatened'),
        ('Blue Whale', 'Balaenoptera musculus', '1758-06-30', 'Endangered'),
        ('Giant Panda', 'Ailuropoda melanoleuca', '1869-03-11', 'Vulnerable'),
        ('Komodo Dragon', 'Varanus komodoensis', '1912-01-01', 'Vulnerable'),
        ('Snow Leopard', 'Panthera uncia', '1775-04-05', 'Vulnerable'),
        ('Galápagos Tortoise', 'Chelonoidis nigra', '1824-07-22', 'Vulnerable'),
        ('Orangutan', 'Pongo pygmaeus', '1760-08-15', 'Critically Endangered'),
        ('Polar Bear', 'Ursus maritimus', '1774-02-01', 'Vulnerable');

INSERT INTO sightings (species_id, ranger_id, "location", sighting_time, note) 
    VALUES
        (1, 1, 'Serengeti - West Plain', '2024-05-10 07:45:00', 'Elephant herd near watering hole'),
        (2, 1, 'Serengeti - North Hill', '2024-05-11 11:20:00', 'Unusual stripes on observed tiger'),
        (3, 2, 'Amazon - Mid Canopy', '2024-05-12 08:10:00', 'Harpy Eagle spotted near nest'),
        (3, 5, 'Amazon - Riverbank', '2024-05-12 16:30:00', 'Same eagle returned in evening'),
        (4, 4, 'South Atlantic - Open Sea', '2024-05-13 06:50:00', 'Blue whale sighted breaching'),
        (6, 5, 'Komodo Island - Rocky Hill', '2024-05-15 13:15:00', 'Adult male dragon'),
        (7, 1, 'Himalayas - Ice Ridge', '2024-05-16 17:10:00', 'Snow leopard prints in fresh snow'),
        (1, 6, 'Serengeti - Central', '2024-05-17 09:45:00', 'Another herd spotted in distance'),
        (9, 9, 'Kalimantan Jungle', '2024-05-18 12:00:00', 'Orangutan in canopy'),
        (2, 1, 'Serengeti - Bush Zone', '2024-05-19 07:30:00', 'Tiger spotted again'),
        (1, 2, 'Serengeti - West Plain', '2024-05-20 08:30:00', 'Return to herd, fewer individuals'),
        (10, 10, 'Arctic Ice Edge', '2024-05-21 14:45:00', 'Polar bear walking south'),
        (3, 3, 'Amazon - Nesting Cliff', '2024-05-22 10:10:00', 'Nest confirmed with 2 juveniles'),
        (4, 8, 'Open Ocean', '2024-05-23 07:00:00', 'Blue whale seen again'),
        (7, 7, 'Mountain Pass', '2024-05-24 18:05:00', 'Snow leopard near cave');

SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;
/* Populate database with sample data. */
--Neutered uses a bit 0 for false and 1 for true

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Agumon',DATE '2020-02-03',0 , B'1', 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Gabumon',DATE '2018-11-15',2 , B'1', 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Pikachu',DATE '2020-01-07',1 , B'0', 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Devimon',DATE '2017-05-12',5 , B'1', 11);

--day 2
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Charmander',DATE '2020-02-08',0 , B'0', -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Plantmon',DATE '2022-11-15',2 , B'1', -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Squirtle',DATE '1993-04-02',3 , B'0', -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Angemon',DATE '2005-05-12',1 , B'1', -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Boarmon',DATE '2005-05-07',7 , B'1', 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES ('Blossom',DATE '1998-10-13',3 , B'1', 17);

--day 3

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';



/* Populate database with sample data. */
--Neutered uses a bit 0 for false and 1 for true

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES (1 ,'Agumon',DATE '2020-02-03',0 , B'1', 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES (2 ,'Gabumon',DATE '2018-11-15',2 , B'1', 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES (3 ,'Pikachu',DATE '2020-01-07',1 , B'0', 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weigth_kg) VALUES (4 ,'Devimon',DATE '2020-05-12',5 , B'1', 11);


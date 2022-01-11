/*Queries that provide answers to the questions from all projects.*/

--Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';
--List the name of all animals born between 2016 and 2019.
SELECT * FROM animals WHERE date_of_birth BETWEEN '2015-12-31' AND '2019-12-31';
--List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT * FROM animals WHERE neutered = B'1' AND escape_attempts < 3;
--List date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
--List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts FROM animals WHERE weigth_kg > 10.5;
--Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = B'1';
--Find all animals not named Gabumon.
SELECT * FROM animals WHERE name <> 'Gabumon';
--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weigth_kg >= 10.4 AND weigth_kg <= 17.3;

--day 2
BEGIN;
UPDATE animals SET species = 'undefined';
SELECT * FROM animals;
--worked!
ROLLBACK;

--lets check if it worked
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species <> 'digimon';
COMMIT; 

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT  no_future;
UPDATE animals SET weigth_kg = weigth_kg * -1;
ROLLBACK TO no_future;
UPDATE animals SET weigth_kg = weigth_kg * -1 WHERE weigth_kg < 0;


--How many animals are there?
SELECT COUNT(*) FROM animals;
--How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
--What is the average weight of animals?
SELECT AVG(weigth_kg) FROM animals;
--Who escapes the most, neutered or not neutered animals?
SELECT neutered, COUNT(neutered) FROM animals GROUP BY neutered;
--What is the minimum and maximum weight of each type of animal?
SELECT MAX(weigth_kg), MIN(weigth_kg), species FROM animals GROUP BY species;
--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31';


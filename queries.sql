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
SAVEPOINT  no_future;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
UPDATE animals SET weigth_kg = weigth_kg * -1;
ROLLBACK TO no_future;
UPDATE animals SET weigth_kg = weigth_kg * -1 WHERE weigth_kg < 0;
COMMIT;


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

--day3

--What animals belong to Melody Pond?
SELECT COUNT(name), full_name FROM owners INNER JOIN animals ON owners.id = owner_id GROUP BY owners.full_name;
--This one shows how many each one has
SELECT COUNT(name) FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Melody Pond';
--thid onr id dprcific for Melody Pond

--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners FULL OUTER JOIN animals ON animals.owner_id = owners.id;

--How many animals are there per species?
SELECT species.name, count(animals.name) FROM species INNER JOIN animals ON animals.species_id = species.id GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT name FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Jennifer Orwell';

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

--Who owns the most animals?
 --to see how many owns each one 
 SELECT COUNT(animals.name), owners.full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name;
--to see how many are the max pets
SELECT MAX (y.mycount)
FROM (SELECT owners.full_name, COUNT(animals.name) mycount
FROM animals INNER JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name)y;


--day 4

--Who was the last animal seen by William Tatcher?
SELECT animals.name, visit_date FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vets_id = (SELECT id FROM vets WHERE name = 'William Tatcher') ORDER BY visit_date DESC LIMIT 1;

--How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.name) FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vets_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

--List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets FULL OUTER JOIN specializations ON vets.id = specializations.vets_id FULL OUTER JOIN species ON species.id = specializations.species_id;

--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' AND (visits.visit_date > '03-31-2020'::date AND visits.visit_date < '08-31-2020'::date);

--What animal has the most visits to vets?
SELECT animals.name, COUNT (*) AS visits FROM animals JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name HAVING COUNT (*) = (SELECT MAX (visits) FROM (SELECT animals.name, COUNT (*) AS visits FROM animals JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name) animals);

--Who was Maisy Smith's first visit?
SELECT animals.name, visits.visit_date FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.visit_date LIMIT 1;

--Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, date_of_birth, escape_attempts, neutered, weigth_kg, vets.name, age, date_of_graduation, visit_date FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id ORDER BY visits.visit_date DESC LIMIT 1;

--How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name, COUNT (*) AS atendance FROM vets JOIN visits ON vets.id = visits.vets_id JOIN specializations ON vets.id = specializations.vets_id WHERE specializations.species_id is NULL GROUP BY vets.name;

--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT COUNT (*), species.name FROM animals JOIN species ON animals.species_id = species.id JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name LIMIT 1;

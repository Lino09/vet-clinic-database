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

--day 4

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, DATE '2000-04-23'),
('Maisy Smith', 26, DATE '2019-01-17'),
('Stephanie Mendez', 64, DATE '1981-05-04'),
('Jack Harkness', 38, DATE '2008-06-08');

INSERT INTO specializations (species_id, vets_id)
VALUES
((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher')),
((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')),
((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Jack Harkness')),
(NULL, (SELECT id FROM vets WHERE name = 'Maisy Smith'));

INSERT INTO visits (animal_id, vets_id, visit_date)
VALUES
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2022-02-02'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');


--week2 day1
INSERT INTO visits (animal_id, vets_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
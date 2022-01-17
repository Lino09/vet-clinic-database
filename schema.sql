/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;
-- move to the database using \c vet_clinic

CREATE TABLE animals( 
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(200),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BIT,
  weigth_kg DECIMAL,
  PRIMARY KEY(id)
);

--day 2

ALTER TABLE animals ADD species TEXT;

--day 3

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(200),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(200),
  PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT;

ALTER TABLE  animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD owner_id INT;

ALTER TABLE  animals ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners (id);

--day 4

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(200),
  age INT,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

CREATE TABLE specializations (
  species_id INT,
  vets_id INT,
  CONSTRAINT speciesFK FOREIGN KEY (species_id)
  REFERENCES species(id),
  CONSTRAINT vetsFK FOREIGN KEY (vets_id)
  REFERENCES vets(id)
);

CREATE TABLE visits (
  animal_id INT,
  vets_id INT,
  visit_date DATE,
  CONSTRAINT animalFK FOREIGN KEY (animal_id)
  REFERENCES animals(id),
  CONSTRAINT vetsFK FOREIGN KEY (vets_id)
  REFERENCES vets(id)
);

--Week2 day 1

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX visits_animal_id_asc ON visits(animal_id ASC);
CREATE INDEX visits_vets_id_asc ON visits(vets_id ASC);
CREATE INDEX owners_email_id_asc ON owners(email ASC);
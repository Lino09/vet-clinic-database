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
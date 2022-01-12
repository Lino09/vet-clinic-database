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

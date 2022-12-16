/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(250), date_of_birth DATE, escape_attempts INT, neutered BIT, weight_kg DECIMAL, PRIMARY KEY(id)
);
/* Added species column to animals table*/
ALTER TABLE animals ADD COLUMN species VARCHAR(250);

/*Project 3*/
CREATE TABLE owners( id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR(250), age INT, PRIMARY KEY(id) );
CREATE TABLE species( id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(250), PRIMARY KEY(id) );
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);


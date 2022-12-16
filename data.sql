/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'February 03, 2020', 0, '1', 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'November 15, 2018', 2, '1', 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'January 07, 2021', 1, '0', 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, '1', 11);

/* Added for Project2 requierements*/
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'February 08, 2020', 0, '0', -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'November 15, 2021', 2, '1', -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'April 02, 1993', 3, '0', -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'June 12, 2005', 1, '1', -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'June 07, 2005', 7, '1', 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'October 13, 1998', 3, '1', 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, '1', 22);

/* Added for Project3 requierements*/
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

BEGIN TRANSACTION;
UPDATE animals SET species_id=2 WHERE name like '%mon';
COMMIT TRANSACTION;

BEGIN TRANSACTION;
UPDATE animals SET species_id=1 WHERE species_id IS NULL;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
UPDATE animals SET owner_id=1 WHERE name='Agumon';
UPDATE animals SET owner_id=2 WHERE name='Pikachu';
UPDATE animals SET owner_id=2 WHERE name='Gabumon';
UPDATE animals SET owner_id=3 WHERE name='Devimon';
UPDATE animals SET owner_id=3 WHERE name='Plantmon';
UPDATE animals SET owner_id=4 WHERE name='Charmander';
UPDATE animals SET owner_id=4 WHERE name='Squirtle';
UPDATE animals SET owner_id=4 WHERE name='Blossom';
UPDATE animals SET owner_id=5 WHERE name='Angemon';
UPDATE animals SET owner_id=5 WHERE name='Boarmon';
COMMIT TRANSACTION;


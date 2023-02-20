/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'February 03, 2020', 0, '1', 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'November 15, 2018', 2, '1', 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'January 07, 2021', 1, '0', 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, '1', 11);

-- /* Added for Project2 requierements*/
-- INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'February 08, 2020', 0, '0', -11);

-- INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'November 15, 2021', 2, '1', -5.7);

-- INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'April 02, 1993', 3, '0', -12.13);

-- INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'June 12, 2005', 1, '1', -45);

-- INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'June 07, 2005', 7, '1', 20.4);

-- INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'October 13, 1998', 3, '1', 17);

-- INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, '1', 22);

-- /* Added for Project3 requierements*/
-- INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
-- INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
-- INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
-- INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
-- INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
-- INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- INSERT INTO species (name) VALUES ('Pokemon');
-- INSERT INTO species (name) VALUES ('Digimon');

-- BEGIN TRANSACTION;
-- UPDATE animals SET species_id=2 WHERE name like '%mon';
-- COMMIT TRANSACTION;

-- BEGIN TRANSACTION;
-- UPDATE animals SET species_id=1 WHERE species_id IS NULL;
-- COMMIT TRANSACTION;

-- BEGIN TRANSACTION;
-- UPDATE animals SET owner_id=1 WHERE name='Agumon';
-- UPDATE animals SET owner_id=2 WHERE name='Pikachu';
-- UPDATE animals SET owner_id=2 WHERE name='Gabumon';
-- UPDATE animals SET owner_id=3 WHERE name='Devimon';
-- UPDATE animals SET owner_id=3 WHERE name='Plantmon';
-- UPDATE animals SET owner_id=4 WHERE name='Charmander';
-- UPDATE animals SET owner_id=4 WHERE name='Squirtle';
-- UPDATE animals SET owner_id=4 WHERE name='Blossom';
-- UPDATE animals SET owner_id=5 WHERE name='Angemon';
-- UPDATE animals SET owner_id=5 WHERE name='Boarmon';
-- COMMIT TRANSACTION;

-- /* Project 4*/

-- INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
-- INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
-- INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
-- INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

-- INSERT INTO specializations (species_id, vets_id) VALUES (1, 1);
-- INSERT INTO specializations (species_id, vets_id) VALUES (1, 3);
-- INSERT INTO specializations (species_id, vets_id) VALUES (2, 3);
-- INSERT INTO specializations (species_id, vets_id) VALUES (2, 4);



-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(1,1,'2020-05-24'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(1,3,'2020-07-22');

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(2,4,'2021-02-02'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(3,2,'2020-01-02'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(3,2,'2020-03-08'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(3,2,'2020-05-14'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(4,3,'2021-05-04'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(5,4,'2021-02-24'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(6,2,'2019-12-21');

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(6,1,'2020-08-10'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(6,2,'2021-04-07');

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(7,3,'2019-09-29');

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(8,4,'2020-10-03'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(8,4,'2020-11-04'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(9,2,'2019-01-24'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(9,2,'2019-05-15'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(9,2,'2020-02-27'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(9,2,'2020-08-03'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(10,3,'2020-05-24'); 

-- INSERT INTO visits (animals_id, vets_id, visit_date) VALUES(10,1,'2021-01-11'); 

-- /*PROJECT 5*/


-- -- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
-- INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- -- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
-- insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

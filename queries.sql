/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name, date_of_birth  FROM animals WHERE name='Agumon' OR name='Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT name, neutered FROM animals WHERE neutered='1';

SELECT * FROM animals WHERE name!='Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*Project 2 QUERIES */

BEGIN TRANSACTION;
UPDATE animals SET species= 'unspecified';
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;

UPDATE animals SET species='digimon'WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon'WHERE species IS NULL;

COMMIT TRANSACTION;

SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE id>=0;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth>'2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg= weight_kg *-1;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg= weight_kg *-1 WHERE weight_kg<0;
COMMIT TRANSACTION;


SELECT COUNT(id) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT SUM(escape_attempts),neutered FROM animals WHERE neutered='1' GROUP BY neutered UNION ALL SELECT SUM(escape_attempts),neutered FROM animals WHERE neutered='0' GROUP BY neutered;
SELECT species, MAX(weight_kg) AS WEIGHT FROM animals WHERE species='pokemon' GROUP BY species UNION ALL SELECT species, MIN(weight_kg) FROM animals WHERE species='pokemon' GROUP BY species UNION ALL SELECT species, MAX(weight_kg) AS WEIGHT FROM animals WHERE species='digimon' GROUP BY species UNION ALL SELECT species, MIN(weight_kg) FROM animals WHERE species='digimon' GROUP BY species ;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;




/* Project 3 queries */


SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE full_name= 'Melody Pond';
SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name= 'Pokemon';
SELECT * FROM owners LEFT JOIN animals on owners.id = animals.owner_id;
SELECT species.name, COUNT(animals.species_id) FROM species INNER JOIN animals ON species.id=animals.species_id GROUP BY species.name;
SELECT * FROM animals as Animals JOIN species as Species ON Species.id = Animals.species_id JOIN owners as Owners ON Owners.id = Animals.owner_id WHERE Species.name= 'Digimon' AND Owners.full_name = 'Jennifer Orwell';
SELECT * FROM animals as Animals JOIN owners as Owners ON Owners.id = Animals.owner_id WHERE Animals.escape_attempts= 0 AND Owners.full_name= 'Dean Winchester';
SELECT Animals.owner_id, Owners.full_name FROM animals as Animals INNER JOIN owners as Owners ON Animals.owner_id= Owners.id GROUP BY Animals.owner_id, Owners.full_name
ORDER BY COUNT(*) DESC LIMIT 1;

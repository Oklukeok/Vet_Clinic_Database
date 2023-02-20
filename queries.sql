/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name, date_of_birth  FROM animals WHERE name='Agumon' OR name='Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT name, neutered FROM animals WHERE neutered='1';

SELECT * FROM animals WHERE name!='Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- /*Project 2 QUERIES */

-- BEGIN TRANSACTION;
-- UPDATE animals SET species= 'unspecified';
-- ROLLBACK;
-- SELECT * FROM animals;

-- BEGIN TRANSACTION;

-- UPDATE animals SET species='digimon'WHERE name LIKE '%mon';
-- UPDATE animals SET species='pokemon'WHERE species IS NULL;

-- COMMIT TRANSACTION;

-- SELECT * FROM animals;

-- BEGIN TRANSACTION;
-- DELETE FROM animals WHERE id>=0;
-- SELECT * FROM animals;
-- ROLLBACK;
-- SELECT * FROM animals;


-- BEGIN TRANSACTION;
-- DELETE FROM animals WHERE date_of_birth>'2022-01-01';
-- SAVEPOINT sp1;
-- UPDATE animals SET weight_kg= weight_kg *-1;
-- ROLLBACK TO sp1;
-- UPDATE animals SET weight_kg= weight_kg *-1 WHERE weight_kg<0;
-- COMMIT TRANSACTION;


-- SELECT COUNT(id) FROM animals;
-- SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts=0;
-- SELECT AVG(weight_kg) FROM animals;
-- SELECT SUM(escape_attempts),neutered FROM animals WHERE neutered='1' GROUP BY neutered UNION ALL SELECT SUM(escape_attempts),neutered FROM animals WHERE neutered='0' GROUP BY neutered;
-- SELECT species, MAX(weight_kg) AS WEIGHT FROM animals WHERE species='pokemon' GROUP BY species UNION ALL SELECT species, MIN(weight_kg) FROM animals WHERE species='pokemon' GROUP BY species UNION ALL SELECT species, MAX(weight_kg) AS WEIGHT FROM animals WHERE species='digimon' GROUP BY species UNION ALL SELECT species, MIN(weight_kg) FROM animals WHERE species='digimon' GROUP BY species ;
-- SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;




-- /* Project 3 queries */


-- SELECT * FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE full_name= 'Melody Pond';
-- SELECT * FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name= 'Pokemon';
-- SELECT * FROM owners LEFT JOIN animals on owners.id = animals.owner_id;
-- SELECT species.name, COUNT(animals.species_id) FROM species INNER JOIN animals ON species.id=animals.species_id GROUP BY species.name;
-- SELECT * FROM animals as Animals JOIN species as Species ON Species.id = Animals.species_id JOIN owners as Owners ON Owners.id = Animals.owner_id WHERE Species.name= 'Digimon' AND Owners.full_name = 'Jennifer Orwell';
-- SELECT * FROM animals as Animals JOIN owners as Owners ON Owners.id = Animals.owner_id WHERE Animals.escape_attempts= 0 AND Owners.full_name= 'Dean Winchester';
-- SELECT Animals.owner_id, Owners.full_name FROM animals as Animals INNER JOIN owners as Owners ON Animals.owner_id= Owners.id GROUP BY Animals.owner_id, Owners.full_name
-- ORDER BY COUNT(*) DESC LIMIT 1;

-- /*Project 4 */


-- SELECT vets.name, animals.name, visit_date FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = vets_id WHERE visit_date = (SELECT MAX(visit_date) FROM visits where vets_id= 1);


-- SELECT COUNT (*) FROM vets INNER JOIN visits ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;


-- SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON species.id = species_id;

-- SELECT vets.name, animals.name, visits.visit_date FROM visits INNER JOIN vets ON vets.id = visits.vets_id INNER JOIN animals ON animals.id = animals_id WHERE vets.name= 'Stephanie Mendez' AND visit_date BETWEEN 'April 01, 2020' AND 'August 30, 2020';

-- SELECT animals.name FROM visits INNER JOIN animals ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY COUNT(animals_id) DESC LIMIT 1;

-- SELECT visit_date, animals.name, vets.name FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = vets_id WHERE vets.name= 'Maisy Smith' GROUP BY visit_date, animals.name, vets.name ORDER BY visit_date ASC LIMIT 1;

-- SELECT visit_date, animals.name, animals.weight_kg, animals.neutered, animals.date_of_birth, animals.escape_attempts, vets.name, vets.age, vets.date_of_graduation FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = vets_id ORDER BY visit_date DESC LIMIT 1;

-- SELECT COUNT(animals.id) FROM visits INNER JOIN animals   ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vets_id LEFT JOIN specializations ON specializations.vets_id = visits.vets_id WHERE animals.species_id != specializations.species_id AND vets.id!=3 OR specializations.species_id IS NULL;

-- SELECT species.name FROM visits INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vets_id INNER JOIN species ON species.id = species_id WHERE vets.name= 'Maisy Smith' GROUP BY species.name ORDER BY COUNT(animals.species_id) DESC LIMIT 1;

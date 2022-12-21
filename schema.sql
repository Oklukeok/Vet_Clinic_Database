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

/*Project4*/

CREATE TABLE vets ( id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(250), age INT, date_of_graduation DATE, PRIMARY KEY(id) );

CREATE TABLE specializations(species_id INT, vets_id INT, PRIMARY KEY (species_id, vets_id), FOREIGN KEY(species_id) REFERENCES species (id), FOREIGN KEY (vets_id) REFERENCES vets (id));

CREATE TABLE visits (animals_id INTEGER NOT NULL, vets_id INTEGER NOT NULL, visit_date DATE, FOREIGN KEY (animals_id) REFERENCES animals (id), FOREIGN KEY (vets_id) REFERENCES vets (id));

/* PROJECT 5 */

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_id_index ON visits(animal_id);

CREATE INDEX vet_id_index ON visits(vet_id);

CREATE INDEX owner_id_index ON owners(email);

/* PROJECT 6 */

CREATE TABLE medical_histories_treatments(medical_history_id INT,treatment_id INT, CONSTRAINT HIST_TREAT FOREIGN KEY(medical_history_id ) REFERENCES medical_histories(id), CONSTRAINT treat_hist FOREIGN KEY (treatment_id) REFERENCES treatments(id));

CREATE INDEX ON medical_histories(patient_id);
CREATE INDEX ON invoices(medical_history_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON invoice_items (id);
CREATE INDEX ON medical_histories_treatments (medical_history_id);
CREATE INDEX ON medical_histories_treatments (treatment_id);


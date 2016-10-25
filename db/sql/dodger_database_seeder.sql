-- psql -d dodas -f db/sql/dodger_database_seeder.sql

DROP TABLE IF EXISTS seed_settings;
DROP TABLE IF EXISTS seeds;

CREATE TABLE seeds (
  id SERIAL4 primary key,
  seed_name VARCHAR(100) not null,
  target_database VARCHAR(100) not null,
  target_table VARCHAR(100) not null
);

CREATE TABLE seed_settings (
  id SERIAL4 primary key,
  seed_id INT4 REFERENCES seeds(id) not null,
  target_column VARCHAR(100) not null,
  source_file VARCHAR(255),
  min DECIMAL(25, 10),
  max DECIMAL(25, 10),
  bool_choice BOOL
);

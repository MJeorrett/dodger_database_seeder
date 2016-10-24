-- psql -d dodas -f db/dodger_database_seeder.sql  

DROP TABLE IF EXISTS seed_settings;
DROP TABLE IF EXISTS seeds;

CREATE TABLE seeds (
  id SERIAL4 primary key,
  seed_name VARCHAR(100),
  target_database VARCHAR(100),
  target_table VARCHAR(100)
);

CREATE TABLE seed_settings (
  id SERIAL4 primary key,
  seed_id INT4 REFERENCES seeds(id),
  target_column VARCHAR(100),
  source_file VARCHAR(255)
);

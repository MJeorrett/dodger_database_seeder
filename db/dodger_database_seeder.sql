DROP TABLE IF EXISTS seed_settings;
DROP TABLE IF EXISTS seeds;

CREATE TABLE seeds (
  id SERIAL4 primary key,
  seed_name VARCHAR(100),
  db_name VARCHAR(100),
  table_name VARCHAR(100)
);

CREATE TABLE seed_settings (
  seed_id INT4 REFERENCES seeds(id),
  column_name VARCHAR(100),
  source_file VARCHAR(255)
);

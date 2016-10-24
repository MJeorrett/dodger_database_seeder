-- psql -d dodas_test -f db/dodas_test.sql

DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table (
  id SERIAL4 primary key,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  film_name VARCHAR(100)
)

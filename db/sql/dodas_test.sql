-- psql -d dodas_test -f db/sql/dodas_test.sql

DROP TABLE IF EXISTS test_table;
DROP TABLE IF EXISTS types;

CREATE TABLE test_table (
  id SERIAL4 primary key,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  age INT2,
  height DECIMAL(10, 2),
  happy BOOLEAN
);

CREATE TABLE types (
  id SERIAL4,
  serial_ SERIAL,
  serial_4 SERIAL4,
  serial_8 SERIAL8,
  int_ INT,
  int_2 INT2,
  int_4 INT4,
  int_8 INT8,
  numeric_ NUMERIC,
  numeric_4_2 NUMERIC(4, 2),
  numeric_20_10 NUMERIC(20, 10),
  decimal_4_2 DECIMAL(4, 2),
  decimal_20_10 DECIMAL(20, 10),
  decimal_ DECIMAL,
  varchar_100 VARCHAR(100),
  varchar_255 VARCHAR(255),
  boolean_ BOOLEAN
);

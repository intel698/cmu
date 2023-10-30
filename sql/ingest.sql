CREATE TABLE central_park_weather AS FROM read_csv_auto('central_park_weather.csv');
CREATE TABLE fhv_bases AS FROM read_csv_auto('fhv_bases.csv');
CREATE TABLE bikedata AS FROM read_csv_auto('citibike-tripdata.csv');


CREATE TABLE fhv_tripdata AS SELECT * FROM read_parquet('taxi/fhv_tripdata.parquet');

CREATE TABLE fhvhv_tripdata.parquet AS SELECT * FROM read_parquet('fhvhv_tripdata.parquet');

CREATE TABLE green_tripdata.parquet AS SELECT * FROM read_parquet('green_tripdata.parquet');

CREATE TABLE yellow_tripdata.parquet AS SELECT * FROM read_parquet('yellow_tripdata.parquet');
CREATE TABLE etl.playerstat_source1_extract
(
idx INTEGER,
name VARCHAR(255),
country VARCHAR(255),
teams VARCHAR(255),
total_maps INTEGER,
total_rounds INTEGER,
kd_diff INTEGER,
kd NUMERIC(4,2),
rating NUMERIC(4,2)
);
--etl.playerstat_source1_extract
--etl.playerstat_source2_load
--etl.playerstat_source3_load
WITH dupe_names AS (
SELECT * , 
DENSE_RANK() OVER (PARTITION BY LOWER(name) ORDER BY name) name_dupe_ct
FROM etl.playerstat_source1_extract
)

SELECT DISTINCT a.name, a.country, a.teams
FROM dupe_names a
INNER JOIN 
dupe_names b
ON LOWER(a.name) = LOWER(b.name) AND a.name_dupe_ct != b.name_dupe_ct AND a.country != b.country;
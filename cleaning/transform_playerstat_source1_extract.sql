WITH trimmed_players as
(
	SELECT name as player,
	country,
	unnest(string_to_array(regexp_replace(teams, '[\[\]''\s]+', '', 'g'), ',')) AS teams, --replace all isntances of the [, ], ' and space chars, then convert to array and unnest
	total_maps,
	total_rounds,
	kd_diff,
	kd,
	rating
	FROM etl.playerstat_source1_extract
)
select * 
into etl.playerstat_source1_transform
from trimmed_players

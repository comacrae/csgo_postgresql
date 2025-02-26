select 
nick as player,
country,
unnest(string_to_array(regexp_replace(teams, '[\[\]''\s]+', '', 'g'), ',')) AS teams, --replace all isntances of the [, ], ' and space chars, then convert to array and unnest
maps_played,
rounds_played,
kd_difference,
kd_ratio,
rating,
total_kills,
headshot_percentage,
total_deaths,
grenade_damage_per_round,
kills_per_round,
assists_per_round,
deaths_per_round,
teammate_saved_per_round,
saved_by_teammate_per_round,
kast,
impact
into etl.playerstat_source2_transform
from etl.playerstat_source2_extract
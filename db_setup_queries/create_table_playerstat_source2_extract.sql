CREATE TABLE etl.playerstat_source2_extract
(
	nick VARCHAR(255),
	country VARCHAR(255),
	stats_link VARCHAR(255),
	teams VARCHAR(255),
	maps_played INTEGER,
	rounds_played INTEGER,
	kd_difference INTEGER,
	kd_ratio numeric(4,2),
	rating numeric(4,2),
	total_kills INTEGER,
	headshot_percentage numeric(4,2),
	total_deaths INTEGER,
	grenade_damage_per_round numeric(4,2),
	kills_per_round numeric(4,2),
	assists_per_round numeric(4,2),
	deaths_per_round numeric(4,2),
	teammate_saved_per_round numeric(4,2),
	saved_by_teammate_per_round numeric(4,2),
	kast numeric(4,2),
	impact numeric(4,2)
);
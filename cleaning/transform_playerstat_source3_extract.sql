SELECT
	player_id,
	nickname,
	real_name,
	age,
	country,
	current_team,
	unnest(string_to_array(regexp_replace(teams, '[\s]+', '', 'g'), ',')) AS teams, --replace all isntances of the [, ], ' and space chars, then convert to array and unnest
	total_kills,
	total_deaths,
	CAST(TRIM(headshot_percentage, '%') AS NUMERIC(5,2)) AS headshot_percentage, -- needs to be converted since it has % sign
	damage_per_round,
	grenade_dmg_per_round,
	maps_played,
	rounds_played,
	kills_per_death,
	kills_per_round,
	assists_per_round,
	deaths_per_round,
	saved_by_teammate_per_round,
	saved_teammates_per_round,
	rounds_with_kills,
	--kill_to_death_diff, --broken col in raw data so we ignore it
	total_opening_kills,
	total_opening_deaths,
	opening_kill_ratio,
	opening_kill_rating,
	CAST(TRIM(team_win_percent_after_first_kill , '%') AS NUMERIC(5,2)) AS team_win_percent_after_first_kill , -- needs to be converted since it has % sign
	CAST(TRIM(first_kill_in_won_rounds, '%') AS NUMERIC(5,2)) AS first_kill_in_won_rounds, -- needs to be converted since it has % sign
	zero_kill_rounds,
	one_kill_rounds,
	two_kill_rounds,
	three_kill_rounds,
	four_kill_rounds,
	five_kill_rounds,
	rifle_kills,
	sniper_kills,
	smg_kills,
	pistol_kills,
	grenade_kills,
	other_kills,
	rating
	INTO etl.playerstat_source3_transform
	FROM etl.playerstat_source3_extract;
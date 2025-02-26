with country_groups as 
(
	select 
	country,
	count(country) as num_teams,
	sum(total_maps) as total_maps
	from teams.general
	group by country
)
select *,
CASE
	WHEN total_maps = GREATEST(total_maps, LAG(total_maps) OVER (order by num_teams desc)) THEN country
	ELSE LAG(country) OVER (order by num_teams desc)
	END AS team_with_more_maps_played_compared_to_larger_team
from country_groups
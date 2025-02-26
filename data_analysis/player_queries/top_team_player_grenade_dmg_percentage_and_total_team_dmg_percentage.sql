with dmg as 
(
	select 
	a.player,
	b.current_team,
	a.damage_per_round,
	(100 * (a.grenade_dmg_per_round / a.damage_per_round))::numeric(6,2) as grenade_damage_percentage,
	SUM(a.damage_per_round) over (partition by current_team) as total_team_damage_per_round,
	DENSE_RANK() over (partition by current_team order by a.grenade_dmg_per_round desc) as grenade_dmg_rank
	from players.performance_roundwise as a
	inner join 
	(
		select 
		player,
		current_team 
		from players.player_team_current
	) b
	on a.player = b.player
)
select
player,
current_team,
grenade_damage_percentage,
((damage_per_round / total_team_damage_per_round) * 100)::numeric(6,2) as percent_of_total_team_damage
from dmg
where grenade_dmg_rank = 1


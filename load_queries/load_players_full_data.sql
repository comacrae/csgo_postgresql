select distinct
--general data
nickname as player,
real_name ,
age ,
country,
maps_played,
rounds_played,
-- team data
current_team ,
teams,
-- general performance
total_kills,
total_deaths,
kills_per_death as kill_death_ratio,
headshot_percentage,
-- roundwise performance
damage_per_round,
grenade_dmg_per_round,
kills_per_round,
assists_per_round,
deaths_per_round ,
saved_by_teammate_per_round,
saved_teammates_per_round,
rounds_with_kills,
zero_kill_rounds,
one_kill_rounds,
two_kill_rounds,
three_kill_rounds,
four_kill_rounds,
five_kill_rounds,
kast as percent_rounds_kast,
--opening kill data
total_opening_kills,
total_opening_deaths,
opening_kill_ratio,
opening_kill_rating,
team_win_percent_after_first_kill,
first_kill_in_won_rounds,
-- weapon performance
rifle_kills,
sniper_kills,
smg_kills,
pistol_kills,
grenade_kills,
other_kills,
-- performance benchmarks
rating,
impact
into players.full_data
from 
etl.playerstat_source3_transform a
left join 
(select player, playerstat_source2_transform.kast, impact from etl.playerstat_source2_transform) as b
on a.nickname = b.player;
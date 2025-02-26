select distinct
player,
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
percent_rounds_kast
into players.performance_roundwise
from players.full_data

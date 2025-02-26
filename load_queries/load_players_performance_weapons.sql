select distinct 
player,
rifle_kills,
sniper_kills,
smg_kills,
pistol_kills,
grenade_kills,
other_kills
into players.performance_weapons
from players.full_data
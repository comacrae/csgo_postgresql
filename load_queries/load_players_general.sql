select distinct
player,
real_name ,
age ,
country,
maps_played,
rounds_played
into players.general
from players.full_data
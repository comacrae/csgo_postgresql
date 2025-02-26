select distinct
player,
total_kills,
total_deaths,
kill_death_ratio,
headshot_percentage
into players.performance_general
from players.full_data
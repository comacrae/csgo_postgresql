create view players.performance_general_avg
as
select
avg(kill_death_ratio)::numeric(4,2) as kill_death_ratio,
avg(total_kills)::numeric(10,2) as total_kills,
avg(total_deaths)::numeric(10,2) as total_deaths,
avg(headshot_percentage)::numeric(4,2) as headshot_percentage
from players.performance_general
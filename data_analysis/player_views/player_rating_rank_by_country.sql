CREATE VIEW players.player_rating_by_country 
AS 
with avg_country_rating as (
	select
	a.player,
	rating as player_rating,
	country,
	count(country) over(partition by country order by country asc) as players_per_country,
	avg(rating) over (partition by country order by country asc) as country_avg
	from players.general as a
	inner join 
	(
		select player,
		rating
		from players.performance_benchmarks
	) as b
	on a.player= b.player
),
country_ranking as 
(
	select
	player,
	player_rating,
	cast((player_rating - country_avg) as numeric(4,2)) as performance_over_country_avg,
	country,
	dense_rank() over (partition by country order by player_rating desc) as player_rank_by_country,
	cast(country_avg as numeric(4,2)) as country_avg_rating,
	players_per_country
	from avg_country_rating
	order by country, player_rank_by_country
)
select 
player,
player_rating,
performance_over_country_avg,
country,
CAST(player_rank_by_country AS TEXT) || '/' || CAST(players_per_country AS TEXT) as player_rank_by_country
from country_ranking

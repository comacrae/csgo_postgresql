# csgo_postgresql
A database with analytical queries for professional players/teams of the video game Counter-Strike: Global Offensive. Contains interesting queries such as:

## Is there a correlation between number of teams in a country and overall maps played by a country?


| country              | num_teams | total_maps | team_with_more_maps_played_compared_to_larger_team |
|----------------------|-----------|------------|----------------------------------------------------|
| United States        | 44        | 13438      | United States                                      |
| Brazil               | 29        | 10159      | United States                                      |
| Australia            | 27        | 8622       | Brazil                                             |
| Russia               | 26        | 10144      | Russia                                             |
| Sweden               | 21        | 9835       | Russia                                             |
| Denmark              | 19        | 10654      | Denmark                                            |
| Poland               | 18        | 9518       | Denmark                                            |
| China                | 16        | 5017       | Poland                                             |
| ...               | ...       | ...       | ...                                             |

## Is there a relationship between individual player grenade damage percentage of individual damage per round and contribution to total team damage per round?
```
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
```

| player        | current_team      | grenade_damage_percentage | percent_of_total_team_damage |
|---------------|-------------------|---------------------------|------------------------------|
| malbsMd       | 00NATION          | 6.10                      | 17.19                        |
| NENO          | 0to100            | 5.73                      | 100.00                       |
| glowiing      | 1WIN              | 6.13                      | 20.19                        |
| H4RR3         | 777               | 6.28                      | 51.30                        |
| max           | 9z                | 5.44                      | 50.41                        |
| ayaya         | After             | 3.46                      | 100.00                       |
| Rickeh        | Aftershock        | 6.73                      | 32.98                        |
| netrick       | AGF               | 9.88                      | 100.00                       |
| Furlan        | AGO               | 6.82                      | 51.28                        |
| Rock1nG       | allStars          | 6.75                      | 100.00                       |
| ...    | ...           | ...                      | ...                       |

## What are the top players by country?

| player        | player_rating | performance_over_country_avg | country                | player_rank_by_country |
|---------------|---------------|------------------------------|------------------------|------------------------|
| meyern        | 1.11          | 0.08                         | Argentina              | 1/8                    |
| 1962          | 1.07          | 0.04                         | Argentina              | 2/8                    |
| NikoM         | 1.06          | 0.03                         | Argentina              | 3/8                    |
| Noktse        | 1.06          | 0.03                         | Argentina              | 3/8                    |
| JonY BoY      | 1.03          | 0.00                         | Argentina              | 4/8                    |
| reversive     | 0.99          | -0.04                        | Argentina              | 5/8                    |
| nbl           | 0.96          | -0.07                        | Argentina              | 6/8                    |
| tutehen       | 0.93          | -0.10                        | Argentina              | 7/8                    |
| Texta         | 1.21          | 0.15                         | Australia              | 1/44                   |
| INS           | 1.19          | 0.13                         | Australia              | 2/44                   |
| ...          | ...          | ...                         | ...              | ...                   |


To interact with the database, rebuild the .tar file found in the `dump` folder or build a Docker Container:

Run the following commands to build the Postgresql container: 

`docker build -t csgo_postgres_img .`
`docker run --name csgo_postgres_container -d -p 5432:5432 csgo_postgres_img`


select nickname AS player, teams 
INTO
players.player_team_history
from etl.playerstat_source3_transform
UNION
(select player, teams from etl.playerstat_source2_transform)
UNION
(select player, teams from etl.playerstat_source1_transform)
ORDER BY player ASC




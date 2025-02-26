select distinct nickname as player, current_team 
into 
players.player_team_current
from etl.playerstat_source3_transform a
LEFT JOIN 
(select player from etl.playerstat_source2_transform) b
ON a.nickname = b.player
LEFT JOIN
(select player from etl.playerstat_source1_transform) c
ON a.nickname = c.player
order by current_team, player ASC;


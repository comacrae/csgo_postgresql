with map_play_comparison as 
(
	select distinct
	nickname as player, a.maps_played as source3_maps_played, b.maps_played as source2_maps_played
	from etl.playerstat_source3_transform a
	right join 
	(select player, maps_played from etl.playerstat_source2_transform) as b
	on a.nickname = b.player
),
num_source2_out_of_date as (
	select count(1) as ct
	from map_play_comparison
	where source2_maps_played < source3_maps_played
),
num_source3_out_of_date as (
	select count(1) as ct
	from map_play_comparison
	where source3_maps_played < source2_maps_played
)
select num_source2_out_of_date.ct as source_2_ood_ct, num_source3_out_of_date as source_3_ood_ct
from num_source2_out_of_date LEFT JOIN num_source3_out_of_date ON 1=1;
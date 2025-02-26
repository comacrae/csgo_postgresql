select distinct
--general
name,
country,
total_maps,
--performance
kd_diff,
kd,
rating
into teams.full_data
from etl.teamstat_extract
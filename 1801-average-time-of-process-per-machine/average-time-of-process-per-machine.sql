# Write your MySQL query statement below
with raw_data AS 
            (select machine_id,
                     sum(case
                            when activity_type = 'start' then timestamp*-1 
                            else timestamp end)/ (select count(distinct process_id)) as processing_time
            from activity
            group by machine_id)

select machine_id,
round(processing_time,3) as processing_time
from raw_data;
### Joining rota,staff and shift tables to know working_hours and total salary
```
SELECT
  ro.DATE,
  st.first_name,
  st.last_name,
  st.hourly_rate,
  sh.start_time,
  sh.end_time,
  sh.day_of_week,
  ( ( TIMESTAMPDIFF( MINUTE, sh.start_time, sh.end_time ) ) / 60 ) AS working_hours, 
  --- getting working_hour from time difference start and end in minutes devided by 60 to hours ---
  ( ( TIMESTAMPDIFF( MINUTE, sh.start_time, sh.end_time ) ) / 60 ) * st.hourly_rate AS staff_cost 
  
FROM
  rota ro
  LEFT JOIN staff st ON ro.staff_id = st.staff_id
  LEFT JOIN shift sh ON ro.shift_id = sh.shift_id
```

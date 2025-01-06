"Find the average total compensation based on employee titles and gender. 
Output the employee title, gender (i.e., sex), along with the average total compensation."
  
SELECT
  
processed_tickets/all_tickets as rate_of_proccesed,
type
from(
SELECT
SUM(CASE WHEN processed = true THEN 1 ELSE 0 END) AS processed_tickets,
count(processed) as all_tickets,
type
FROM facebook_complaints
group by type ) as counts
group by type;


---
tags:
  - areas
Links: "[[My Areas]]"
---


You are given a dataset that provides the number of active users per day per premium account. A premium account will have an entry for every day that it’s premium. However, a premium account may be temporarily discounted and considered not paid, this is indicated by a value of 0 in the final_price column for a certain day. Find out how many premium accounts that are paid on any given day are still premium and paid 7 days later. Output the date, the number of premium and paid accounts on that day, and the number of how many of these accounts are still premium and paid 7 days later. Since you are only given data for a 14 days period, only include the first 7 available dates in your output.

Table: premium_accounts_by_day

|   account_id:    |   text  |
| --- | --- |
|  entry_date:       |  datetime   |
| final_price: |bigint |
| plan_size:|bigint |
|users_visited_7d: |bigint|


## Source table 
|account_id|entry_date|users_visited_7d|final_price|plan_size|
|---|---|---|---|---|
|A01|2022-02-07|1|100|10|
|A03|2022-02-07|30|400|50|
|A01|2022-02-08|3|100|10|
|A03|2022-02-08|39|400|50|
|A05|2022-02-08|14|400|50|
|A01|2022-02-09|12|100|10|
|A03|2022-02-09|44|400|50|
|A04|2022-02-09|25|0|70|
|A05|2022-02-09|32|400|50|
|A01|2022-02-10|17|100|10|
|A02|2022-02-10|82|800|100|
|A03|2022-02-10|60|400|50|
|A04|2022-02-10|72|0|70|
|A05|2022-02-10|45|400|50|
|A01|2022-02-11|26|100|10|
|A02|2022-02-11|102|800|100|
|A03|2022-02-11|76|400|50|
|A04|2022-02-11|115|0|70|
|A05|2022-02-11|50|400|50|
|A01|2022-02-12|28|100|10|
|A02|2022-02-12|181|800|100|
|A03|2022-02-12|104|400|50|
|A04|2022-02-12|140|20|70|
|A01|2022-02-13|29|100|10|
|A02|2022-02-13|235|800|100|
|A03|2022-02-13|113|400|50|
|A04|2022-02-13|154|20|70|
|A01|2022-02-14|34|100|10|
|A02|2022-02-14|305|800|100|
|A03|2022-02-14|117|400|50|
|A04|2022-02-14|195|20|70|
|A01|2022-02-15|38|100|10|
|A02|2022-02-15|389|800|100|
|A03|2022-02-15|127|400|50|
|A04|2022-02-15|253|20|70|
|A01|2022-02-16|35|100|10|
|A02|2022-02-16|412|800|100|
|A03|2022-02-16|143|0|50|
|A04|2022-02-16|276|20|70|
|A05|2022-02-16|31|250|20|
|A01|2022-02-17|38|100|10|
|A02|2022-02-17|400|800|100|
|A03|2022-02-17|172|0|50|
|A04|2022-02-17|276|20|70|
|A05|2022-02-17|26|250|20|
|A02|2022-02-18|310|800|100|
|A03|2022-02-18|186|0|50|
|A04|2022-02-18|239|20|70|
|A02|2022-02-19|142|800|100|
|A03|2022-02-19|189|0|50|
|A04|2022-02-19|228|20|70|
|A03|2022-02-20|191|0|50|
|A04|2022-02-20|264|20|70|
|A05|2022-02-20|25|350|30|

## Code 

```
SELECT 
a.entry_date, 
count(a.account_id) premium_paid_accounts, 
count(b.account_id) premium_paid_accounts_after_7d
FROM premium_accounts_by_day a
LEFT JOIN premium_accounts_by_day b  ON a.account_id = b.account_id 
AND datediff(b.entry_date, a.entry_date) = 7 
AND b.final_price > 0
WHERE a.final_price > 0
GROUP BY a.entry_date
ORDER BY a.entry_date
LIMIT 7
```

## Solution 

|entry_date|premium_paid_accounts|premium_paid_accounts_after_7d|
|---|---|---|
|2022-02-07 00:00:00|2|2|
|2022-02-08 00:00:00|3|2|
|2022-02-09 00:00:00|3|2|
|2022-02-10 00:00:00|4|3|
|2022-02-11 00:00:00|4|1|
|2022-02-12 00:00:00|4|2|
|2022-02-13 00:00:00|4|1|

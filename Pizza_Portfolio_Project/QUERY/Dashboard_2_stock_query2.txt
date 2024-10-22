# in this query i need to get :
# total weight needed
# Inventory amount
# Inventory remaining per ingredient
SELECT
  s.ing_name,
  s.needed_weight,
  ing.ing_weight * inv.quantity AS total_inv_weight,
  ( ing.ing_weight * inv.quantity ) - s.needed_weight AS remaining_weight 
FROM
  ( SELECT ing_id, ing_name, sum( needed_weight ) AS needed_weight FROM stock_1 GROUP BY ing_id, ing_name ) AS s
  LEFT JOIN inventory inv ON inv.item_id = s.ing_id
  LEFT JOIN ingredient ing ON ing.ing_id = s.ing_id -- total weight in stock = igredient quantity x ingredient weight

> Total quantity by ingredient(No. of orders x ingredient quantity in recipe)
```
SELECT
  q1.item_name,
  q1.ing_id,
  q1.ing_name,
  q1.ing_weight,
  q1.ing_price,
  q1.order_quantity,
  q1.recipe_quantity,
  q1.order_quantity * q1.recipe_quantity AS needed_weight,
  q1.ing_price / q1.ing_weight AS unit_cost,
  ( q1.order_quantity * q1.recipe_quantity ) * ( q1.ing_price / q1.ing_weight ) AS ingredient_cost 
  FROM
  -- sub-query q1
  (
    SELECT
      o.item_id,
      i.sku,
      i.item_name,
      SUM( o.quantity ) AS order_quantity,-- want to calculate order_quantity*recipy_quantity --> have to create sub-query so i can do that
      r.ing_id,-- breaking down pizzas by ingredients
      r.quantity AS recipe_quantity, -- getting ingredient's name
      ing.ing_name,
      ing.ing_price,
      ing.ing_weight 
    FROM
      orders o
      LEFT JOIN item i ON o.item_id = i.item_id -- breaking down     pizzas by ingredients
      LEFT JOIN recipe r ON i.sku = r.recipe_id -- getting ingredient's name/price/weight
      LEFT JOIN ingredient ing ON r.ing_id = ing.ing_id -- order i specify the join condition doesn't matter
    GROUP BY
      o.item_id,
      i.item_name,
      i.sku,
      r.ing_id,
      r.quantity,
      ing.ing_name,
      ing.ing_price,
      ing.ing_weight 
  ) q1
  ````
  > to futher manipulate with this query i will create view stock_1 so i can refer to it as a table

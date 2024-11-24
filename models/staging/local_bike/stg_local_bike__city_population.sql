SELECT
  city,
  population
FROM {{source('local_bike','city_population')}}
WHERE (city='Baldwin' AND state_id='NY') OR (city='Santa Cruz' AND state_id='CA') OR (city='Rowlett' AND state_id='TX')
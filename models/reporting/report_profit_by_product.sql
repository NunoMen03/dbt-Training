select
    productid,
    prodructname,
    category,
    subcategory,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by 
    productid,
    prodructname,
    category,
    subcategory
select 
-- from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.customerid,
o.productid,
o.ordercostprice,
o.ordersellingprice,
--from raw_customer
c.customername, 
c.segment,
c.country,
--from raw_product
p.category,
p.prodructname,
p.subcategory,
ordersellingprice - ordercostprice as orderprofit,
{{ markup('ordersellingprice', 'ordercostprice' ) }} as markup
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on o.productid = p.productid

{{limit_data_in_dev('orderdate')}}


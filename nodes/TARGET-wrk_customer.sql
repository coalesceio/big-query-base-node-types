@id("3a11a746-0f70-44a0-ab3e-063f252e5ebe")
@nodeType("698")
with customer_orders as (
    select
        o.o_orderkey,
        o.o_orderdate,
        c.c_custkey,
        c.c_name,
        n.n_name,
        r.r_name
    from {{ ref('SOURCE2', 'orders') }} o
    join {{ ref('SOURCE2', 'customer') }} c
        on o.o_custkey = c.c_custkey
    join {{ ref('SOURCE2', 'nation') }} n
        on c.c_nationkey = n.n_nationkey
    join {{ ref('SOURCE2', 'region') }} r
        on n.n_regionkey = r.r_regionkey
),

order_details as (
    select
        co.o_orderkey,
        co.o_orderdate,
        co.c_name,
        co.n_name,
        co.r_name,
        li.l_linenumber,
        li.l_partkey,
        li.l_quantity,
        li.l_extendedprice
    from customer_orders co
    join {{ ref('SOURCE2', 'lineitem') }} li
        on co.o_orderkey = li.l_orderkey
)

select
    r_name as region_name,
    n_name as nation_name,
    c_name as customer_name,
    o_orderkey as order_id,
    l_linenumber as line_no,
    l_partkey as product_id,
    l_quantity,
    l_extendedprice as amount
from order_details
order by
    region_name,
    nation_name,
    customer_name,
    order_id,
    line_no;
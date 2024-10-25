{{ config(materialized='table',alias='payament_method_aggr_1')}}

{% set v_payment_methods = ["credit_card/debit_card", "UPI", "Net Banking","Mobile Wallet"] %}

select
order_id,
{% for payement_method in v_payment_methods %}
sum(case when payement_method = '{{payement_method}}' then amount end) as "{{payement_method}}_amount",
{% endfor %}
sum(amount) as total_amount
from raw_data.payments
group by 1
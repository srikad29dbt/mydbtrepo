{{ config(materialized='table',
alias='payament_method_aggregation')}}

{% set pmlist=["credit_card/debit_card", "UPI", "Net Banking","Mobile Wallet"] %}

select
order_id,
{% for payement_method in pmlist %}
sum(case when payement_method = '{{payement_method}}' then amount end) as "{{payement_method}}_amount"
{% if not loop.last %},{% endif %}
{% endfor %}
from raw_data.payments
group by 1
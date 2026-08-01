# Write your MySQL query statement below
select visits.customer_id, count(customer_id) as count_no_trans
from Visits
left join transactions
on Visits.visit_id = transactions.visit_id
where transaction_id is null
group by visits.customer_id;
SELECT date_trunc('day', bpt.date), 
	count(DISTINCT bpt.profile_id) as free_trial_count
FROM dw.store_bagelpointtransaction bpt
	JOIN dw.profiles_profile pp ON bpt.profile_id = pp.id 
WHERE pp.is_tester = FALSE
	AND bpt.is_subscription = TRUE
	AND bpt.spent_dollars = 0
	AND bpt.store_item_id <> 235
	AND bpt.date >= '2020-01-20'
GROUP BY 1
ORDER BY 1;


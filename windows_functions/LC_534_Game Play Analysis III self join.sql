SELECT
        a.player_id,
        a.event_date,
        sum(b.games_played) AS games_played_so_far
FROM activity a JOIN activity b 
ON a.player_id = b.player_id AND 
b.event_date <= a.event_date
GROUP BY a.player_id, a.event_date
ORDER BY a.player_id, a.event_date 
create database IPL;
use IPL;
show tables;
show databases;
select * from matches;
select * from deliveries;
# 1. What are the top 5 players with the most player of the match awards?
select player_of_match,count(*) as awards_count
from matches 
group by player_of_match
order by awards_count desc
limit 5;

#2. How many matches were won by each team in each season? 
select season,winner as Team,count(*) as match_won
from matches 
group by season,winner;

#3. What is the Average strike rate of batsmen in th IPL dataset? 
select batter as Batsman,
(sum(total_runs)/count(ball)) *100 as Strike_rate
from deliveries 
group by batter;
 
 #4. Which batsman has the highest strike rate ??
 select batter,(sum(batsman_runs)*100/count(*)) as Strike_Rate from deliveries
 group by batter 
 order by Strike_Rate desc
 limit 5;
 
#5 how many batsman was dimissed by bowler by SL malinga ? 
select batter,count(*) as total_dismissals from deliveries
where bowler = 'SL Malinga' 
group by batter;

#6 How many times did each team win the toss in each season??
select season, toss_winner,count(*) as toss_wins 
from matches 
group by season,toss_winner;

#7(JOin) How many Extra(Wide & no-ball) were bowled by each  team in each match?
select m.id as Match_no,d.bowling_team,sum(d.extra_runs) as extra
from matches as m 
join 
deliveries as d 
on 
d.match_id=m.id
where extra_runs>0
group by m.id,d.bowling_team;

#8 Which bowler has the best bowling figures (most wickets taken) in a single match?
select m.id as match_no ,d.bowler, count(*) as wickets_taken
from matches as m 
join 
deliveries as d 
on 
m.id=d.match_id 
where d.player_dismissed is not null
group by m.id,d.bowler
order by wickets_taken
limit 5;



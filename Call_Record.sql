Drop database if exists `CALL RECORD` ;
create database `CALL RECORD`;
use  `call record`;

# import call center cvs file as a table.
# View The Data.
select * from `call center`;

# Note: SLA means service Level Agreement
# 1 Call center with the longest duration of calls
select call_center, max(`call duration in minutes`)from `call center` group by call_center limit 1;
# Los Angeles/CA has max call duration of 45mins

# 2 How many calls were within SLA and Above  SLA
select count(response_time) from `call center` where response_time = 'within SLA' ;
select count(response_time) from `call center` where response_time  = 'Above SLA';
# We have 20625 calls within SLA and 4168 calls Above SLA. 

# 3 Why did  people call most ?
select distinct reason from `call center` limit 1;
# They calls for Billing Questions

# 4 Total Lenght of calls
select sum(`call duration in minutes`) from `call center`;
# Total lenght of all calls is 824222 mins

# 5 Contacts Made through Chatbox were mostly for what reason
select distinct reason from `call center` where channel = 'chatbot';
# They are mostly for Billing Questions and service outage

# 6 What State has the most negative contact
select state, count('sentiment') from `call center` where sentiment = 'negative' group by state limit 1;
# The State is florida


# 7 What is the average minutes for calls with positive sentiment
select avg(`call duration in minutes`) from `call center`  where sentiment = 'positive';
# Average positive sentiment calls is 24.8620

# 8 What is the total hours spent on all calls for the month of october 
select sum(`call duration in minutes`) / '60'from `call center`;
# Total hours spent is 13,737.03hours.

# 9 How many calls had very positve sentiments
select count(`call duration in minutes`) from `call center`  where sentiment = 'very positive';
# 3170 calls had very positve sentiments.

# 10 How many calls had very Negative sentiments
select count(`call duration in minutes`) from `call center`  where sentiment = 'very Negative';
# 6026 calls had very Negative sentiments

# How many calls where below SLA. 
select Count(response_time) from `call center`  where response_time = 'Below SLA';
# 8148 calls where Below SLA



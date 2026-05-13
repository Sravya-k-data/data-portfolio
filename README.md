# data-portfolio - Sravya K
## Week 1 - SQL Reactivation
### Day 1 - Chicago taxi + Citibike analysis
**Datasets used-** Chicago taxi trips (almost 200M rows) + NYC Citibike 
**What I explored so far:**
- Granularity of the data - each row represent one trip , not one taxi
- what drives the fare - distance Vs time of the day
- Found 5 am has highest fare due to long trip disatnces
- then calculated fare per mile to see if time impact
- Found 2 am trips have high fare per mile due to low volume availability - supply side pricing not due to huge demand/demand side pricing
- Learned INNER JOIN Vs LEFT JOIN through a ID mismatch existed in the data

**Tools:** BigQuery SQL, Google Cloud Sandbox

**Skills Practiced:**
SELECT, WHERE, ORDER BY, GROUP BY, AVG(), ROUND(), CAST(), EXTRACT(), NULLIF(), INNER JOIN, LEFT JOIN, aliases

DROP TABLE churn;

CREATE MULTISET TABLE churn
(VMailMessage INTEGER,
DayMins DECIMAL(10,3),
EveMins DECIMAL(10,3),
NightMins DECIMAL(10,3),
IntlMins DECIMAL(10,3),
CustServCalls INTEGER, 
DayCalls INTEGER,
DayCharge DECIMAL(10,3),
EveCalls INTEGER,
EveCharge DECIMAL(10,3),
NightCalls INTEGER,
NightCharge DECIMAL(10,3),
IntlCalls INTEGER,
IntlCharge DECIMAL(10,3),
AreaCode VARCHAR(3),
Phone VARCHAR(9),
AccountLength INTEGER,
Churn VARCHAR(1),
IntlPlan INTEGER,
VMailPlan INTEGER,
State VARCHAR(3))
PRIMARY INDEX (Phone);


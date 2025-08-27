-- project

-- Debit and Credit banking_data

/*
Columns

'Customer ID',
 'Customer Name',
 'Account Number',
 'Transaction Date',
 'Transaction Type',
 'Amount',
 'Balance',
 'Description',
 'Branch',
 'Transaction Method',
 'Currency',
 'Bank Name'
 */
 
 create database aditya;
 
 use aditya;
 
 create table `Debit & Credit Banking Data`(
 `Customer ID` text,
 `Customer Name` varchar(200),
 `Account Number` char(10),
 `Transaction Date` date,
 `Transaction Type` varchar(50),
 `Amount` float,
 `Balance` float,
 `Description` varchar(100),
 `Branch` varchar(100),
 `Transaction Method` varchar(100),
 `Currency` char(3),
 `Bank Name` varchar(100)
 );
 
select * from `Debit & Credit Banking Data`;

-- 1

select sum(amount) as `Total Credit Amount` from `Debit & Credit Banking Data`
where `Transaction Type` = 'Credit';

-- 2 

select sum(amount) as `Total Debit Amount` from `Debit & Credit Banking Data`
where `Transaction Type` = 'Debit';

 -- 3
 
select 
(sum(case when `Transaction Type` = "Credit" then amount else 0 end) /
sum(case when `Transaction Type` = "Debit" then amount else 0 end)) as `Credit To Debit Ratio`
from `Debit & Credit Banking Data`;

-- 4

select 
(sum(case when `Transaction Type` = "Credit" then amount else 0 end) -
sum(case when `Transaction Type` = "Debit" then amount else 0 end)) as `Net Transaction Amount`
from `Debit & Credit Banking Data`;

-- 5

select count(*) / sum(Balance) as `Account Activity Ratio` from `Debit & Credit Banking Data`;

-- 6

select day(`Transaction Date`) as `Day`,count(`Customer ID`) as `Number of transactions occurring per Day` from `Debit & Credit Banking Data`
group by `Day`
order by `Day` asc; 

select Monthname(`Transaction Date`) as `Month`,count(`Customer ID`) as `Number of transactions occurring per Month` from `Debit & Credit Banking Data`
group by `Month`
order by `Number of transactions occurring per Month` asc;

select Year(`Transaction Date`) as `Year`,count(`Customer ID`) as `Number of transactions occurring per Year` from `Debit & Credit Banking Data`
group by `Year`
order by `Number of transactions occurring per Year` asc;

-- 7

select Branch,sum(amount) as `Total Transaction Amount by Branch` from `Debit & Credit Banking Data`
group by Branch;

-- Bank Data Analystics

/*
Columns 

' State Abbr',
 'Account ID',
 'Age ',
 'BH Name',
 'Bank Name',
 'Branch Name',
 'Caste',
 'Center Id',
 'City',
 'Client id',
 'Client Name',
 'Close Client',
 'Closed Date',
 'Credif Officer Name',
 'Dateof Birth',
 'Disb By',
 'Disbursement Date',
 'Disbursement Date (Years)',
 'Gender ID',
 'Home Ownership',
 'Loan Status',
 'Loan Transferdate',
 'NextMeetingDate',
 'Product Code',
 'Grrade',
 'Sub Grade',
 'Product Id',
 'Purpose Category',
 'Region Name',
 'Religion',
 'Verification Status',
 'State Abbr',
 'State Name',
 'Tranfer Logic',
 'Is Delinquent Loan',
 'Is Default Loan',
 'Age _T',
 'Delinq 2 Yrs',
 'Application Type',
 'Loan Amount',
 'Funded Amount',
 'Funded Amount Inv',
 'Term',
 'Int Rate',
 'Total Pymnt',
 'Total Pymnt inv',
 'Total Rec Prncp',
 'Total Fees ',
 'Total Rrec int',
 'Total Rec Late fee',
 'Recoveries',
 'Collection Recovery fee'
 */
 
 create table `Bank Data Analystics`(
 `State Abbr` varchar(100),
 `Account ID` varchar(100),
 `Age` char(5),
 `BH Name` varchar(100),
 `Bank Name` char(7),
 `Branch Name` varchar(100),
 `Caste` char(10),
 `Center Id` varchar(100),
 `City` varchar(100),
 `Client id` int,
 `Client Name` varchar(100),
 `Close Client` varchar(10),
 `Closed Date` date,
 `Credif Officer Name` varchar(100),
 `Dateof Birth` date,
 `Disb By` varchar(100),
 `Disbursement Date` date,
 `Disbursement Date (Years)` varchar(50),
 `Gender ID` varchar(100),
 `Home Ownership` varchar(100),
 `Loan Status` varchar(100),
 `Loan Transferdate` varchar(10),
 `NextMeetingDate` date,
 `Product Code` varchar(10),
 `Grrade` varchar(10),
 `Sub Grade` varchar(10),
 `Product Id` varchar(100),
 `Purpose Category` varchar(100),
 `Region Name` varchar(100),
 `Religion` varchar(100),
 `Verification Status` varchar(100),
 `State Abbr_1` varchar(10),
 `State Name` varchar(100),
 `Tranfer Logic` varchar(100),
 `Is Delinquent Loan` char(1),
 `Is Default Loan` char(1),
 `Age _T` int,
 `Delinq 2 Yrs` int,
 `Application Type` varchar(100),
 `Loan Amount` int,
 `Funded Amount` int,
 `Funded Amount Inv` int,
 `Term` varchar(20),
 `Int Rate` varchar(10),
 `Total Pymnt` float,
 `Total Pymnt inv` float,
 `Total Rec Prncp` float,
 `Total Fees` float,
 `Total Rrec int` float,
 `Total Rec Late fee` float,
 `Recoveries` float,
 `Collection Recovery fee` float
 );

select * from `Bank Data Analystics`;


select * from `Bank Data Analystics`;

-- 1

/*
1. Total Loan Amount Funded
Definition: The total monetary value of all loans disbursed to clients.
Purpose: Indicates the bank's lending capacity and market outreach.
*/

select sum(`funded amount`) as `funded amount` from `Bank Data Analystics`;

-- 2

/*
2. Total Loans
Definition: The total number of loans issued, including active and closed loans.
Purpose: Measures the scale of lending activities.
*/

select count(*) from `Bank Data Analystics`;

-- 3

/*
3. Total Collection
Definition: The total amount collected from borrowers, including principal and interest.
Purpose: Tracks repayment performance and cash flow generation.
*/

select sum(`total pymnt inv`) as `total amount collected` from `Bank Data Analystics`;
 
 -- 4
 
 /*
 4. Total Interest
Definition: The total revenue generated from interest on loans.
Purpose: Reflects the profitability of the bank's lending operations.
 */
 
 select avg(`Int Rate`)*100 as `The total revenue generated from interest on loans` from `Bank Data Analystics`;
 
 -- 5
 
 /*
 5. Branch-Wise (Interest, Fees, Total Revenue)
Definition: Revenue breakdown by branch, including interest income, fees, and combined revenue.
Purpose: Assesses the performance of individual branches.
 */
 
 select `Branch Name`,sum(`Loan Amount`) as `Total_amt` from `Bank Data Analystics`
 group by `Branch Name`;
 
 
 -- 6
 
 /*
  6. State-Wise Loan
Definition: Distribution of loans across different states.
Purpose: Analyzes geographic trends in lending.
 */

 select `State Name`,sum(`Loan Amount`) as `Total_amt` from `Bank Data Analystics`
 group by `State Name`;
 
 -- 7
 
 /*
 7. Religion-Wise Loan
Definition: Loan distribution categorized by clients’ religious demographics.
Purpose: Ensures compliance with any diversity or inclusion policies.
 */
 
 select `Religion`,sum(`Loan Amount`) as `Total_amt` from `Bank Data Analystics`
 group by `Religion`;
 
 -- 8
 
 /*
 8. Product Group-Wise Loan
Definition: Loan categorization by product types, e.g., personal, mortgage, or auto loans.
Purpose: Identifies product performance and trends.
 */
 
 select `Purpose Category`,sum(`Loan Amount`) as `Total_amt` from `Bank Data Analystics`
 group by `Purpose Category`; 
 
 -- 9 
 
 /*
 9. Disbursement Trend
Definition: Historical trend of loan disbursements over time.
Purpose: Tracks growth or decline in lending activities.
*/

select year(`Disbursement Date`) as `year`,month(`Disbursement Date`) as `month`,SUM(`Funded Amount`) as `Total Disbursement`
from `Bank Data Analystics`
group by `year`,`month`
order by `year`,`month`;
 
 -- 10
 
 /*
 Transaction Volume by Bank:

Formula: Sum of the Amount column grouped by Bank Name.
Insight: Helps compare the performance of different banks in terms of transaction activity.
 */
 
select`bank name`,SUM(`loan amount`) as `total transaction volume`
from `Bank Data Analystics`
group by `bank name`
order by `total transaction volume` DESC;

-- 11

/*
9-Transaction Method Distribution:

Formula: Count or percentage of transactions grouped by Transaction Method (Bank Transfer, Debit Card, Credit Card, etc.).
Insight: Shows which transaction methods are most popular, helping to optimize service offerings.
*/

select `Tranfer Logic`, COUNT(*) AS `transaction count`,(COUNT(*) * 100.0 / (select COUNT(*) from `Bank Data Analystics`)) as `percentage`
from `Bank Data Analystics`
group by `Tranfer Logic`
order by `transaction count` desc;


-- 12

/*
10. Grade-Wise Loan
Definition: Classification of loans based on borrower credit grades.
Purpose: Measures the risk profile of the loan portfolio.
*/

select grrade, COUNT(*) AS `loan count`,SUM(`funded amount`) as `total loan amount`
from `Bank Data Analystics`
group by grrade
order by `total loan amount` desc;


 select * from `Bank Data Analystics`;
 
 -- 13
 
 /*
 11. Count of Default Loan
Definition: Total number of loans that have defaulted.
Purpose: Highlights credit risk and loss exposure.
 */
 
select COUNT(*) as `default loan count`
from `Bank Data Analystics`
where `is default loan` = 1;

-- 14

/*
Loan Status-Wise Loan
Definition: Distribution of loans based on their current status (active, closed, delinquent, defaulted).
Purpose: Provides a comprehensive overview of the portfolio's health.
*/

select `Loan Status`,sum(`Loan Amount`) as `Total_amt` from `Bank Data Analystics`
 group by `Loan Status`;
 
 -- 15
 
 /*
 Age Group-Wise Loan
Definition: Loan allocation segmented by borrowers’ age groups.
Purpose: Analyzes customer demographics and lending patterns.
*/
 
select `Age`,sum(`Loan Amount`) as `Total_amt` from `Bank Data Analystics`
 group by `Age`;
 
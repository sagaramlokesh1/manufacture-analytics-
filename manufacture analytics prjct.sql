Create database manufacture;
use manufacture;
SELECT * FROM  fact_production;

-- 1. Total Work_orders 
select count(distinct Doc_Num) as totalwork_orders from fact_production;

-- 2.Total Work_order Qty
select sum(WO_Qty) as Total_ordered_Qty from fact_production;

-- 3.Total Manufactured (Produced) Qty
select sum(Produced_Qty) as Total_Produced_qty from fact_production;

-- 4.Total Processed Qty
select sum(Processed_Qty) as Total_Processed_qty from fact_production;

-- 5.Efficiency Rate %
select concat(round(SUM(Produced_Qty) / SUM(Processed_Qty)*100 ,2),'%')as Efficiency_rate from fact_production;

-- 6.Machine Utilization %
select concat(round(SUM(Processed_Qty) / SUM(WO_Qty)*100,2),'%' )as Machine_utilization from fact_production;

-- 7.Total Manufacturing Cost
select sum(Total_Value) as manufacturing_cost from fact_production;

-- 8.Cost per Unit
select round(SUM(Total_Value) / SUM(Produced_Qty),2)as cst_per_unit from fact_production;

-- 9 Avg Per-Day Machine Cost
SELECT round(avg(per_day_machine_cost),2) as Avg_per_day_Machine_cost from fact_production;

-- 10 On-Time Delivery %
SELECT ROUND(SUM(CASE
WHEN Delivery_Status = 'On Time' THEN 1
ELSE 0
END) * 100.0
/ NULLIF(COUNT(*), 0),
2
) AS On_Time_Delivery_Pct
FROM fact_Production;


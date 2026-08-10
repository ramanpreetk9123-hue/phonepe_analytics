**PhonePe Transaction & Product Analytics**

An end-to-end **Data & Product Analytics** project using **MySQL and Power BI** to analyze PhonePe transaction, customer, service and payment data and translate the analysis into actionable product recommendations.

## 🎯 Project Overview

The objective of this project was to understand transaction and customer behavior across the PhonePe ecosystem and identify opportunities to improve:

- Transaction growth and engagement
- Customer activity and retention
- Service adoption
- Payment performance
- High-value customer engagement
- Overall product experience

The project follows an end-to-end analytics workflow:

**Data → SQL Analysis → Power BI Dashboard → Insights → Product Recommendations**

## 🛠️ Tools & Technologies

**| Tool | Usage |**
| MySQL| Data import, validation, transformation and analysis, Aggregations, filtering, grouping, joins, duplicate checks and trend analysis |
| Power BI| Interactive dashboard and data visualization |
| DAX | KPI measures, transaction metrics, customer metrics and trend calculations |
| Figma | Dashboard UI/background design |
| Excel| Data preparation and validation |

# 🗄️ SQL Analysis

The SQL analysis was divided into five major analytical areas.

## 1. Data Validation

Before performing the analysis, the dataset was validated for data quality and consistency.

### Checks performed:

- Total user count
- Total transaction count
- Duplicate `User_ID` records
- Duplicate `Transaction_ID` records
- Missing/null values
- Blank values across important fields
- Basic dataset consistency checks

## 2. Transaction Analysis

Analyzed transaction behavior to understand overall transaction activity and trends.

### Analysis included:

- Total transaction volume
- Total transaction value
- Average transaction value
- Transaction trends over time
- Monthly transaction performance
- Month-over-month changes
- High-value transactions
- High-frequency transaction behavior
- Weekday vs. weekend transaction patterns
- Transaction distribution across users

## 3. Customer Analysis

Analyzed customer-level transaction behavior to understand how different users interact with the platform.

### Analysis included:

- Total transactions per customer
- Total transaction value per customer
- Highest-transacting customers
- Highest transaction-value customers
- Customer transaction frequency
- Customer segmentation based on transaction behavior
- Identification of high-value users

This analysis helped distinguish between:

**High-frequency users** and **high-value users**

which can have different product and engagement opportunities.

## 4. Service Analysis

Analyzed transaction behavior across different PhonePe services.

### Analysis included:

- Service-wise transaction volume
- Service-wise transaction value
- Service contribution to overall activity
- Most-used services
- Comparison of service performance

The objective was to identify which services contribute most strongly to overall user activity and where additional adoption opportunities may exist.

## 5. Payment Analysis

Analyzed payment performance to understand successful and unsuccessful transaction behavior.

### Analysis included:

- Payment status distribution
- Successful transactions
- Failed transactions
- Payment success rate
- Payment failure patterns

This analysis was used to identify opportunities for improving payment reliability and transaction recovery.

# 📊 Power BI Dashboard

The SQL analysis was translated into an interactive Power BI dashboard.

### Dashboard Areas

The dashboard provides a consolidated view of:

- Transaction KPIs
- Transaction value
- Customer activity
- Service performance
- Payment performance
- Customer transaction behavior
- Time-based transaction trends
- Weekday vs. weekend behavior
- High-value customers
- High-frequency customers

# 📐 DAX & Power BI

Power BI was used not only for visualization but also for creating analytical measures and KPIs.

### DAX was used for:

- Total transaction calculations
- Transaction value calculations
- Customer metrics
- Average transaction metrics
- Payment success/failure metrics
- Percentage-based KPIs
- Time-based analysis
- Comparative metrics
- Dynamic dashboard calculations

The dashboard was designed to allow users to move from **high-level KPIs → trends → customer/service/payment-level insights**.

# 🎨 Dashboard Design

The dashboard interface was designed with a focus on:

- Clear KPI hierarchy
- Consistent visual structure
- Easy interpretation of trends
- User-friendly navigation
- Minimal visual clutter
- Product-analytics style storytelling

**Figma** was used to support the dashboard's visual/UI design.

# 🔍 Key Analytical Insights

The analysis focused on identifying patterns across four major dimensions:

### Customers
Identified differences between high-frequency and high-value customers and analyzed individual customer transaction behavior.

### Transactions
Analyzed transaction volume, transaction value and changes over time to understand overall transaction activity.

### Services
Compared service-level transaction activity and identified opportunities to increase adoption of lower-performing services.

### Payments
Analyzed successful and failed payment behavior to identify potential opportunities for improving payment reliability and recovery.

# 💡 Recommendations

Based on the analysis, the following product opportunities were identified:

### 1. Improve Failed Payment Recovery

Introduce clearer retry flows and contextual prompts for users experiencing failed transactions.

**Potential impact:** Reduce transaction drop-offs and recover otherwise lost transactions.

### 2. Increase Adoption of Lower-Usage Services

Use personalized recommendations to promote relevant PhonePe services to users who primarily use only one or two services.

**Potential impact:** Increase cross-service adoption and customer engagement.

### 3. Target High-Value Customers

Create differentiated engagement strategies for customers with high transaction value or high transaction frequency.

Potential initiatives could include:

- Personalized offers
- Relevant service recommendations
- Loyalty-based incentives
- Priority support experiences

### 4. Increase Repeat Usage

Identify customers with declining or infrequent activity and use targeted communication to encourage repeat transactions.

Potential strategies include:

- Personalized reminders
- Relevant offers
- Service discovery campaigns
- Behavioral segmentation

### 5. Optimize Engagement Around Usage Patterns

Use weekday/weekend and time-based transaction patterns to optimize campaign timing and user communication.

**Potential impact:** Improve campaign relevance and increase engagement.


# 🚀 Project Outcome

This project demonstrates an end-to-end analytics workflow:

**1. Validate the data**  
↓  
**2. Analyze the data using SQL**  
↓  
**3. Build analytical measures using DAX**  
↓  
**4. Visualize insights using Power BI**  
↓  
**5. Identify customer/product opportunities**  
↓  
**6. Translate insights into recommendations**

The project combines **technical analytics skills with business and product thinking**, with the goal of turning raw transaction data into actionable decisions.

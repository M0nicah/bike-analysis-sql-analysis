# Bike Store Sales & Inventory Analysis
**Project Overview:** This project analyzes a relational database of a multi-state bike retailer to uncover sales trends, staff performance and inventory health.

### Project Structure
The dataset was sourced from [Kaggle.](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database)

### Tech Stack
* Database: SQLite
* Query language: SQL
* Tool: DB Browser for SQLite

### Key Insights & Findings
#### A. Sales and Revenue Analysis
* Top Performers: Through a multi-table join of staffs, orders, and order_items, we identified the top 3 sales representatives.

* Insight: Revenue was calculated as Net Revenue ```($List Price \times Quantity \times (1 - Discount)$)``` to account for promotional impacts.State-Level 

* Power: New York currently leads in total revenue. While Trek is the dominant brand across the board, specific niche brands show higher growth potential in the Texas market.

* Pricing Strategy: Using `CASE` logic, we categorized the catalog into `Price Tiers`. **60% **of the inventory is classified as `'Luxury' (Over $2000)`, confirming the brand’s position as a high-end specialty retailer.

#### B. Operational Efficiency
* Fulfillment Speed: The average time from order placement to shipment is ``1.98 days``.

* Insight: This indicates a highly efficient logistics pipeline, likely due to decentralized inventory across the three state hubs.

* Store Diversity:*Using `COUNT(DISTINCT)`, we found that all stores maintain a consistent diversity score of `7 categories`, suggesting a standardized corporate inventory mandate.

#### C. Inventory Health
* Dead Stock Identification: Using a *LEFT JOIN* to find products with no corresponding order records, we identified several models that have zero sales to date.

* Insight: These products represent "trapped capital" that is currently costing the company in storage fees without generating return.

#### D. Customer Behavior
* Retention Warning: Our "Customer Loyalty" query returned 0 results for customers with more than 3 orders.

* Insight: The business has a high "Churn Rate." While the store is good at attracting new buyers, it is struggling to create repeat customers.

### Strategic Recommendations

Based on the data, here are four practical things the shop can do right now to make more money and run smoother:

* Bring Customers Back: Since we noticed that almost no one shops with us more than once or twice, we should start a simple "Return & Save" program. For example, we could send a 10% discount coupon to a customer three months after they buy a bike to encourage them to come back for accessories or a tune-up.

* Clearance Sale: Our analysis found several bike models that haven't sold a single unit. These are taking up space that could be used for bikes people actually want. We should put these on a "Clearance Sale" or bundle them with a free helmet to get them out of the warehouse quickly.

* Stock Improvement in Texas: Right now, every store carries the same types of bikes. However, the data shows that people in Texas have different brand tastes than people in New York. We should stop sending the same "standard" kit to every store and tailor the inventory to match what each state actually buys.

* Market About Our Speed: Our team is incredibly fast at getting orders out the door (usually in less than 2 days). We should mention this on our social media and website. In a world where people want things "now," our fast shipping is a huge reason why someone would choose us over a competitor.

### Technical Skills Demonstrated
* Complex Joins: 5+ table joins linking customers to brands.

* Data Aggregation: `SUM`, `AVG`, `COUNT(DISTINCT)`.

* Conditional Logic: `CASE WHEN` for price tiering.

* Set Theory: `LEFT JOIN` with `IS NULL` for gap analysis.

* Date Arithmetic: Precise calculation of fulfillment intervals.





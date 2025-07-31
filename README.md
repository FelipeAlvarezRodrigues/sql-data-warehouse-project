# 📊 Data Warehouse und Analytics Project

## 🧠 Overview

This project implements a Data Warehouse using **SQL Server**, following the **Medallion Architecture** (🏅 Bronze, 🥈 Silver, 🥇 Gold layers). It supports structured, scalable, and clean data modeling, enabling powerful reporting and analytics.
The entire solution runs inside a Docker 🐳 container for easy deployment and consistent environments across different systems.

## 🏗️ Architecture

- 🏅 **Bronze Layer**: Raw data ingested from various sources.
- 🥈 **Silver Layer**: Cleaned and enriched data with applied business rules.
- 🥇 **Gold Layer**: Final curated data used for reporting, dashboards, and analytics.

## 🔄 ETL Process

The ETL (Extract, Transform, Load) pipeline is designed to:

1. 📥 **Extract** data from source systems (In this case, CSV Files).
2. 🔧 **Transform** data to ensure consistency, validation, and enrichment.
3. 📤 **Load** the transformed data into respective Medallion layers.

ETL jobs are implemented with SQL scripts

#### 📐 Specifications
- 🗂️ **Data Sources**: Import data from two source systems (ERP and CRM).
- 🧹 **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- 🔗 **Integration**: Combine both sources into a single, user-friendly data model designed for analytics teams.
- 📄 **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.

---

### 📈 BI: Analytics and Reporting (Data Analytics)

### 🎯 Objective
Develop SQL-based analytics to deliver detailed insights into:
- 👥 **Customer Behavior**
- 📦 **Product Performance**
- 💰 **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

---

🏠 Deployment & Environment

This project is hosted on a personal Ubuntu Server 🖥️ running SQL Server inside a Docker 🐳 container, orchestrated with Docker Compose 📦.
This setup streamlines deployment, improves environment consistency, and enhances scalability and portability.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## 🛠️ Tools & Technologies

- 🗄️ Microsoft SQL Server (Database Engine)
- 🧾 T-SQL for transformations and procedures
- 🐳 Docker/ Docker Compose for the SQL Server Container (if you use Docker for your Apps)



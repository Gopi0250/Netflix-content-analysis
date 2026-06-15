# 🎬 Netflix Content Strategy & Viewership Analysis

![Netflix](https://img.shields.io/badge/Domain-Media%20%26%20Entertainment-red)
![Python](https://img.shields.io/badge/Python-3.11-blue)
![SQL](https://img.shields.io/badge/MySQL-8.0-orange)
![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![Status](https://img.shields.io/badge/Status-Completed-green)

## 📋 Project Overview

A comprehensive end-to-end data analytics project analyzing 
Netflix's content catalog of 8,800+ titles across 88 countries 
to deliver actionable business recommendations for the 
Content Strategy & Acquisition Team.

**Business Problem:** Netflix's content team lacks visibility 
into which content types, genres, and regions are driving 
catalog growth — making budget decisions subjective rather 
than data-driven.

---

## 🎯 Business Questions Answered

| # | Question | Answer |
|---|----------|--------|
| 1 | Movies vs TV Shows split? | 70% Movies, 30% TV Shows |
| 2 | Peak content addition year? | 2019 (2,153 titles) |
| 3 | Top content producing country? | USA (42% of catalog) |
| 4 | Most popular genre? | International Movies & Dramas |
| 5 | Dominant content rating? | TV-MA (38% — Adult content) |
| 6 | Average movie duration? | ~100 minutes |
| 7 | Peak content addition month? | December |
| 8 | Fresh vs Library content? | 33% Fresh, 67% Library |
| 9 | Most prolific director? | Rajiv Chilaka (19 titles) |
| 10 | Most common TV Show length? | 1 Season (67% of shows) |

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| Python 3.11 | Data cleaning & EDA |
| Pandas & NumPy | Data manipulation |
| Matplotlib & Seaborn | Visualizations |
| MySQL | SQL analysis & queries |
| Power BI | Interactive dashboard |
| GitHub | Version control & portfolio |

---

## 📁 Project Structure

netflix-content-analysis/

├──data/
|    ─> raw/                    # Original dataset
|    ─> cleaned/                # Cleaned & processed data
├──notebooks/
|
|    -> 01_data_assessment.ipynb
|    -> 02_data_cleaning.ipynb
|    -> 03_eda_visualizations.ipynb
|
├──sql/ 
|    -> netflix_analysis_queries.sql
|    
├──dashboard/ 
|       
|    -> Netflix_Dashboard.pbix
|    
|
└──visuals/ 
|
|     -> All charts & dashboard screenshots
|                   
└── docs/                     
        -> Documentation & recommendations
---

## 📊 Key Insights & Visualizations

### Executive KPI Dashboard
![Dashboard](visuals/dashboard_page1.png)

### Content Distribution
![Content Type](visuals/01_content_type_split.png)

### Yearly Growth Trend
![Yearly Trend](visuals/02_content_per_year.png)

### Top Countries
![Countries](visuals/03_top_countries.png)

### Top Genres
![Genres](visuals/04_top_genres.png)

---

## 💡 Top 5 Business Recommendations

1. **Increase TV Show Investment** from 30% to 45% of content budget
2. **Expand International Content** — reduce USA dominance from 42% to 30%
3. **Rebalance Rating Strategy** — increase Family content from 12% to 25%
4. **Optimize Release Timing** — minimum 400 titles per month consistently
5. **Shift to Originals** — increase original productions from 33% to 55%

---

## 🗄️ SQL Analysis Highlights

```sql
-- Content Type Distribution
SELECT type,
       COUNT(*) AS total,
       ROUND(COUNT(*) * 100.0 / 
       (SELECT COUNT(*) FROM netflix_titles), 2) AS percentage
FROM netflix_titles
GROUP BY type;

-- Peak Content Year
SELECT year_added, COUNT(*) AS titles_added
FROM netflix_titles
WHERE year_added IS NOT NULL
GROUP BY year_added
ORDER BY titles_added DESC
LIMIT 5;
```

---

## 🚀 How to Run This Project

### Prerequisites

Python 3.11+

MySQL 8.0+

Power BI Desktop

### Setup Steps
```bash
# 1. Clone the repository
git clone https://github.com/gopi0250/netflix-content-analysis.git

# 2. Install required libraries
pip install pandas numpy matplotlib seaborn mysql-connector-python sqlalchemy

# 3. Run notebooks in order
# Open notebooks/ folder in VS Code
# Run 01_data_assessment.ipynb first
# Then 02_data_cleaning.ipynb
# Then 03_eda_visualizations.ipynb

# 4. Run SQL queries
# Open sql/netflix_analysis_queries.sql in MySQL Workbench

# 5. Open dashboard
# Open dashboard/Netflix_Dashboard.pbix in Power BI Desktop
```

---

## 📈 Dataset

- **Source:** [Netflix Movies and TV Shows — Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows)
- **Size:** 8,807 titles
- **Columns:** 12 original + 8 engineered features
- **Time Period:** 1925 — 2021

---

## 👤 Author

**GOPI J**
Aspiring Data Analyst | Media & Entertainment Domain

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/gopi1205)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/Gopi0250)

---

## 📄 License

This project is for educational purposes.
Dataset credit: Shivam Bansal (Kaggle)
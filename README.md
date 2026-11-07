# Netflix Content Strategy Analysis

End-to-end analysis of **8,807 Netflix movies and TV shows** using Python, MySQL and Power BI, to understand how the catalog has evolved and where Netflix should focus future content investment.

## 🎯 Business Question
How has Netflix's catalog changed over time, and which content types, markets and audiences should it prioritize?

## 🛠️ Tools
Python (Pandas, NumPy, Matplotlib, Seaborn) · MySQL · Power BI (Power Query, DAX)

## 📂 Dataset
Netflix Movies & TV Shows (Kaggle): 8,807 titles × 12 columns, covering type, country, date added, release year, rating, duration and genre. Data runs to September 2021.

## 🧹 Data Cleaning
- Fixed **3 rows** where the duration (e.g. "74 min") had been stored in the rating column
- Filled missing director (29.9%), cast and country values with "Unknown"; dropped 10 rows with no date added
- Converted dates and engineered year added, month added, decade and content age
- Split multi-country, multi-genre and multi-director fields into one row per value for accurate counts

## 📈 Key Insights
| Finding | Result |
|---|---|
| Catalog mix | **69.7% movies**, 30.3% TV shows |
| Growth in titles added | **82 (2015) → 2,016 (2019)**, about 25× |
| TV share of new additions | Rose every year since 2018: **25.0% → 33.7%** (2021) |
| Top content countries | United States (**3,683**), India (**1,046**) |
| India vs US content mix | India **92.0% movies** vs US **74.7%** |
| Adult-rated titles (TV-MA, R, NC-17) | about **45%** of the catalog |
| Most common genres | International Movies (**2,752**), Dramas (**2,427**) |

## 💡 Recommendations
1. **Keep investing in TV series**, since their share of new additions is rising.
2. **Expand Indian TV content**: India is the second-largest content source but is almost entirely movies.
3. **Grow kids and family content** to balance a catalog weighted toward adult audiences.

## 📁 Files
| File | Description |
|---|---|
| `main.ipynb` | Python analysis notebook with charts and findings |
| `netflix project.sql` | MySQL queries |
| `Netflix Movies & TV Shows Dashborad.pbix` | Power BI dashboard |
| `netflix_titles.csv` | Raw dataset |

## 👤 Author
**Davis Wilson**, Data Analyst · [LinkedIn](https://www.linkedin.com/in/datawithdavis) · [GitHub](https://github.com/DataWithDavis)

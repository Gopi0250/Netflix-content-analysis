-- ══════════════════════════════════════════════════
-- Q1: What is the overall split between 
--     Movies and TV Shows?
-- Business Value: Understand platform content mix
-- ══════════════════════════════════════════════════

SELECT 
    type,
    COUNT(*) AS total_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM netflix_titles), 2) 
        AS percentage
FROM netflix_titles
GROUP BY type
ORDER BY total_count DESC;

-- ══════════════════════════════════════════════════
-- Q2: Which year saw the highest content additions?
-- Business Value: Identify Netflix's growth phases
-- ══════════════════════════════════════════════════

SELECT 
    year_added,
    COUNT(*) AS titles_added,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) 
          FROM netflix_titles 
          WHERE year_added IS NOT NULL), 2) AS percentage
FROM netflix_titles
WHERE year_added IS NOT NULL
GROUP BY year_added
ORDER BY titles_added DESC
LIMIT 10;

-- ══════════════════════════════════════════════════
-- Q3: Which countries produce the most Netflix content?
-- Business Value: Guide international investment strategy
-- ══════════════════════════════════════════════════

SELECT 
    primary_country,
    COUNT(*) AS total_titles,
    SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS movies,
    SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS tv_shows
FROM netflix_titles
WHERE primary_country != 'Unknown'
GROUP BY primary_country
ORDER BY total_titles DESC
LIMIT 10;

-- ══════════════════════════════════════════════════
-- Q4: What are the top 10 genres on Netflix?
-- Business Value: Identify dominant content categories
-- ══════════════════════════════════════════════════

-- Note: listed_in has multiple genres like "Dramas, International Movies"
-- We count the full genre string as-is for simplicity in SQL
-- (We will do deeper genre splitting in Python Phase 6)

SELECT 
    listed_in,
    COUNT(*) AS title_count
FROM netflix_titles
GROUP BY listed_in
ORDER BY title_count DESC
LIMIT 10;


-- ══════════════════════════════════════════════════
-- Q5: What is the content rating distribution?
-- Business Value: Understand target audience profile
-- ══════════════════════════════════════════════════

SELECT 
    rating,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) 
          FROM netflix_titles 
          WHERE rating != 'Unknown'), 2) AS percentage,
    -- Classify audience type
    CASE 
        WHEN rating IN ('TV-MA', 'R', 'NC-17') 
            THEN 'Adult'
        WHEN rating IN ('TV-14', 'PG-13') 
            THEN 'Teen'
        WHEN rating IN ('TV-PG', 'PG', 'TV-G', 'G') 
            THEN 'Family'
        ELSE 'Other'
    END AS audience_type
FROM netflix_titles
WHERE rating != 'Unknown'
GROUP BY rating
ORDER BY total DESC;


-- ══════════════════════════════════════════════════
-- Q6: Average movie duration trend over years?
-- Business Value: Content length strategy insight
-- ══════════════════════════════════════════════════

SELECT 
    release_year,
    ROUND(AVG(duration_value), 2) AS avg_duration_minutes,
    COUNT(*) AS movie_count
FROM netflix_titles
WHERE type = 'Movie'
    AND duration_unit = 'min'
    AND release_year >= 2000
    AND duration_value IS NOT NULL
GROUP BY release_year
ORDER BY release_year DESC
LIMIT 15;

-- ══════════════════════════════════════════════════
-- Q7: Which month does Netflix add the most content?
-- Business Value: Identify content release seasonality
-- ══════════════════════════════════════════════════

SELECT 
    month_name_added,
    month_added,
    COUNT(*) AS titles_added
FROM netflix_titles
WHERE month_added IS NOT NULL
GROUP BY month_name_added, month_added
ORDER BY month_added ASC;

-- ══════════════════════════════════════════════════
-- Q8: What is the ratio of Fresh vs Library content?
-- Business Value: Original vs catalogue strategy
-- ══════════════════════════════════════════════════

SELECT 
    content_freshness,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) 
          FROM netflix_titles 
          WHERE content_freshness != 'Unknown'), 2) AS percentage
FROM netflix_titles
WHERE content_freshness != 'Unknown'
GROUP BY content_freshness
ORDER BY total DESC;

-- ══════════════════════════════════════════════════
-- Q9: Which directors have the most titles?
-- Business Value: Identify key content partnerships
-- ══════════════════════════════════════════════════

SELECT 
    director,
    COUNT(*) AS total_titles,
    SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS movies,
    SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS tv_shows
FROM netflix_titles
WHERE director != 'Unknown'
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

-- ══════════════════════════════════════════════════
-- Q10: What is the TV Show season distribution?
-- Business Value: Preferred series length for viewers
-- ══════════════════════════════════════════════════

SELECT 
    duration_value AS number_of_seasons,
    COUNT(*) AS show_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) 
          FROM netflix_titles 
          WHERE type = 'TV Show'), 2) AS percentage
FROM netflix_titles
WHERE type = 'TV Show'
    AND duration_value IS NOT NULL
GROUP BY duration_value
ORDER BY show_count DESC;

-- ══════════════════════════════════════════════════
-- EXECUTIVE KPI SUMMARY
-- Business Value: One-glance platform overview
-- ══════════════════════════════════════════════════

SELECT
    COUNT(*)                                    AS total_titles,
    SUM(CASE WHEN type='Movie' THEN 1 ELSE 0 END)    AS total_movies,
    SUM(CASE WHEN type='TV Show' THEN 1 ELSE 0 END)  AS total_tv_shows,
    COUNT(DISTINCT primary_country)             AS countries_represented,
    COUNT(DISTINCT listed_in)                   AS unique_genres,
    MIN(release_year)                           AS oldest_content_year,
    MAX(release_year)                           AS newest_content_year,
    ROUND(AVG(CASE WHEN type='Movie' 
              THEN duration_value END), 0)      AS avg_movie_duration_mins
FROM netflix_titles
WHERE primary_country != 'Unknown';
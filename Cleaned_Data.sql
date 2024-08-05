------------ *The tables Used are the rating table for building a recommendation system (a prediction model), and the book table for detailed recommendation
------------ *The tables have already been imported into Big query (GC).

-------- Data Preprocessing --------
-- Step1: Remove Duplicates
CREATE TABLE final.cleaned_rating AS
SELECT DISTINCT *
FROM final.rating 
WHERE 
  TRUE;

CREATE TABLE final.cleaned_book AS
SELECT DISTINCT *
FROM final.book 
WHERE 
  TRUE;

-- Check the change
SELECT *
FROM final.cleaned_rating 
LIMIT 5;

SELECT *
FROM final.cleaned_book
LIMIT 5;

-- Step2: Handle Missing Values
SELECT * 
FROM final.cleaned_rating 
WHERE book_id IS NULL OR user_id IS NULL OR rating IS NULL;
-- Clean

SELECT 
  book_id, 
  title, 
  authors, 
  -- COALESCE(average_rating, (SELECT AVG(average_rating) FROM final.book WHERE avarage_rating IS NOT NULL)) AS average_rating,
  isbn,
  isbn13,
  language_code,
  ratings_count,
  work_ratings_count,
  work_text_reviews_count,
  ratings_count,
  small_image_url
FROM
  final.cleaned_book
WHERE
  average_rating IS NULL;




-- Challenge 3
SELECT 
    authors.au_id AS 'Authors_ID',
    authors.au_lname AS 'Last_Name',
    authors.au_fname AS 'First Name',
    SUM(sales.qty) AS 'Total'
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Total DESC
LIMIT 3


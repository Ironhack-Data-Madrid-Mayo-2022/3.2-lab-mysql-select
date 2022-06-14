SELECT 
    authors.au_id AS Authors_ID,
    authors.au_lname AS Authors_LastName,
    authors.au_fname AS Authors_Firstame,
    SUM(sales.qty) AS Total_ventas
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Total_ventas DESC
LIMIT 3
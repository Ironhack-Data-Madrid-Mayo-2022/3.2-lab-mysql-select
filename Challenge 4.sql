SELECT 
    authors.au_id AS Authors_ID,
    authors.au_lname AS Authors_LastName,
    authors.au_fname AS Authors_Firstame,
    COALESCE(SUM(sales.qty), 0) AS Total_ventas
FROM
    authors
        LEFT JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        LEFT JOIN
    titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Total_ventas DESC
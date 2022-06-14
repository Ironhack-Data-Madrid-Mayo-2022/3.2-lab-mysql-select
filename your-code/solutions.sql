/* CHALLENGE 1 */

SELECT 
    a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM
    authors a
        INNER JOIN
    titleauthor ta ON a.au_id = ta.au_id
        INNER JOIN
    titles t ON ta.title_id = t.title_id
        INNER JOIN
    publishers p ON t.pub_id = p.pub_id;
    
/* Si quisiéramos sacar todos los autores aunque no tengan libros publicados, sustituiríamos todos los inner join por left join */

/* CHALLENGE 2 */

SELECT 
    a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name,
    COUNT(t.title) AS title_count
FROM
    authors a
        INNER JOIN
    titleauthor ta ON a.au_id = ta.au_id
        INNER JOIN
    titles t ON ta.title_id = t.title_id
        INNER JOIN
    publishers p ON t.pub_id = p.pub_id
GROUP BY p.pub_id , a.au_id;

/* CHALLENGE 3 */

SELECT 
    salesPerAuthor.au_id,
    a.au_lname,
    a.au_fname,
    salesPerAuthor.salesAuthor
FROM
    (SELECT 
        ta.au_id, SUM(salesTitle.qtys) AS salesAuthor
    FROM
        (SELECT 
        SUM(qty) AS qtys, title_id
    FROM
        sales
    GROUP BY title_id) salesTitle
    INNER JOIN titleauthor ta ON salesTitle.title_id = ta.title_id
    GROUP BY ta.au_id
    ORDER BY salesAuthor DESC
    LIMIT 3) salesPerAuthor
        INNER JOIN
    authors a ON salesPerAuthor.au_id = a.au_id;
    
/* CHALLENGE 4 */    

SELECT 
    a.au_id,
    a.au_lname,
    a.au_fname,
    COALESCE(SUM(s.qty), 0) AS TOTAL
FROM
    authors a
        LEFT JOIN
    titleauthor ta ON ta.au_id = a.au_id
        LEFT JOIN
    titles t ON t.title_id = ta.title_id
        LEFT JOIN
    sales s ON s.title_id = t.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;
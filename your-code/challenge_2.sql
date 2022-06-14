-- Challenge 2
SELECT 
    authors.au_id AS 'Authors_ID',
    authors.au_lname AS 'Last_Name',
    authors.au_fname AS 'First Name',
    titles.title AS 'Title',
    publishers.pub_name AS 'Publisher',
    COUNT(titles.title) AS 'Title Count'
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY titles.title
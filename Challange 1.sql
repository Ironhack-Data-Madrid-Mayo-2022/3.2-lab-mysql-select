SELECT 
    authors.au_id AS 'Authors_ID',
    authors.au_lname AS 'Authors_Last_Name',
    authors.au_fname AS 'Authors_First_Name',
    titles.title AS 'Title',
    publishers.pub_name AS 'Publisher Name'
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id








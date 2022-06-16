SELECT a.au_id, au_lname, au_fname, title, pub_name
FROM ((Authors AS A INNER JOIN titleauthor AS t ON(a.au_id=t.au_id))
     INNER JOIN titles ON (titles.title_id=t.title_id))
     INNER JOIN Publishers ON (Publishers.pub_id=titles.pub_id);
     

SELECT au_lname, au_fname, pub_name, COUNT(*) 
FROM ((Authors AS A INNER JOIN titleauthor AS t ON(a.au_id=t.au_id))
     INNER JOIN titles ON (titles.title_id=t.title_id))
     INNER JOIN Publishers ON (Publishers.pub_id=titles.pub_id)
GROUP BY au_lname, au_fname, pub_name
;


SELECT au_lname, au_fname,SUM(qty) as suma
FROM ((Authors AS A INNER JOIN titleauthor AS t ON(a.au_id=t.au_id))
     INNER JOIN titles ON (titles.title_id=t.title_id))
     INNER JOIN Sales ON (sales.title_id=titles.title_id)
GROUP BY au_lname, au_fname
ORDER BY suma desc 
LIMIT 3;
     

SELECT au_lname, au_fname,SUM(qty) as suma
FROM ((Authors AS A INNER JOIN titleauthor AS t ON(a.au_id=t.au_id))
     INNER JOIN titles ON (titles.title_id=t.title_id))
     INNER JOIN Sales ON (sales.title_id=titles.title_id)
GROUP BY au_lname, au_fname
ORDER BY suma desc 
LIMIT 23;


/* 
select 
		a.au_id as 'AUTHOR ID', 
		a.au_lname as 'LAST NAME', 
        a.au_fname as 'FIRST NAME',
        t.title as 'TITLE'
        p.pub_name as 'PUBLISHER'
from 
	authors a,
	titles t,
    titleauthor ta,
    publishers p
where
	a.au_id = ta.au_id
    and
    t.title_id = ta.title_id
    and
    p.publ_id = t.pub_id
	;


	left join titles t on au_id 
    left join publisher p on au_id;
    
*/
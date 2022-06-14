#CHALLENGE1
SELECT 
		ta.au_id as AUTHOR_ID,
        title as TITLE, 
		au_fname as FIRST_NAME,
		au_lname as LAST_NAME,
        pub.pub_name as PUBLISHER_NAME
	FROM titles as t LEFT join titleauthor as ta
	on t.title_id = ta.title_id
	LEFT JOIN authors as a
	ON ta.au_id=a.au_id
	JOIN publishers as pub on t.pub_id=pub.pub_id;


#CHALLENGE2
SELECT 
		ta.au_id as AUTHOR_ID,
        count(title) as TITLE_COUNT, 
		au_fname as FIRST_NAME,
		au_lname as LAST_NAME,
        pub.pub_name as PUBLISHER_NAME
	FROM titles as t LEFT join titleauthor as ta
	on t.title_id = ta.title_id
	LEFT JOIN authors as a
	ON ta.au_id=a.au_id
	JOIN publishers as pub on t.pub_id=pub.pub_id
    GROUP BY AUTHOR_ID, FIRST_NAME, LAST_NAME, PUBLISHER_NAME
    ORDER BY TITLE_COUNT DESC;



#CHALLENGE3
SELECT 
		ta.au_id as AUTHOR_ID,
        count(title) as TITLE_COUNT, 
		au_fname as FIRST_NAME,
		au_lname as LAST_NAME
	FROM titles as t LEFT join titleauthor as ta
	on t.title_id = ta.title_id
	LEFT JOIN authors as a
	ON ta.au_id=a.au_id
	JOIN sales on ta.title_id=sales.title_id
    GROUP BY AUTHOR_ID, FIRST_NAME, LAST_NAME
    ORDER BY TITLE_COUNT DESC
	LIMIT 3;
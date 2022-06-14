'''Challenge 1 - Who Have Published What At Where?
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published'''
select pub_name, title, a.au_id, au_lname, au_fname from publishers as p
join titles as t
on t.pub_id = p.pub_id
join titleauthor as ta
on ta.title_id = t.title_id
join authors as a
on a.au_id = ta.au_id

'''Challenge 2 - Who Have Published How Many At Where?
To check if your output is correct, sum up the TITLE COUNT column. The sum number should be the same as the total number of records in Table titleauthor'''

select pub_name, title, a.au_id, au_lname, au_fname, count(title) as 'Title Count' from publishers as p
join titles as t
on t.pub_id = p.pub_id
join titleauthor as ta
on ta.title_id = t.title_id
join authors as a
on a.au_id = ta.au_id
group by title

'''Challenge 3 - Best Selling Authors
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.'''
select a.au_id, au_lname, au_fname, sum(qty) as 'TOTAL' from sales as s
inner join titles as t
on t.title_id = s.title_id
inner join titleauthor as ta
on ta.title_id = t.title_id
inner join authors as a
on a.au_id = ta.au_id
group by au_id order by TOTAL desc limit 3

'''Challenge 4 - Best Selling Authors Ranking'''
select a.au_id, au_lname, au_fname, coalesce(sum(qty), 0) as 'TOTAL' from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join sales as s
on s.title_id = ta.title_id
group by au_id order by TOTAL desc limit 23



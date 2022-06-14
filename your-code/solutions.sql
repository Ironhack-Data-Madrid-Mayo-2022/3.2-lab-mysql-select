                                            #Challenge 1 - Who Have Published What At Where?
select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name 
from authors as a
inner join titleauthor 
	on a.au_id = titleauthor.au_id
inner join titles as t
	on titleauthor.title_id = t.title_id
inner join publishers as p
	on t.pub_id = p.pub_id;
    
								          #Challenge 2 - Who Have Published How Many At Where?
select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name, count(t.title) as TITLE_COUNT
from authors as a
inner join titleauthor 
	on a.au_id = titleauthor.au_id
inner join titles as t
	on titleauthor.title_id = t.title_id
inner join publishers as p
	on t.pub_id = p.pub_id
group by a.au_id, a.au_lname, a.au_fname, p.pub_name
order by TITLE_COUNT desc;       

                                     #Challenge 3 - Best Selling Authors         
select a.au_id, a.au_lname, a.au_fname, sum(s.qty) as TOTAL 
from authors as a
inner join titleauthor 
	on a.au_id = titleauthor.au_id
inner join titles as t
	on titleauthor.title_id = t.title_id
inner join sales as s
	on t.title_id = s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by TOTAL desc
limit 3;

                               #Challenge 4 - Best Selling Authors Ranking
select a.au_id, a.au_lname, a.au_fname, coalesce(sum(s.qty), 0) as TOTAL 
from authors as a
left join titleauthor 
	on a.au_id = titleauthor.au_id
left join titles as t
	on titleauthor.title_id = t.title_id
left join sales as s
	on t.title_id = s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by TOTAL desc;
                            
-- Challenge 1 - Who Have Published What At Where?

create temporary table publications.author_title_summary2
select author_id, last_name, first_name, title, pub_name
from (select author_id, last_name, first_name, title, pub_id
	  from (select a.au_id as author_id, au_lname as last_name, au_fname as first_name, ta.title_id
			from authors as a
				left join titleauthor as ta
				on a.au_id=ta.au_id) as ata
       left join titles as t
	   on ata.title_id=t.title_id) as atat
left join publishers as p
on atat.pub_id=p.pub_id
where title is not null
;



-- Challenge 2 - Who Have Published How Many At Where?

select author_id, last_name, first_name, pub_name, count(title) as title_count
from publications.author_title_summary2
group by author_id, last_name, first_name, pub_name;



-- Challenge 3 - Best Selling Authors

select author_id, last_name, first_name, sum(qty) as sum_qty
from (select author_id, last_name, first_name, title, ata.title_id
	  from (select a.au_id as author_id, au_lname as last_name, au_fname as first_name, ta.title_id
			from authors as a
				left join titleauthor as ta
				on a.au_id=ta.au_id) as ata
       left join titles as t
	   on ata.title_id=t.title_id) as atat
left join sales as s
on atat.title_id=s.title_id
where qty is not null
group by author_id, last_name, first_name
order by sum_qty desc
limit 3;



-- Challenge 4 - Best Selling Authors Ranking

select author_id, last_name, first_name, coalesce (sum(qty) ,0) as coalesce_sum
from (select author_id, last_name, first_name, title, ata.title_id
	  from (select a.au_id as author_id, au_lname as last_name, au_fname as first_name, ta.title_id
			from authors as a
				left join titleauthor as ta
				on a.au_id=ta.au_id) as ata
       left join titles as t
	   on ata.title_id=t.title_id) as atat
left join sales as s
on atat.title_id=s.title_id
group by author_id, last_name, first_name
order by coalesce_sum desc;

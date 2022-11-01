
USE publications;

SHOW TABLES;

SELECT * FROM titleauthor;

SELECT titleauthor.au_id AS ID, authors.au_lname AS 'last name', authors.au_fname AS 'first name', titles.title AS 'title', publishers.pub_name AS 'publisher'
FROM authors AS authors
INNER JOIN titleauthor AS titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles AS titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers AS publishers ON publishers.pub_id = titles.pub_id;

SELECT titleauthor.au_id AS ID, authors.au_lname AS 'last name', authors.au_fname AS 'first name', publishers.pub_name AS 'publisher', COUNT(titleauthor.title_id) AS TitleCount
FROM authors AS authors
INNER JOIN titleauthor AS titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles AS titles ON titles.title_id = titleauthor.title_id
INNER JOIN publishers AS publishers ON publishers.pub_id = titles.pub_id
GROUP BY ID, pub_name
#order by TitleCount desc
;

SELECT authors.au_id AS ID, authors.au_lname AS 'last name', authors.au_fname AS 'first name', SUM(qty) AS Total
FROM authors AS authors
LEFT JOIN titleauthor AS titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales AS sales ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY Total DESC
LIMIT 3
;




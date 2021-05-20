SELECT
	p.name AS pName,
	c.name AS cName
	
FROM products p
LEFT JOIN products_categories pc
	ON pc.productId = p.id
LEFT JOIN categories c
	ON pc.categoryId = c.id
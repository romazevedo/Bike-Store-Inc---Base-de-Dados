--Listar todos Clientes que não tenham realizado uma compra;
SELECT ct.customer_id, ct.first_name, ct.last_name
FROM customers ct
LEFT JOIN orders od ON ct.customer_id = od.customer_id
WHERE od.order_id IS NULL;

--Listar os Produtos que não tenham sido comprados
SELECT pr.product_id, pr.product_name, pr.brand_id
FROM products pr
LEFT JOIN order_items ot ON ot.product_id = pr.product_id
WHERE ot.order_id IS NULL;


--Listar os Produtos sem Estoque;
SELECT pr.product_id, pr.product_name, pr.brand_id
FROM products pr
LEFT JOIN stocks st ON st.product_id = pr.product_id
WHERE st.quantity = 0 OR st.quantity IS NULL;


--Agrupar a quantidade de vendas que uma determinada Marca por Loja.
SELECT br.brand_name AS Marca, 
       st.store_name AS Loja, 
       SUM(ot.quantity) AS quantidade
FROM orders od
INNER JOIN stores st ON od.store_id = st.store_id
INNER JOIN order_items ot ON od.order_id = ot.order_id
INNER JOIN products pr ON ot.product_id = pr.product_id
INNER JOIN brands br ON br.brand_id = pr.brand_id
WHERE br.brand_name = 'Marca Exemplo'  -- Filtro pela marca
GROUP BY br.brand_name, st.store_name;


--Listar os Funcionarios que não estejam relacionados a um Pedido.
SELECT st.staff_id, st.first_name, st.last_name
FROM staffs st
LEFT JOIN orders od ON st.staff_id = od.staff_id
WHERE od.order_id IS NULL;

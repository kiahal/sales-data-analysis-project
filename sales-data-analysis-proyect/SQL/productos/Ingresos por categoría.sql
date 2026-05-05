SELECT 
    c.Nombre_Categoria,
    FORMAT(SUM(dv.Cantidad * dv.Precio_Unidad), 'C0', 'es-AR') AS ingresos
FROM Detalle_Venta dv
JOIN Productos p ON dv.Id_Prod = p.Id_Prod
JOIN Categoria c ON p.Id_Categoria = c.Id_Categoria
GROUP BY c.Nombre_Categoria
ORDER BY SUM(dv.Cantidad * dv.Precio_Unidad) DESC;
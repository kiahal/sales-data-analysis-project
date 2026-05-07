SELECT 
    p.Nombre_Prod,
    FORMAT(SUM(dv.Cantidad), 'N0', 'es-AR') AS cantidad_vendida
FROM Detalle_Venta dv
JOIN Productos p ON dv.Id_Prod = p.Id_Prod
GROUP BY p.Nombre_Prod
ORDER BY SUM(dv.Cantidad) DESC;
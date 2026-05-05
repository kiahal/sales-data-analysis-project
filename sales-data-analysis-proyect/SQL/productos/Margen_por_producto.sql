SELECT 
    p.Nombre_Prod,
    FORMAT(SUM(dv.Cantidad * (dv.Precio_Unidad - dv.Costo_Fab)), 'C0', 'es-AR') AS margen
FROM Detalle_Venta dv
JOIN Productos p ON dv.Id_Prod = p.Id_Prod
GROUP BY p.Nombre_Prod
ORDER BY SUM(dv.Cantidad * (dv.Precio_Unidad - dv.Costo_Fab)) DESC;
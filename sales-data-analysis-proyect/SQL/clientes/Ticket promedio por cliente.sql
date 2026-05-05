SELECT 
    cl.Nombre_Cl,
    FORMAT(AVG(dv.Cantidad * dv.Precio_Unidad), 'C0', 'es-AR') AS ticket_promedio
FROM Venta v
JOIN Cliente cl ON v.Id_Cl = cl.Id_Cl
JOIN Detalle_Venta dv ON v.Id_Venta = dv.Id_Venta
GROUP BY cl.Nombre_Cl
ORDER BY AVG(dv.Cantidad * dv.Precio_Unidad) DESC;
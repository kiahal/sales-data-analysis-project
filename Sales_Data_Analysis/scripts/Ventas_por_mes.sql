SELECT 
    CASE df.Mes
        WHEN 1 THEN 'Enero'
        WHEN 2 THEN 'Febrero'
        WHEN 3 THEN 'Marzo'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Mayo'
        WHEN 6 THEN 'Junio'
        WHEN 7 THEN 'Julio'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Septiembre'
        WHEN 10 THEN 'Octubre'
        WHEN 11 THEN 'Noviembre'
        WHEN 12 THEN 'Diciembre'
    END AS Mes,
    FORMAT(SUM(dv.Cantidad * dv.Precio_Unidad), 'C0', 'es-AR') AS ingresos
FROM Venta v
JOIN Dim_Fecha df ON v.Id_Fecha = df.Id_Fecha
JOIN Detalle_Venta dv ON v.Id_Venta = dv.Id_Venta
GROUP BY df.Mes
ORDER BY df.Mes;
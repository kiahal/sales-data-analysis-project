WITH ventas_mensuales AS (
    SELECT 
        df.Año,
        df.Mes,
        SUM(dv.Cantidad * dv.Precio_Unidad) AS ingresos
    FROM Venta v
    JOIN Dim_Fecha df ON v.Id_Fecha = df.Id_Fecha
    JOIN Detalle_Venta dv ON v.Id_Venta = dv.Id_Venta
    GROUP BY df.Año, df.Mes
)

SELECT 
    Año,

    CASE Mes
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

    FORMAT(ingresos, 'C0', 'es-AR') AS ingresos,

    FORMAT(
        LAG(ingresos) OVER (ORDER BY Año, Mes), 
        'C0', 
        'es-AR'
    ) AS mes_anterior,

    CASE 
        WHEN LAG(ingresos) OVER (ORDER BY Año, Mes) IS NULL THEN NULL
        ELSE CONCAT(
            FORMAT(
                (ingresos - LAG(ingresos) OVER (ORDER BY Año, Mes)) * 100.0 /
                NULLIF(LAG(ingresos) OVER (ORDER BY Año, Mes), 0),
            'N1'),
            '%'
        )
    END AS crecimiento_pct

FROM ventas_mensuales
ORDER BY Año, Mes;
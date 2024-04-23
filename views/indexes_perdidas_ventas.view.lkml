view: indexes_perdidas_ventas {
    derived_table: {
      sql:WITH Inventario AS (
    SELECT
        material,
        centro,
        DATE(fecha) AS Fecha,
        SUM(Cantidad) AS Plan_de_ventas
    FROM
        eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Inventario_LU_1
    GROUP BY
        material, centro, DATE(fecha)
),
Cobertura AS (
    SELECT
        material,
        centro_suministrador AS centro,
        DATE(fecha) AS fecha,
        MIN(fill_rate) AS Fill_rate_minimo
    FROM
        eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Cobertura_de_la_Demanda
    GROUP BY
        material, centro, DATE(fecha)
),
Calculo_Margen AS (
    SELECT
        Inventario.material,
        Inventario.centro,
        Inventario.fecha,
        Inventario.Plan_de_ventas,
        Cobertura.Fill_rate_minimo,
        Cobertura.Fill_rate_minimo - 100 AS Porcentaje_no_cubierto,
        a.margen AS Margen
    FROM
        Inventario
    JOIN
        Cobertura ON Inventario.material = Cobertura.material AND Inventario.centro = Cobertura.centro AND Inventario.fecha = Cobertura.fecha

    JOIN
        eon-bus-proj-cadena-demo.modelo_de_calculo.cv_margen_material a ON Inventario.material = a.material
),
Final AS (SELECT
    material,
    centro,
    fecha,
    Plan_de_ventas,
    Fill_rate_minimo AS Porcentaje_cubierto,
    Porcentaje_no_cubierto,
    Margen,
    Plan_de_ventas * (Fill_rate_minimo/100) * Margen AS Ganancia,
    Plan_de_ventas * (Porcentaje_no_cubierto/100) * Margen AS Perdida
FROM
    Calculo_Margen),

SKUs_con_perdidas AS (
    SELECT
        material,
        SUM(Perdida) as Suma_Perdidas
    FROM Final
    WHERE Perdida <> 0
    GROUP BY material
    HAVING SUM(Perdida) < 0
),
Centros_con_perdidas AS (
    SELECT
        centro,
        SUM(Perdida) as Suma_Perdidas
    FROM Final
    WHERE Perdida <> 0
    GROUP BY centro
    HAVING SUM(Perdida) < 0
),
Total_Material AS (
    SELECT DISTINCT material FROM Final
),
Total_Centros AS (
    SELECT DISTINCT centro FROM Final
),
Material_Sin_Perdidas AS (
    SELECT material FROM Total_Material
    WHERE material NOT IN (SELECT material FROM SKUs_con_perdidas)
),
Centro_Sin_Perdidas AS (
    SELECT centro FROM Total_Centros
    WHERE centro NOT IN (SELECT centro FROM Centros_con_perdidas)
)

SELECT count(distinct(material)) as total, 'Productos Sin Perdidas' AS concepto FROM Material_Sin_Perdidas
UNION ALL
SELECT count(distinct(centro)) as total, 'Centros Sin Perdidas' AS concepto FROM Centro_Sin_Perdidas
UNION ALL
SELECT count(distinct(material)) as total, 'Productos Con Perdidas' AS concepto FROM SKUs_con_perdidas
UNION ALL
SELECT count(distinct(material)) as total, 'Total Productos' AS concepto FROM Total_Material
UNION ALL
SELECT count(distinct(centro)) as total, 'Centros Con Perdidas' AS concepto FROM Centros_con_perdidas
UNION ALL
SELECT count(distinct(centro)) as total, 'Total Centros' AS concepto FROM Total_Centros
        ;;
    }

    dimension: concepto {
      type: string
      sql: ${TABLE}.concepto ;;
    }



    measure: total{
      type: sum
      sql: ${TABLE}.total ;;
    }
  }

view: indexes_perdidas_ventas_simulado {
    derived_table: {
      sql:WITH Productos_con_perdidas AS (
    SELECT
        Producto,
        SUM(Perdida) as Suma_Perdidas
    FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`
    WHERE Perdida <> 0
    GROUP BY Producto
    HAVING SUM(Perdida) < 0
),
Centros_con_perdidas AS (
    SELECT
        centro,
        SUM(Perdida) as Suma_Perdidas
    FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`
    WHERE Perdida <> 0
    GROUP BY centro
    HAVING SUM(Perdida) < 0
),
Total_Centros AS (
    SELECT
        centro
    FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`
    GROUP BY centro
),
Total_Productos AS (
    SELECT
        Producto
    FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`
    GROUP BY Producto
)
SELECT
    COUNT(*) as total,
    'Productos sin Perdidas' AS concepto
FROM Total_Productos
WHERE Producto NOT IN (SELECT Producto FROM Productos_con_perdidas)

UNION ALL
SELECT
    COUNT(*) as total,
    'Centros sin Perdidas' AS concepto
FROM Total_Centros
WHERE centro NOT IN (SELECT centro FROM Centros_con_perdidas)

UNION ALL

SELECT
    count(distinct(centro)) as total,
    'Total Centros' AS concepto
FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad` as t

UNION ALL

SELECT
    count(distinct(t.Producto)) as total,
    'Total Productos' AS concepto
FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad` as t

UNION ALL

SELECT count(distinct(centro)) as centro,
'Centro Con Perdidas' AS concepto FROM Centros_con_perdidas

UNION ALL

SELECT count(distinct(Producto)) as total,
'Producto Con Perdidas' AS concepto FROM Productos_con_perdidas

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

view: indexes_perdidas_ventas_simulado {
    derived_table: {
      sql:WITH SKUs_con_perdidas AS (
    SELECT
        material,
        SUM(Perdida) as Suma_Perdidas
    FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`
    WHERE Perdida <> 0
    GROUP BY material
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
Total_SKUs AS (
    SELECT
        material
    FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`
    GROUP BY material
)
SELECT
    COUNT(*) as total,
    'Productos sin Perdidas' AS concepto
FROM Total_SKUs
WHERE material NOT IN (SELECT material FROM SKUs_con_perdidas)

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
    count(distinct(t.material)) as total,
    'Total Productos' AS concepto
FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad` as t

UNION ALL

SELECT count(distinct(centro)) as centro,
'Centro con Perdidas' AS concepto FROM Centros_con_perdidas

UNION ALL

SELECT count(distinct(material)) as total,
'Producto con Perdidas' AS concepto FROM SKUs_con_perdidas

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

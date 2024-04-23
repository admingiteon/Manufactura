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
)

SELECT
    count(distinct(centro)) as total,
    'Total Centros' AS concepto
FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`
UNION ALL
SELECT
    count(distinct(material)) as total,
    'Total Productos' AS concepto
FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`

UNION ALL

SELECT count(distinct(centro)) as centro,

'Centro Con Perdidas' AS concepto FROM Centros_con_perdidas

UNION ALL
SELECT count(distinct(material)) as total,
'Producto Con Perdidas' AS concepto FROM SKUs_con_perdidas
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

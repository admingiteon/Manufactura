view: indexes_perdidas_ventas_simulado {
    derived_table: {
      sql:WITH SKUsConPerdidas AS (
    SELECT material
    FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`
    WHERE perdida <> 0
    GROUP BY material
)

SELECT
    count(distinct(material)) as total,
    'Total SKUs' AS concepto

FROM `eon-bus-proj-cadena-demo.modelo_de_calculo_sm.cv_margen_utilidad`

UNION ALL

SELECT
    count(distinct(material)) AS total,
    'Producto Con Perdidas' AS concepto
FROM SKUsConPerdidas
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

view: indexes_pie_ordenes_vs_inventario {
    derived_table: {
      sql:SELECT 'Ganancias' AS concepto, sum(ganancias) as total ,SUBSTR(material,12,50) AS material
          from
            eon-bus-proj-cadena-demo.reporting_manufactura.vw_margen_utilidad_cortex group by material
          UNION ALL
          SELECT
            'Pérdidas' AS concepto, sum(perdida) as total ,SUBSTR(material,12,50) as material
          from
            eon-bus-proj-cadena-demo.reporting_manufactura.vw_margen_utilidad_cortex group by material
        ;;
    }

    dimension: concepto {
      type: string
      sql: ${TABLE}.concepto ;;
    }


  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }


    measure: total{
      type: sum
      value_format: "$#,##0.00"
      sql: ${TABLE}.total ;;
    }
  }

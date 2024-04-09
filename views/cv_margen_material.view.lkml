view: cv_margen_material {
  derived_table: {
    sql: SELECT *
        FROM
            `eon-bus-proj-cadena-demo.modelo_de_calculo.cv_margen_material`

      ;;
  }

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: material {
    type: string
    sql: SUBSTR(${TABLE}.material,12,50) ;;
  }



  measure: precio_venta {
    type: max
    value_format: "$#,##0.00"
    sql: ${TABLE}.precio_venta ;;
  }

  measure: unidades {
    type: sum
    sql: ${TABLE}.unidades ;;
  }

  measure: costo_produccion {
    type: max
    sql: ${TABLE}.costo_produccion ;;
  }

  measure: margen {
    type: sum
    sql: ${TABLE}.margen ;;
  }

  measure: count {
    type: count
  }

 }

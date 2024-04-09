view: lote_fabricacion_producto_terminado {

  sql_table_name: `eon-bus-proj-cadena-demo.entradas_y_salidas.lote_fabricacion_producto_terminado` ;;

  dimension: centro {
    type: string
    sql: ${TABLE}.centro ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  measure: total_material {
    type: sum
    sql: ${material} ;;  }
  measure: average_material {
    type: average
    sql: ${material} ;;  }

  measure: tamano_lote_fabricacion {
    type: sum
    value_format: "#,##0"
    sql: ${TABLE}.tamano_lote_fabricacion ;;
    html: {{ rendered_value }} Unidades
   ;;
  }
  measure: count {
    type: count
  }
}

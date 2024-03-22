view: fabricacion_no_cubierta {
  derived_table: {
    sql:
SELECT * FROM `eon-bus-proj-cadena-demo.data_foundation.reporting_manufactura_vw_cobertura_fabricacion`
;;
  }


  dimension: material {
    type: string
    sql: SUBSTR(${TABLE}.material,12,50) ;;
  }

  dimension: fecha {
    type: date
    sql:  ${TABLE}.fecha;;

  }

  measure: cantidad_requerida{
    type: sum
    sql: ${TABLE}.cantidad_requerida ;;
  }

  measure: cobertura_fab{
    label: "cantidad_producible/cobertura_fab"
    type: sum
    sql: ${TABLE}.cobertura_fab ;;
  }

}

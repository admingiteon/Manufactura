view: cobertura_fabricacion {
  derived_table: {
    sql: select * from eon-bus-proj-cadena-demo.data_foundation.reporting_manufactura_vw_cobertura_fabricacion ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.fecha ;;
  }

  measure: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  measure: cobertura_fab{
    type: number
    sql: ${TABLE}.cobertura_fab ;;
  }
}

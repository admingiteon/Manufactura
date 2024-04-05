view: locations_sanimex_map {

  sql_table_name: `eon-bus-proj-cadena-demo.eon_training.locations_sanimex_map` ;;


  dimension: state_code {
    type: number
    sql: ${TABLE}.state_code ;;
  }


  measure: total_state_code {
    type: sum
    sql: ${state_code} ;;  }
  measure: average_state_code {
    type: average
    sql: ${state_code} ;;  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
    map_layer_name: mexico_cities
  }

  dimension: sucursal {
    type: string
    sql: ${TABLE}.sucursal ;;
  }

  dimension: zona {
    type: string
    sql: ${TABLE}.zona ;;
  }
  measure: count {
    type: count
    drill_fields: [state_name]
  }
}

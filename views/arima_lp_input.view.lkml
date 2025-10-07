view: arima_lp_input {
  sql_table_name: `eon-bus-proj-cadena-demo.demo_bigqueryml_arima_plus_2025.Arima_LP_Input` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }
  dimension_group: fecha {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.fecha ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}

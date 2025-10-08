view: forecast_completo_lp_mensual_2025 {
  sql_table_name: `eon-bus-proj-cadena-demo.demo_bigqueryml_arima_plus_2025.Forecast_Completo_LP_mensual` ;;
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
  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }
  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }
  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

# -- Measures for Forecast Visualization --

  measure: historical_quantity {
    label: "Historical Quantity"
    type: sum
    sql: ${TABLE}.Cantidad ;;
    value_format_name: decimal_0
    filters: [tipo: "Real"]
    description: "This measure only looks at rows where tipo is 'Real'"
  }

  measure: forecast_quantity {
    label: "Forecast Quantity"
    type: average
    sql: (${TABLE}.prediction_interval_lower_bound + ${TABLE}.prediction_interval_upper_bound) / 2 ;;
    value_format_name: decimal_2
    filters: [tipo: "Forecast"]
    description: "This measure only looks at rows where tipo is 'Forecast'"
  }

  measure: prediction_lower_bound {
    label: "Prediction Lower Bound"
    type: average
    sql: ${TABLE}.prediction_interval_lower_bound ;;
    value_format_name: decimal_2
    filters: [tipo: "Forecast"]
    description: "This measure only looks at rows where tipo is 'Forecast'"
  }

  measure: prediction_upper_bound {
    label: "Prediction Upper Bound"
    type: average
    sql: ${TABLE}.prediction_interval_upper_bound ;;
    value_format_name: decimal_2
    filters: [tipo: "Forecast"]
    description: "This measure only looks at rows where tipo is 'Forecast'"
  }

}

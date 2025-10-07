view: forecast_completo_lp_2025 {
  sql_table_name: `eon-bus-proj-cadena-demo.demo_bigqueryml_arima_plus_2025.Forecast_Completo_LP` ;;
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
    description: "This logic ensures we only sum actual historical values"
  }

  measure: forecast_quantity {
    label: "Forecast Quantity"
    type: sum #average
    sql: (${TABLE}.prediction_interval_lower_bound + ${TABLE}.prediction_interval_upper_bound) / 2 ;;
    value_format_name: decimal_2
    description: "This creates the main forecast line by averaging the bounds"
  }

  measure: prediction_lower_bound {
    label: "Prediction Lower Bound"
    type: sum #average
    sql: ${TABLE}.prediction_interval_lower_bound ;;
    value_format_name: decimal_2
  }

  measure: prediction_upper_bound {
    label: "Prediction Upper Bound"
    type: sum #average
    sql: ${TABLE}.prediction_interval_upper_bound ;;
    value_format_name: decimal_2
  }

}

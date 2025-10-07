view: forecast_completo_lp_resp {
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
}

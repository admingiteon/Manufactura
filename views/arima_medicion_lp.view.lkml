
view: arima_medicion_lp {
  derived_table: {
    sql: select * from eon-bus-proj-cadena-demo.arima.Medicion_LP ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: mean_absolute_error {
    type: number
    sql: ${TABLE}.mean_absolute_error ;;
  }

  dimension: mean_squared_error {
    type: number
    sql: ${TABLE}.mean_squared_error ;;
  }

  dimension: root_mean_squared_error {
    type: number
    sql: ${TABLE}.root_mean_squared_error ;;
  }

  dimension: mean_absolute_percentage_error {
    type: number
    sql: ${TABLE}.mean_absolute_percentage_error ;;
  }

  dimension: symmetric_mean_absolute_percentage_error {
    type: number
    sql: ${TABLE}.symmetric_mean_absolute_percentage_error ;;
  }





  measure: Total_mean_absolute_error {
    type: sum
    sql: ${TABLE}.mean_absolute_error ;;
    value_format: "#,##0.00"
  }

  measure: Total_mean_squared_error {
    type: sum
    sql: ${TABLE}.mean_squared_error ;;
    value_format: "#,##0.00"
  }

  measure: Total_root_mean_squared_error {
    type: sum
    sql: ${TABLE}.root_mean_squared_error ;;
    value_format: "#,##0.00"
  }

  measure: Total_mean_absolute_percentage_error {
    type: sum
    sql: ${TABLE}.mean_absolute_percentage_error ;;
    value_format: "#,##0.00"
  }

  measure: Total_symmetric_mean_absolute_percentage_error {
    type: sum
    sql: ${TABLE}.symmetric_mean_absolute_percentage_error ;;
    value_format: "#,##0.00"
  }














  set: detail {
    fields: [
        id,
  mean_absolute_error,
  mean_squared_error,
  root_mean_squared_error,
  mean_absolute_percentage_error,
  symmetric_mean_absolute_percentage_error
    ]
  }
}

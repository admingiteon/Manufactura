
view: mediciones_forecast_cp {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.entradas_y_salidas.mediciones_forecast_cp`  ;;
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


  dimension: Rango_mean_absolute_percentage_error {
    type: string
    sql: case when ${TABLE}.mean_absolute_percentage_error > 0 and ${TABLE}.mean_absolute_percentage_error <= 10 then  'Rango 1-10'
              when ${TABLE}.mean_absolute_percentage_error > 10 and  ${TABLE}.mean_absolute_percentage_error <= 20 then  'Rango 10-20'
              when ${TABLE}.mean_absolute_percentage_error > 20 and  ${TABLE}.mean_absolute_percentage_error <= 30 then  'Rango 20-30'
              when ${TABLE}.mean_absolute_percentage_error > 30 and  ${TABLE}.mean_absolute_percentage_error <= 40 then  'Rango 30-40'
              when ${TABLE}.mean_absolute_percentage_error > 40 and  ${TABLE}.mean_absolute_percentage_error <= 50 then  'Rango 40-50'
              when ${TABLE}.mean_absolute_percentage_error > 50 and  ${TABLE}.mean_absolute_percentage_error <= 60 then  'Rango 50-60'
              when ${TABLE}.mean_absolute_percentage_error > 60 and  ${TABLE}.mean_absolute_percentage_error <= 70 then  'Rango 60-70'
              when ${TABLE}.mean_absolute_percentage_error > 70 and  ${TABLE}.mean_absolute_percentage_error <= 80 then  'Rango 70-80'
              when ${TABLE}.mean_absolute_percentage_error > 80 and  ${TABLE}.mean_absolute_percentage_error <= 90 then  'Rango 80-90'
              when ${TABLE}.mean_absolute_percentage_error > 90 then  'Rango >90'
    end  ;;
  }



  measure: Total_mean_absolute_error {
    type: sum
    sql: ${TABLE}.mean_absolute_error ;;
  }

  measure: Total_mean_squared_error {
    type: sum
    sql: ${TABLE}.mean_squared_error ;;
  }

  measure: Total_root_mean_squared_error {
    type: sum
    sql: ${TABLE}.root_mean_squared_error ;;
  }

  measure: Total_mean_absolute_percentage_error {
    type: sum
    sql: ${TABLE}.mean_absolute_percentage_error ;;
  }

  measure: Total_symmetric_mean_absolute_percentage_error {
    type: sum
    sql: ${TABLE}.symmetric_mean_absolute_percentage_error ;;
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

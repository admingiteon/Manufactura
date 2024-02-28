
view: prediccion_lp_v2 {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.entradas_y_salidas.prediccion_lp_V2` LIMIT 10 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: forecast_timestamp {
    type: time
    sql: ${TABLE}.forecast_timestamp ;;
  }

  dimension: forecast_value {
    type: number
    sql: ${TABLE}.forecast_value ;;
  }

  dimension: standard_error {
    type: number
    sql: ${TABLE}.standard_error ;;
  }

  dimension: confidence_level {
    type: number
    sql: ${TABLE}.confidence_level ;;
  }

  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  dimension: confidence_interval_lower_bound {
    type: number
    sql: ${TABLE}.confidence_interval_lower_bound ;;
  }

  dimension: confidence_interval_upper_bound {
    type: number
    sql: ${TABLE}.confidence_interval_upper_bound ;;
  }

  set: detail {
    fields: [
        id,
	forecast_timestamp_time,
	forecast_value,
	standard_error,
	confidence_level,
	prediction_interval_lower_bound,
	prediction_interval_upper_bound,
	confidence_interval_lower_bound,
	confidence_interval_upper_bound
    ]
  }
}

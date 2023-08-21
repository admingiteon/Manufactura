
view: sql_runner_query {
  derived_table: {
    sql: SELECT *  FROM psa-psa-cadena-qa.entradas_y_salidas.forecast_completo_v1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.fecha ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }

  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  set: detail {
    fields: [
        id,
	fecha,
	cantidad,
	tipo,
	prediction_interval_lower_bound,
	prediction_interval_upper_bound
    ]
  }
}


view: salida_lp_Forecast_Completo_LP {
  derived_table: {
    sql: SELECT *  FROM `psa-psa-cadena-qa.modelo_de_calculo.Forecast_Completo_LP` ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: Material {
    type: string
    sql: SUBSTR(${TABLE}.id,1,18) ;;
  }

  dimension: Centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,10) ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }


  measure: Total_cantidad {
    type: sum
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
  fecha_time,
  cantidad,
  tipo,
  prediction_interval_lower_bound,
  prediction_interval_upper_bound
    ]
  }
}

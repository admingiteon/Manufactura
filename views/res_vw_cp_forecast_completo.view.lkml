
view: res_vw_cp_forecast_completo {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.quality_data.vw_cp_forecast_completo`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension_group: Fecha_creacion {
    type: time

    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: cast(${TABLE}.fecha AS TIMESTAMP) ;;
    convert_tz: no
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

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  set: detail {
    fields: [
        id,
  fecha_time,
  cantidad,
  tipo,
  prediction_interval_lower_bound,
  prediction_interval_upper_bound,
  material
    ]
  }
}

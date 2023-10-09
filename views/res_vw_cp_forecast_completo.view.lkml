
view: res_vw_cp_forecast_completo {
  derived_table: {
    sql: SELECT *, ROW_NUMBER() OVER() row_number  FROM `psa-psa-cadena-qa.quality_data.vw_cp_forecast_completo`
         where  tipo='Forecast' and cantidad !=0
        and    substring(id,1,18) in ( select material from `psa-psa-cadena-qa.reporting_ecc_mx.vw_consolidado_codigos_sku`)

    ;;
  }




  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }


  dimension: row_number {
    primary_key: yes
    type: number
    sql: ${TABLE}.row_number ;;
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

  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.material,12,10) ;;
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

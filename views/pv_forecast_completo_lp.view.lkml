
view: pv_forecast_completo_lp {
  derived_table: {
    sql: SELECT * FROM `eon-bus-proj-cadena-demo.arima.Forecast_Completo_LP`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: sku {
    type: string
    sql: SUBSTR(${TABLE}.id,12,7) ;;
  }

  dimension: centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,4) ;;
  }

  dimension: mercado {
    type: string
    sql: SUBSTR(${TABLE}.id,25,50) ;;
  }




  dimension: cliente {
    label: "cliente"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(3)] ;;
  }



 # 000000000004000396_DN08_INT-FLP_537283__PISA___CALLE 7 VIDRIO



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

  set: detail {
    fields: [
        id,

  cantidad,
  tipo,
  prediction_interval_lower_bound,
  prediction_interval_upper_bound
    ]
  }
}

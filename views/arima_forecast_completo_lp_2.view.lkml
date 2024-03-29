
view: arima_forecast_completo_lp_2 {
  derived_table: {
    sql: select * from  eon-bus-proj-cadena-demo.modelo_de_calculo.Forecast_Completo_LP_2 ;;
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



  dimension: Sku {
    label: "Sku"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(0)] ;;
  }


  dimension: centro {
    label: "centro"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(1)] ;;
  }


  dimension: Mercado {
    label: "Mercado"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(2)] ;;
  }


  dimension: Cliente {
    label: "cliente"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(3)] ;;
  }

  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.Cantidad ;;
  }


  dimension_group: fecha {
    type: time
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


  measure: total_prediction_interval_lower_bound {
    type: sum
    sql: ${TABLE}.prediction_interval_lower_bound ;;
    value_format: "#,##0.00"
  }

  measure: Total_prediction_interval_upper_bound {
    type: sum
    sql: ${TABLE}.prediction_interval_upper_bound ;;
    value_format: "#,##0.00"
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

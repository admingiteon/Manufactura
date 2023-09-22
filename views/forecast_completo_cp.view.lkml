
view: forecast_completo_cp {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.modelo_de_calculo.forecast_completo_cp` ;;
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

  dimension: SKU {
    type: string
    sql:  SUBSTR(${id},1,18) ;;
  }

  dimension: CLIENTE {
    type: string
    sql:  SUBSTR(${id},20,10) ;;
  }

  dimension: CLASE_DOC {
    type: string
    sql:  SUBSTR(${id},31,2) ;;
  }



  dimension: POSICION {
    label: "VALOR PISICION"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(3)] ;;
  }

  dimension: CANAL_DISTRI {
    label: "CANAL DISTRIBUSION"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(4)] ;;
  }

  dimension: SOCIEDAD {
    label: "SOCIEDAD"
    type: string
    sql:    SUBSTR(SPLIT(${id}, '_')[OFFSET(5)],1,2) ;;
  }

  dimension: MERCADO {
    label: "MERCADO"
    type: string
    sql:    SUBSTR(SPLIT(${id}, '_')[OFFSET(5)],3,2) ;;
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


  measure: Total_prediction_interval_lower_bound {
    label: "Prediction interval lower bound"
    type: sum
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  measure: Total_prediction_interval_upper_bound {
    label: "Prediction interval upper bound"
    type: sum
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  measure: Total_cantidad {
    type: sum
    sql: ${TABLE}.Cantidad ;;
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

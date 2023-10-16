
view: forecast_completo_cp {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.modelo_de_calculo.forecast_completo_cp_` ;;
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

  dimension: id_compuesto {

    type: string
    sql:SUBSTR( ${TABLE}.id,12,100) ;;
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



  dimension: cliente_destinatario {
    label: "cliente destinatario"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(1)] ;;
  }

  dimension: centro {
    label: "centro"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(2)] ;;
  }

  dimension: clase_doc_ventas {
    label: "clase_doc_ventas"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(3)] ;;
  }

  dimension: valor_posicion {
    label: "valor_posicion"
    type: string
    sql:    SPLIT(${id}, '_')[OFFSET(4)] ;;
  }




  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }


  dimension: Semana {
    type: date
    sql:  DATE_ADD(CURRENT_DATE(), INTERVAL -12 WEEK)      ;;
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
    value_format: "0.00"
  }

  measure: Total_prediction_interval_upper_bound {
    label: "Prediction interval upper bound"
    type: sum
    sql: ${TABLE}.prediction_interval_upper_bound ;;
    value_format: "0.00"
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

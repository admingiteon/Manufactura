
view: datos_idp {
  derived_table: {
    sql: SELECT *  FROM `psa-psa-cadena-qa.entradas_y_salidas.forecast_completo_v1`

    ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_cantidad {
    type: sum
    sql: ${cantidad} ;;
    drill_fields: [detail*]
  }

  dimension: fecha {
    type: date
    datatype: date
    sql: ${TABLE}.fecha ;;
  }

  dimension_group: Fecha_operacion {
    label: "Fecha_operacion"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      month_name,
      year
    ]
    sql: CAST(${TABLE}.Fecha AS TIMESTAMP) ;;

  }



  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }

  set: detail {
    fields: [
        fecha,
  id,
  cantidad,
  tipo
    ]
  }
}

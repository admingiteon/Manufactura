
view: salida_cp_pt_fabricacion_1 {
  derived_table: {
    sql: select *, substring(id,1,18) as material from psa-psa-cadena-qa.modelo_de_calculo.CP_PT_Fabricacion_1 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: prioridad {
    type: number
    sql: ${TABLE}.Prioridad ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: Centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,10) ;;
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: cliente {
    type: string
    sql: ${TABLE}.cliente ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: cantidad_producible {
    type: number
    sql: ${TABLE}.cantidad_producible ;;
  }


  measure: Totalcantidad_requerida {
    type: sum
    sql: ${TABLE}.cantidad_requerida ;;
  }

  measure: Total_cantidad_producible {
    type: sum
    sql: ${TABLE}.cantidad_producible ;;
  }

  dimension: _producible {
    type: number
    sql: ${TABLE}.`%_producible` ;;
  }

  set: detail {
    fields: [
        id,
  prioridad,
  fecha_time,
  cliente,
  cantidad_requerida,
  cantidad_producible,
  _producible
    ]
  }
}

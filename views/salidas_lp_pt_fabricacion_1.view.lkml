
view: salidas_lp_pt_fabricacion_1 {
  derived_table: {
    sql: select * from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Fabricacion_Final` ;;
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

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: cantidad_producible {
    type: number
    sql: ${TABLE}.cantidad_producible ;;
  }

  dimension: _producible {
    type: number
    sql: ${TABLE}.`%_producible` ;;
  }
  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }


  dimension: Material {
    type: string
    sql: SUBSTR(${TABLE}.id,1,18) ;;
  }

  dimension: Centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,10) ;;
  }


  measure: Totalcantidad_requerida {
    label: "Cantidad requerida"
    type: sum
    sql: ${TABLE}.cantidad_requerida ;;
    value_format: "#,##0"
  }

  measure: Total_cantidad_producible {
    label: "Cantidad Producible"
    type: sum
    sql: ${TABLE}.cantidad_producible ;;
    value_format: "#,##0"
  }

  set: detail {
    fields: [
        id,
  prioridad,
  fecha_time,
  cantidad_requerida,
  cantidad_producible,
  _producible
    ]
  }
}

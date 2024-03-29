
view: salida_cp_pt_fabricacion_1 {
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

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  dimension: centro_suministrador {
    type: string
    sql: ${TABLE}.centro_suministrador ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }

  dimension: producible  {
    type: number
    sql: ${TABLE}.producible ;;
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

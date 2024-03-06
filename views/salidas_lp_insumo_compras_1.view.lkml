
view: salidas_lp_insumo_compras_1 {
  derived_table: {
    sql:select * from `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_Insumo_Compras_1`;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: componente {
    type: string
    sql: ${TABLE}.Componente ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  dimension_group: fecha_orden_de_compra {
    type: time
    sql: ${TABLE}.fecha_orden_de_compra ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: Centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,10) ;;
  }

  dimension: Material {
    type: string
    sql: SUBSTR(${TABLE}.id,1,18) ;;
  }


  set: detail {
    fields: [
        componente,
  id,
  fecha_inicio_produccion_time,
  fecha_orden_de_compra_time,
  cantidad_requerida
    ]
  }
}

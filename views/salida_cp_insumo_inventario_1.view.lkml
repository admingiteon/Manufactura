
view: salida_cp_insumo_inventario_1 {
  derived_table: {
    sql: SELECT *,
      substring(id,1,18) as material
      FROM `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_Insumo_Inventario_1` ;;
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

  dimension: Centro {
    type: string
    sql: SUBSTR(${TABLE}.id,20,10) ;;
  }

  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  dimension_group: fecha_orden_de_compra {
    type: time
    sql: ${TABLE}.fecha_orden_de_compra ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}.tipo ;;
  }

  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: material {
    type: string
    sql: ${TABLE}.material ;;
  }

  set: detail {
    fields: [
        componente,
  id,
  fecha_inicio_produccion_time,
  fecha_orden_de_compra_time,
  tipo,
  posicion_actual,
  material
    ]
  }
}

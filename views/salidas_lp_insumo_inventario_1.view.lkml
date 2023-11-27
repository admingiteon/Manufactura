
view: salidas_lp_insumo_inventario_1 {
  derived_table: {
    sql: select * from psa-psa-cadena-qa.modelo_de_calculo.LP_Insumo_Inventario_1 limit 1000 ;;
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

  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  set: detail {
    fields: [
        componente,
	id,
	fecha_inicio_produccion_time,
	fecha_orden_de_compra_time,
	posicion_actual
    ]
  }
}

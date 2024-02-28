
view: calculo_lp_pt_inventario_lu_1 {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Inventario_LU_1` LIMIT 10 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: fecha {
    type: time
    sql: ${TABLE}.fecha ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: cantidad {
    type: number
    sql: ${TABLE}.Cantidad ;;
  }

  dimension: posicion_actual {
    type: number
    sql: ${TABLE}.posicion_actual ;;
  }

  dimension: inventario_objetivo_proporcional {
    type: number
    sql: ${TABLE}.Inventario_Objetivo_Proporcional ;;
  }

  dimension: punto_pedido {
    type: number
    sql: ${TABLE}.punto_pedido ;;
  }

  dimension: cantidad_requerida {
    type: number
    sql: ${TABLE}.cantidad_requerida ;;
  }

  dimension: stock_seguridad {
    type: number
    sql: ${TABLE}.stock_seguridad ;;
  }

  dimension: tamano_lote_fabricacion {
    type: number
    sql: ${TABLE}.tamano_lote_fabricacion ;;
  }

  dimension_group: fecha_inicio_produccion {
    type: time
    sql: ${TABLE}.fecha_inicio_produccion ;;
  }

  set: detail {
    fields: [
        fecha_time,
	id,
	cantidad,
	posicion_actual,
	inventario_objetivo_proporcional,
	punto_pedido,
	cantidad_requerida,
	stock_seguridad,
	tamano_lote_fabricacion,
	fecha_inicio_produccion_time
    ]
  }
}

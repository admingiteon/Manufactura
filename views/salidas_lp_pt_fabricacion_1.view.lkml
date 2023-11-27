
view: salidas_lp_pt_fabricacion_1 {
  derived_table: {
    sql: select * from psa-psa-cadena-qa.modelo_de_calculo.LP_PT_Fabricacion_1 limit 1000 ;;
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

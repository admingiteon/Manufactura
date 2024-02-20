
view: prueba2 {
  derived_table: {
    sql: SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.prueba_ranks`  ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: vw_largo_plazo_trazabilidad_periodo_num {
    type: string
    sql: ${TABLE}.vw_largo_plazo_trazabilidad_periodo_num ;;
  }

  dimension: vw_largo_plazo_trazabilidad_orden_concepto {
    type: number
    sql: ${TABLE}.vw_largo_plazo_trazabilidad_orden_concepto ;;
  }

  dimension: vw_largo_plazo_trazabilidad_concepto {
    type: string
    sql: ${TABLE}.vw_largo_plazo_trazabilidad_concepto ;;
  }

  dimension: vw_largo_plazo_trazabilidad_total_cantidad_1 {
    type: number
    sql: ${TABLE}.vw_largo_plazo_trazabilidad_total_cantidad_1 ;;
  }


  measure: total_cantidad_1 {
    type: sum
    sql: ${TABLE}.vw_largo_plazo_trazabilidad_total_cantidad_1 ;;
  }

  dimension: z__pivot_col_rank {
    type: number
    sql: ${TABLE}.z__pivot_col_rank ;;
  }

  dimension: z___rank {
    type: number
    sql: ${TABLE}.z___rank ;;
  }

  dimension: z___min_rank {
    type: number
    sql: ${TABLE}.z___min_rank ;;
  }

  dimension: z___pivot_row_rank {
    type: number
    sql: ${TABLE}.z___pivot_row_rank ;;
  }

  dimension: z__pivot_col_ordering {
    type: number
    sql: ${TABLE}.z__pivot_col_ordering ;;
  }

  dimension: z__is_highest_ranked_cell {
    type: number
    sql: ${TABLE}.z__is_highest_ranked_cell ;;
  }

  set: detail {
    fields: [
        vw_largo_plazo_trazabilidad_periodo_num,
  vw_largo_plazo_trazabilidad_orden_concepto,
  vw_largo_plazo_trazabilidad_concepto,
  vw_largo_plazo_trazabilidad_total_cantidad_1,
  z__pivot_col_rank,
  z___rank,
  z___min_rank,
  z___pivot_row_rank,
  z__pivot_col_ordering,
  z__is_highest_ranked_cell
    ]
  }
}

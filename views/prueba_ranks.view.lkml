view: prueba_ranks {
  sql_table_name: `psa-psa-cadena-qa.reporting_ecc_mx.prueba_ranks` ;;

  dimension: vw_largo_plazo_trazabilidad_concepto {
    type: string
    sql: ${TABLE}.vw_largo_plazo_trazabilidad_concepto ;;
  }
  dimension: vw_largo_plazo_trazabilidad_orden_concepto {
    type: number
    sql: ${TABLE}.vw_largo_plazo_trazabilidad_orden_concepto ;;
  }
  dimension: vw_largo_plazo_trazabilidad_periodo_num {
    type: string
    sql: ${TABLE}.vw_largo_plazo_trazabilidad_periodo_num ;;
  }
  dimension: vw_largo_plazo_trazabilidad_total_cantidad_1 {
    type: number
    sql: ${TABLE}.vw_largo_plazo_trazabilidad_total_cantidad_1 ;;
  }
  dimension: z___min_rank {
    type: number
    sql: ${TABLE}.z___min_rank ;;
  }
  dimension: z___pivot_row_rank {
    type: number
    sql: ${TABLE}.z___pivot_row_rank ;;
  }
  dimension: z___rank {
    type: number
    sql: ${TABLE}.z___rank ;;
  }
  dimension: z__is_highest_ranked_cell {
    type: number
    sql: ${TABLE}.z__is_highest_ranked_cell ;;
  }
  dimension: z__pivot_col_ordering {
    type: number
    sql: ${TABLE}.z__pivot_col_ordering ;;
  }
  dimension: z__pivot_col_rank {
    type: number
    sql: ${TABLE}.z__pivot_col_rank ;;
  }
  measure: count {
    type: count
  }
}

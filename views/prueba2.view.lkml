
view: prueba2 {
  derived_table: {
    sql: WITH vw_largo_plazo_trazabilidad AS (SELECT * FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_trazabilidad` where sku in
          (SELECT sku FROM `psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_trazabilidad` where id_concepto=1)

      --    `psa-psa-cadena-qa.reporting_ecc_mx.vw_largo_plazo_trazabilidad`
       --   where sku in ( SELECT sku FROM psa-psa-cadena-qa.reporting_ecc_mx.tb_largo_plazo_trazabilidad where id_concepto=1)
      )
      SELECT * FROM (
      SELECT *, DENSE_RANK() OVER (ORDER BY z___min_rank) as z___pivot_row_rank, RANK() OVER (PARTITION BY z__pivot_col_rank ORDER BY z___min_rank) as z__pivot_col_ordering, CASE WHEN z___min_rank = z___rank THEN 1 ELSE 0 END AS z__is_highest_ranked_cell FROM (
      SELECT *, MIN(z___rank) OVER (PARTITION BY CAST(vw_largo_plazo_trazabilidad_orden_concepto AS STRING),CAST(vw_largo_plazo_trazabilidad_concepto AS STRING)) as z___min_rank FROM (
      SELECT *, RANK() OVER (ORDER BY vw_largo_plazo_trazabilidad_orden_concepto ASC, z__pivot_col_rank, vw_largo_plazo_trazabilidad_concepto) AS z___rank FROM (
      SELECT *, DENSE_RANK() OVER (ORDER BY CASE WHEN vw_largo_plazo_trazabilidad_periodo_num IS NULL THEN 1 ELSE 0 END, vw_largo_plazo_trazabilidad_periodo_num) AS z__pivot_col_rank FROM (
      SELECT
          vw_largo_plazo_trazabilidad.PeriodoNum  AS vw_largo_plazo_trazabilidad_periodo_num,
          vw_largo_plazo_trazabilidad.orden_concepto  AS vw_largo_plazo_trazabilidad_orden_concepto,
          vw_largo_plazo_trazabilidad.Concepto  AS vw_largo_plazo_trazabilidad_concepto,
          case when  vw_largo_plazo_trazabilidad.orden_concepto   in (1,2,3,5,6,7,8,9,10,11,12,13,14,16,18) then sum(vw_largo_plazo_trazabilidad.Cantidad)
                    when  vw_largo_plazo_trazabilidad.orden_concepto   in (4) then sum(( case when vw_largo_plazo_trazabilidad.orden_concepto=1 then vw_largo_plazo_trazabilidad.Cantidad else 0 end  ))
                    when  vw_largo_plazo_trazabilidad.orden_concepto   in (15,17) then max(vw_largo_plazo_trazabilidad.Cantidad)else  max(vw_largo_plazo_trazabilidad.Cantidad) end  AS vw_largo_plazo_trazabilidad_total_cantidad_1
      FROM vw_largo_plazo_trazabilidad
      WHERE (vw_largo_plazo_trazabilidad.Concepto ) <> 'INVENTARIO FINAL (QM)' OR (vw_largo_plazo_trazabilidad.Concepto ) IS NULL
      GROUP BY
          1,
          2,
          3) ww
      ) bb WHERE z__pivot_col_rank <= 16384
      ) aa
      ) xx
      ) zz
       WHERE (z__pivot_col_rank <= 50 OR z__is_highest_ranked_cell = 1) AND (z___pivot_row_rank <= 5000 OR z__pivot_col_ordering = 1) ORDER BY z___pivot_row_rank ;;
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

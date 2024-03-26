view: cobertura_fabricacion {
  derived_table: {
    sql: SELECT
    lp_pt_inv_lu_1.material,
    lp_pt_inv_lu_1.fecha,
    IF(lp_pt_inv_lu_1.cantidad_requerida IS NOT NULL, lp_pt_inv_lu_1.cantidad_requerida, 0) AS cantidad_requerida,
    IF(lp_pt_fab_fin.producible IS NOT NULL, lp_pt_fab_fin.producible, 0) AS cobertura_fab
FROM
    `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Inventario_LU_1` AS lp_pt_inv_lu_1
LEFT JOIN
    `eon-bus-proj-cadena-demo.modelo_de_calculo.LP_PT_Fabricacion_Final` AS lp_pt_fab_fin
ON
     (
                    Concat  (
                            lp_pt_inv_lu_1.material,
                            lp_pt_inv_lu_1.fecha

                            )
                    =
                    Concat  (
                            lp_pt_fab_fin.material,
                            lp_pt_fab_fin.fecha
                            )
      )

    ;;
  }

  dimension: material {
    type: string
    sql: SUBSTR(${TABLE}.material,12,50) ;;
  }

  dimension: fecha {
    type: date
    sql: ${TABLE}.fecha ;;
  }

  measure: cantidad_requerida {
    label: "Requerimiento de Fabricación"
    type: sum
    sql: ${TABLE}.cantidad_requerida ;;
  }

  measure: cobertura_fab{
    label: "Fabricación Final"
    type: sum
    sql: ${TABLE}.cobertura_fab ;;
  }

}
